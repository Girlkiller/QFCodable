//
//  Encodable+Json.swift
//  QFCodable
//
//  Created by FengQIU on 2023/11/2.
//

import Foundation

extension Encodable {
    public func jsonData() -> Data? {
        if self is String {
           return (self as? String)?.data(using: .utf8)
        }
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        encoder.dateEncodingStrategy = .iso8601
        return try? encoder.encode(self)
    }
    
    public func jsonObject() -> [String: Any]? {
        guard let data = jsonData(),
              let json = try? JSONSerialization.jsonObject(with: data, options: []),
              let dictionary = json as? [String : Any] else {
            return nil
        }
        return dictionary
    }
    
    public func jsonString() -> String? {
        guard let data = jsonData(), let jsonString = String(data: data, encoding: .utf8) else { return nil }
        return jsonString
    }
    
    public func toModel<T: QFCodable>() -> T? {
        guard let data = jsonData() else { return nil }
        let model = T(from: data)
        return model
    }
}
