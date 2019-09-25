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
import FirebaseAnalytics

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

extension MobvenUpdates {
    
    /// Logs an app event. The event can have up to 25 parameters. Events with the same name must have
    /// the same parameters. Up to 500 event names are supported. Using predefined events and/or
    /// parameters is recommended for optimal reporting.
    ///
    /// The following event names are reserved and cannot be used:
    /// <ul>
    ///     <li>ad_activeview</li>
    ///     <li>ad_click</li>
    ///     <li>ad_exposure</li>
    ///     <li>ad_impression</li>
    ///     <li>ad_query</li>
    ///     <li>adunit_exposure</li>
    ///     <li>app_clear_data</li>
    ///     <li>app_remove</li>
    ///     <li>app_update</li>
    ///     <li>error</li>
    ///     <li>first_open</li>
    ///     <li>in_app_purchase</li>
    ///     <li>notification_dismiss</li>
    ///     <li>notification_foreground</li>
    ///     <li>notification_open</li>
    ///     <li>notification_receive</li>
    ///     <li>os_update</li>
    ///     <li>screen_view</li>
    ///     <li>session_start</li>
    ///     <li>user_engagement</li>
    /// </ul>
    ///
    /// @param name The name of the event. Should contain 1 to 40 alphanumeric characters or
    ///     underscores. The name must start with an alphabetic character. Some event names are
    ///     reserved. See FIREventNames.h for the list of reserved event names. The "firebase_",
    ///     "google_", and "ga_" prefixes are reserved and should not be used. Note that event names are
    ///     case-sensitive and that logging two events whose names differ only in case will result in
    ///     two distinct events.
    /// @param parameters The dictionary of event parameters. Passing nil indicates that the event has
    ///     no parameters. Parameter names can be up to 40 characters long and must start with an
    ///     alphabetic character and contain only alphanumeric characters and underscores. Only NSString
    ///     and NSNumber (signed 64-bit integer and 64-bit floating-point number) parameter types are
    ///     supported. NSString parameter values can be up to 100 characters long. The "firebase_",
    ///     "google_", and "ga_" prefixes are reserved and should not be used for parameter names.
    public func logEvent(_ name: String, parameters: [String : Any]?) {
        Analytics.logEvent(name, parameters: parameters)
    }
    
    
    /// Sets a user property to a given value. Up to 25 user property names are supported. Once set,
    /// user property values persist throughout the app lifecycle and across sessions.
    ///
    /// The following user property names are reserved and cannot be used:
    /// <ul>
    ///     <li>first_open_time</li>
    ///     <li>last_deep_link_referrer</li>
    ///     <li>user_id</li>
    /// </ul>
    ///
    /// @param value The value of the user property. Values can be up to 36 characters long. Setting the
    ///     value to nil removes the user property.
    /// @param name The name of the user property to set. Should contain 1 to 24 alphanumeric characters
    ///     or underscores and must start with an alphabetic character. The "firebase_", "google_", and
    ///     "ga_" prefixes are reserved and should not be used for user property names.
    public func setUserProperty(_ value: String?, forName name: String) {
        Analytics.setUserProperty(value, forName: name)
    }
    
    
    /// Sets the user ID property. This feature must be used in accordance with
    /// <a href="https://www.google.com/policies/privacy">Google's Privacy Policy</a>
    ///
    /// @param userID The user ID to ascribe to the user of this app on this device, which must be
    ///     non-empty and no more than 256 characters long. Setting userID to nil removes the user ID.
    public func setUserID(_ userID: String?) {
        Analytics.setUserID(userID)
    }
    
    
    /// Sets the current screen name, which specifies the current visual context in your app. This helps
    /// identify the areas in your app where users spend their time and how they interact with your app.
    /// Must be called on the main thread.
    ///
    /// Note that screen reporting is enabled automatically and records the class name of the current
    /// UIViewController for you without requiring you to call this method. If you implement
    /// viewDidAppear in your UIViewController but do not call [super viewDidAppear:], that screen class
    /// will not be automatically tracked. The class name can optionally be overridden by calling this
    /// method in the viewDidAppear callback of your UIViewController and specifying the
    /// screenClassOverride parameter. setScreenName:screenClass: must be called after
    /// [super viewDidAppear:].
    ///
    /// If your app does not use a distinct UIViewController for each screen, you should call this
    /// method and specify a distinct screenName each time a new screen is presented to the user.
    ///
    /// The screen name and screen class remain in effect until the current UIViewController changes or
    /// a new call to setScreenName:screenClass: is made.
    ///
    /// @param screenName The name of the current screen. Should contain 1 to 100 characters. Set to nil
    ///     to clear the current screen name.
    /// @param screenClassOverride The name of the screen class. Should contain 1 to 100 characters. By
    ///     default this is the class name of the current UIViewController. Set to nil to revert to the
    ///     default class name.
    public func setScreenName(_ screenName: String?, screenClass screenClassOverride: String?) {
        Analytics.setScreenName(screenName, screenClass: screenClassOverride)
    }
    
    
    /// Sets whether analytics collection is enabled for this app on this device. This setting is
    /// persisted across app sessions. By default it is enabled.
    ///
    /// @param analyticsCollectionEnabled A flag that enables or disables Analytics collection.
    public func setAnalyticsCollectionEnabled(_ analyticsCollectionEnabled: Bool) {
        Analytics.setAnalyticsCollectionEnabled(analyticsCollectionEnabled)
    }
    
    
    /// Sets the interval of inactivity in seconds that terminates the current session. The default
    /// value is 1800 seconds (30 minutes).
    ///
    /// @param sessionTimeoutInterval The custom time of inactivity in seconds before the current
    ///     session terminates.
    public func setSessionTimeoutInterval(_ sessionTimeoutInterval: TimeInterval) {
        Analytics.setSessionTimeoutInterval(sessionTimeoutInterval)
    }
    
    
    /// The unique ID for this instance of the application.
    public func appInstanceID() -> String {
        return Analytics.appInstanceID()
    }
    
    
    /// Clears all analytics data for this instance from the device and resets the app instance ID.
    /// FIRAnalyticsConfiguration values will be reset to the default values.
    public func resetAnalyticsData() {
        Analytics.resetAnalyticsData()
    }
    
}
