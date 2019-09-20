//
//  UserDetaultsExtension.swift
//  MobvenUpdate+RemoteConfig
//
//  Created by Rasid Ramazanov on 10.09.2019.
//  Copyright © 2019 Mobven Technology. All rights reserved.
//

import Foundation

// `UserDefaults` extension for MobvenUpdates.
extension UserDefaults {
    
    enum Keys: String {
        case remoteConfigIsStale = "REMOTE_CONFIG_STALE"
    }
    
    func setRemoteConfigState(stale: Bool) {
        set(stale, forKey: Keys.remoteConfigIsStale.rawValue)
    }
    
    var remoteConfigIsStale: Bool {
        return bool(forKey: Keys.remoteConfigIsStale.rawValue)
    }
    
}
