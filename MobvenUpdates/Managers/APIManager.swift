//
//  APIManager.swift
//  MobvenUpdates
//
//  Created by Rasid Ramazanov on 10.09.2019.
//  Copyright © 2019 Mobven Technology. All rights reserved.
//

import Foundation

internal struct APIManager {
    
    public static let `default` = APIManager()
    
    func checkForUpdates(_ completion: @escaping ((MobvenUpdatesResult) -> Void)) {
        checkIfUpdateAvailable { (result) in
            let storeURL = MobvenUpdates.shared.appStoreURL ?? result?.appStoreUrl
            if let result = result, result.version != MobvenUpdates.shared.currentVersion {
                DispatchQueue.main.async {
                    completion(MobvenUpdatesResult(hasUpdate: true, appStoreUrl: storeURL))
                }
            } else {
                DispatchQueue.main.async {
                    completion(MobvenUpdatesResult(hasUpdate: false, appStoreUrl: storeURL))
                }
            }
        }
    }
    
    private func checkIfUpdateAvailable(trial: Int = 0, _ completion: @escaping ((ItunesModel.Result?) -> Void)) {
        guard let url = getItunesURL(with: MobvenUpdates.shared.bundleId, MobvenUpdates.shared.countryCode) else {
            return
        }
        URLSession(configuration: .default).dataTask(with: url, completionHandler: { (data, response, error) in
            self.fetchResult(trial, data, completion)
        }).resume()
    }
    
    private func fetchResult(_ trial: Int, _ data: Data?, _ completion: @escaping ((ItunesModel.Result?) -> Void)) {
        if let data = data {
            
            let apiModel = try? JSONDecoder().decode(ItunesModel.self, from: data)
            
            if let model = apiModel?.result {
                debugPrint("MobvenUpdates: Application version \(model.version) fetched from itunes.apple.com.")
                completion(model)
            } else {
                debugPrint("MobvenUpdates: Could not fetch data from itunes.apple.com for application bundle id.")
                completion(nil)
            }
            
        } else {
            
            if trial < 3 {
                debugPrint("MobvenUpdates: Failed to connect to itunes.apple.com. Retrying in 0.5 seconds.")
                Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (timer) in
                    self.checkIfUpdateAvailable(trial: trial + 1, completion)
                }
            } else {
                debugPrint("MobvenUpdates: Failed to connect to itunes.apple.com.")
                debugPrint("Assuming there is no force update for the application.")
                completion(nil)
            }
            
        }
    }
    
    private func getItunesURL(with bundleIdentifier: String, _ countryCode: String?) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "itunes.apple.com"
        components.path = "/lookup"
        
        var items = [
            URLQueryItem(name: "bundleId", value: bundleIdentifier)
        ]
        
        if let countryCode = countryCode {
            let item = URLQueryItem(name: "country", value: countryCode)
            items.append(item)
        }
        
        components.queryItems = items
        
        return components.url
    }
    
}
