//
//  Utility.swift
//  News Pulse
//
//  Created by alagu-raja
//

import UIKit

class Utility: NSObject {
    static let shared = Utility()
    
    // Define a generic method to decode JSON data
    func decodeJSON<T: Decodable>(data: Data, modelType: T.Type) -> Result<T, Error> {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(modelType, from: data)
            return .success(decodedData)
        } catch {
            return .failure(error)
        }
    }
}
