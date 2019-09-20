//
//  StringExtension.swift
//  MobvenUpdates
//
//  Created by Rasid Ramazanov on 10.09.2019.
//  Copyright © 2019 Mobven Technology. All rights reserved.
//

import Foundation

extension String {
    
    var asURL: URL? {
        guard let string = addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return nil }
        return URL(string: string)
    }
    
}
