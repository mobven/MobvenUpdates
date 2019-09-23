//
//  RemoteConfigExtension.swift
//  MobvenUpdate+RemoteConfig
//
//  Created by Rasid Ramazanov on 10.09.2019.
//  Copyright © 2019 Mobven Technology. All rights reserved.
//

import Foundation
import FirebaseRemoteConfig
import MobvenUpdates

// `RemoteConfig` extension for MobvenUpdates.
extension RemoteConfig {
    
    /// Duration that defines how long fetched config data is available, in seconds.
    /// When the config data expires, a new fetch is required.
    private static var expirationDuration = TimeInterval(1800)
    
    /// MobvenUpdates-specific `RemoteConfig` keys.
    enum Keys: String {
        case currentBuildNumber = "mobvenupdates_current_build_number"
        case requiredBuildNumber = "mobvenupdates_required_build_number"
    }
    
    var currentBuildNumber: Int? {
        return configValue(forKey: Keys.currentBuildNumber.rawValue).numberValue?.intValue
    }
    
    var requiredBuildNumber: Int? {
        return configValue(forKey: Keys.requiredBuildNumber.rawValue).numberValue?.intValue
    }
    
    var remoteConfigModel: RemoteConfigModel? {
        guard let currentBuildNumber = currentBuildNumber,
            let requiredBuildNumber = requiredBuildNumber else { return nil }
        return RemoteConfigModel(currentBuildNumber: currentBuildNumber, requiredBuildNumber: requiredBuildNumber)
    }
    
    func initalizeConfig(inDeveloperMode isDeveloperModeEnabled: Bool) {
        configSettings = RemoteConfigSettings()
        // If your app is using developer mode, expirationDuration is set to 0, so each fetch will
        // retrieve values from the service.
        if isDeveloperModeEnabled || UserDefaults.standard.remoteConfigIsStale {
            RemoteConfig.expirationDuration = 0
        }
    }
    
    func fetchRemoteConfig(_ completion: @escaping ((MobvenUpdatesResult?) -> Void)) {
        fetch(withExpirationDuration: RemoteConfig.expirationDuration) { [ weak self ] (fetchStatus, error) in
            if fetchStatus == .success {
                UserDefaults.standard.setRemoteConfigState(stale: false)
                self?.activate(completionHandler: { (error) in
                    if let error = error {
                        debugPrint("MobvenUpdates: RemoteConfig.activate() failed with error: \(error.localizedDescription)")
                    }
                })
            }
            if let remoteConfigModel = self?.remoteConfigModel {
                completion(
                    MobvenUpdatesResult(
                        hasUpdate: remoteConfigModel.hasOptionalUpdate || remoteConfigModel.hasForceUpdate,
                        isForce: remoteConfigModel.hasForceUpdate,
                        appStoreUrl: nil)
                )
            } else {
                completion(nil)
            }
        }
    }
    
}
