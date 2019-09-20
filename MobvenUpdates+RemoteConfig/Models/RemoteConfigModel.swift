//
//  RemoteConfigModel.swift
//  MobvenUpdate+RemoteConfig
//
//  Created by Rasid Ramazanov on 10.09.2019.
//  Copyright © 2019 Mobven Technology. All rights reserved.
//

import Foundation
import MobvenUpdates

struct RemoteConfigModel {
    
    private(set) var currentBuildNumber: Int
    private(set) var requiredBuildNumber: Int
    private let appVersion: Int = MobvenUpdates.shared.currentBuildNumber
    
    init(currentBuildNumber: Int, requiredBuildNumber: Int) {
        self.currentBuildNumber = currentBuildNumber
        self.requiredBuildNumber = requiredBuildNumber
    }
    
    var hasForceUpdate: Bool {
        return requiredBuildNumber > appVersion
    }
    
    var hasOptionalUpdate: Bool {
        return !hasForceUpdate && currentBuildNumber > appVersion
    }
    
}
