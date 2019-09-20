//
//  MobvenUpdatesResult.swift
//  MobvenUpdates
//
//  Created by Rasid Ramazanov on 10.09.2019.
//  Copyright © 2019 Mobven Technology. All rights reserved.
//

import Foundation

public struct MobvenUpdatesResult {
    
    public private(set) var hasUpdate: Bool
    public private(set) var isForce: Bool
    public private(set) var appStoreUrl: URL?
    
    public init(hasUpdate: Bool, isForce: Bool = false, appStoreUrl: URL?) {
        self.hasUpdate = hasUpdate
        self.isForce = isForce
        self.appStoreUrl = appStoreUrl
    }
    
}
