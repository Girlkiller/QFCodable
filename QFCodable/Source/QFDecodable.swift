//
//  QFDecodable.swift
//  QFDecodable
//
//  Created by FengQIU on 2023/11/2.
//

import Foundation

public protocol QFCodableDefaultValue {
    static func codableDefaultValue() -> Self
}

extension Bool: QFCodableDefaultValue {
    public static func codableDefaultValue() -> Bool {
        false
    }
}

extension Int: QFCodableDefaultValue {
    public static func codableDefaultValue() -> Int {
        0
    }
}

extension UInt: QFCodableDefaultValue {
    public static func codableDefaultValue() -> UInt {
        0
    }
}

extension Int8: QFCodableDefaultValue {
    public static func codableDefaultValue() -> Int8 {
        0
    }
}

extension UInt8: QFCodableDefaultValue {
    public static func codableDefaultValue() -> UInt8 {
        0
    }
}

extension Int16: QFCodableDefaultValue {
    public static func codableDefaultValue() -> Int16 {
        0
    }
}

extension UInt16: QFCodableDefaultValue {
    public static func codableDefaultValue() -> UInt16 {
        0
    }
}

extension Int32: QFCodableDefaultValue {
    public static func codableDefaultValue() -> Int32 {
        0
    }
}

extension UInt32: QFCodableDefaultValue {
    public static func codableDefaultValue() -> UInt32 {
        0
    }
}

extension Int64: QFCodableDefaultValue {
    public static func codableDefaultValue() -> Int64 {
        0
    }
}

extension Float: QFCodableDefaultValue {
    public static func codableDefaultValue() -> Float {
        0.0
    }
}

extension CGFloat: QFCodableDefaultValue {
    public static func codableDefaultValue() -> CGFloat {
        0.0
    }
}

extension Double: QFCodableDefaultValue {
    public static func codableDefaultValue() -> Double {
        0.0
    }
}

@available(iOS 14.0, *)
extension Float16: QFCodableDefaultValue {
    public static func codableDefaultValue() -> Float16 {
        0.0
    }
}

extension String: QFCodableDefaultValue {
    public static func codableDefaultValue() -> String {
        ""
    }
}

public protocol QFCodableKeysMapperValue {
    var mappingKeys: [String] { get }
}

extension String: QFCodableKeysMapperValue {
    public var mappingKeys: [String] {
        return [self]
    }
}

extension Array: QFCodableKeysMapperValue where Element == String {
    public var mappingKeys: [String] {
        return self
    }
}

public protocol QFDecodable: Codable {
    static var modelCustomPropertyMapper: [String: QFCodableKeysMapperValue]? { get }
    static func decodingDefaultValue<CodingKeys: CodingKey>(for key: CodingKeys) -> Any?
    static func shouldUseDefaultValue() -> Bool
    static func allowedTrueValues() -> [Any]?
}

public extension QFDecodable {
    static var modelCustomPropertyMapper: [String: QFCodableKeysMapperValue]? { nil }
    
    static func decodingDefaultValue<CodingKeys: CodingKey>(for key: CodingKeys) -> Any? {
        nil
    }
    
    static func shouldUseDefaultValue() -> Bool {
        true
    }
    
    /// will convert to lowercase words to compare
    static func allowedTrueValues() -> [Any]? {
        [true, 1, "1", "True", "yes"]
    }
}

public extension QFDecodable {
    init?(from data: Any?) {
        guard let data = data else { return nil }
        do {
            try self.init(data: data)
        } catch let error {
            print("[QFCodable] decode error: \(error)")
            return nil
        }
    }
    
    init?(data: Any?) throws {
        guard let data = data else { return nil }
        let decoder = QFJSONDecoder()
        if #available(iOS 15.0, *) {
            decoder.allowsJSON5 = true
        }
        self = try decoder.decode(Self.self, from: data)
    }
    
    static func model(from data: Any?) -> Result<Self, Error> {
        do {
            if let model = try Self(data: data) {
                return .success(model)
            }
            return .failure(QFJSONError.cannotConvertInputDataToUTF8)
        } catch {
            return .failure(error)
        }
    }
}

extension Array: QFDecodable where Array.Element: QFDecodable {
    
}

extension Dictionary: QFDecodable where Dictionary.Key: QFDecodable, Dictionary.Value: QFDecodable {
    
}
