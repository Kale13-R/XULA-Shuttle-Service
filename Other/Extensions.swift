//
//  Extensions.swift
//  XULA Shuttle Service
//
//  Created by Kaleb Riley on 3/26/24.
//

import Foundation

extension Encodable { //read up on codable and encodable
    func asDictionary() -> [String:Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch { //if an error occurs throw bac an empty dictionary
            return [:]
        }
    }
}
