//
//  ItunesModel.swift
//  MobvenUpdates
//
//  Created by Rasid Ramazanov on 10.09.2019.
//  Copyright © 2019 Mobven Technology. All rights reserved.
//

import Foundation

struct ItunesModel: Decodable {
    
    private var results: [ItunesResult]?
    
    var result: ItunesModel.Result? {
        guard let result = results?.last,
            let version = result.version
            else { return nil }
        return ItunesModel.Result(version: version, appStoreUrl: result.trackViewUrl?.asURL)
    }
    
    private struct ItunesResult: Decodable {
        
        fileprivate var version: String?
        fileprivate var trackViewUrl: String?
        
    }
    
    struct Result {
        private(set) var version: String
        private(set) var appStoreUrl: URL?
    }
    
}
