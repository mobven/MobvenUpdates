//
//  MobvenUpdates.swift
//  MobvenUpdates
//
//  Created by Rasid Ramazanov on 26.08.2019.
//  Copyright © 2019 Mobven Technology. All rights reserved.
//

import Foundation

public protocol MobvenUpdatesRemoteConfigDelegate: class {
    func mobvenUpdatesReceivedUpdate(_ result: MobvenUpdatesResult)
}

public final class MobvenUpdates {
    
    private static var sharedInstance: MobvenUpdates?
    
    /// Returns singleton MobvenUpdates instance.
    public class var shared: MobvenUpdates {
        if let sharedInstance = sharedInstance {
            return sharedInstance
        } else {
            sharedInstance = MobvenUpdates()
            return sharedInstance!
        }
    }
    
    private init() {
        bundleId = Bundle.main.bundleIdentifier ?? ""
        currentVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        currentBuildNumber = Int(Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "") ?? 0
    }
    
    /// Bundle identifier to be checked from itunes for update.
    /// Default value is Bundle.main.bundleIdentifier
    public var bundleId: String!
    
    /// Application version to be compared with version received from itunes.
    /// Default value is Bundle.main.infoDictionary?["CFBundleShortVersionString"]
    public var currentVersion: String
    
    /// Application build number to be compared with Firebase RemoteConfig.
    /// Default value is Bundle.main.infoDictionary?["CFBundleVersion"]
    public var currentBuildNumber: Int
    
    /// App Store URL of the application.
    /// Default value is received from itunes API.
    public var appStoreURL: URL?
    
    /// The region or country of an App Store in which the app is available.
    /// By default, all version check requests are performed against the US App Store.
    /// If the app is not available in the US App Store, set it to the identifier of at least one App Store region within which it is available.
    ///
    /// [List of country codes](https://help.apple.com/app-store-connect/#/dev997f9cf7c)
    ///
    public var countryCode: String?
    
    /// Subscribed to inform application when silent notification about force-update triggered from Firebase functions.
    weak public var mobvenUpdatesDelegate: MobvenUpdatesRemoteConfigDelegate?
    
    /**
     Checks for updates from itunes by comparing `currentVersion` with you app's current version.
     
     - parameter completion: Completion handler with result `MobvenUpdatesResult` which is checked only from itunes api and `isForce` value will be always false. To support force-update implementation, see MobvenUpdates+RemoteConfig framework documentation.
     */
    public func checkUpdates(_ completion: @escaping ((MobvenUpdatesResult) -> Void)) {
        APIManager.default.checkForUpdates(completion)
    }
    
}
