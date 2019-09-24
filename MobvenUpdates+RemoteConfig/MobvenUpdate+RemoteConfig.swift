//
//  MForceUpdate+RemoteConfig.swift
//  MobvenUpdate+RemoteConfig
//
//  Created by Rasid Ramazanov on 04.09.2019.
//  Copyright © 2019 Mobven Technology. All rights reserved.
//

import Foundation
import MobvenUpdates
import FirebaseRemoteConfig
import FirebaseCore

extension MobvenUpdates {
    
    /// Used to subscribe firebase messaging topic which is also declared in Firebase functions to send silent push notifications to devices about remote config parameter updates.
    public static let firebaseTopicPushRC = "MOBVENUPDATES_TOPIC_PUSH_RC"
    
    /// Remote Config configuration namespace.
    private static let remoteConfigState = "MOBVENUPDATES_REMOTE_CONFIG_STATE"
    
    private static var remoteConfig: RemoteConfig!
    
    /// Calls `FirebaseApp.configure` inside the framework and sets the things up.
    public func setup(isDeveloperModeEnabled: Bool = false) {
        FirebaseApp.configure()
        MobvenUpdates.remoteConfig = RemoteConfig.remoteConfig()
        MobvenUpdates.remoteConfig.initalizeConfig(inDeveloperMode: isDeveloperModeEnabled)
    }
    
    /**
     This delegate method offers an opportunity for applications with the "remote-notification" background mode to fetch appropriate new data in response to an incoming remote notification. You should call the fetchCompletionHandler as soon as you're finished performing that operation, so the system can accurately estimate its power and data cost.
     
     This method will be invoked even if the application was launched or resumed because of the remote notification. The respective delegate methods will be invoked first. Note that this behavior is in contrast to application:didReceiveRemoteNotification:, which is not called in those cases, and which will not be invoked if this method is implemented.
     
     - returns: Returns `true` if received remote notification is MobvenUpdates's silet notification, `false` otherwise. Your app does not have to handle anything if returned value is `true`. If returned value is `false`, you should handle result with completionHandler.
     */
    public func applicationDidReceiveRemoteNotification(userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) -> Bool {
        guard userInfo.index(forKey: MobvenUpdates.remoteConfigState) != nil else { return false }
        debugPrint("MobvenUpdate: Config set to stale")
        UserDefaults.standard.setRemoteConfigState(stale: true)
        checkUpdatesWithRemoteConfig { [ weak self ] (result) in
            self?.mobvenUpdatesDelegate?.mobvenUpdatesReceivedUpdate(result)
        }
        completionHandler(.newData)
        return true
    }
    
    /**
     Checks for updates from Firebase Remote Config by comparing `mobvenupdates_required_build_number` and `mobvenupdates_current_build_number` parameters with you app's current build number.
     
     If no update received from remote config parameters, `MobvenUpdates.checkUpdates` implementation will be used to check update with itunes.
     
     - parameter completion: Completion handler with result `MobvenUpdatesResult`.
     */
    public func checkUpdatesWithRemoteConfig(_ completion: @escaping ((MobvenUpdatesResult) -> Void)) {
        MobvenUpdates.remoteConfig.fetchRemoteConfig({ [ weak self ] (remoteConfigResult) in
            if let remoteConfigResult = remoteConfigResult {
                self?.checkUpdatesAfterRemoteConfig(remoteConfigResult, completion)
            } else {
                // No update received from Remote Config.
                // Result received from itunes is valid.
                self?.checkUpdatesAfterRemoteConfig(nil, completion)
            }
        })
    }
    
    private func checkUpdatesAfterRemoteConfig(_ remoteConfigResult: MobvenUpdatesResult?, _ completion: @escaping ((MobvenUpdatesResult) -> Void)) {
        checkUpdates { (result) in
            if result.hasUpdate, let remoteConfigResult = remoteConfigResult {
                DispatchQueue.main.async {
                    completion(
                        MobvenUpdatesResult(hasUpdate: remoteConfigResult.hasUpdate,
                                            isForce: remoteConfigResult.isForce,
                                            appStoreUrl: result.appStoreUrl))
                }
            } else {
                DispatchQueue.main.async {
                    completion(result)
                }
            }
        }
    }
    
}
