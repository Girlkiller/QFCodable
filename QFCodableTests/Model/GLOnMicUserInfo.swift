//
//  GLOnMicUserInfo.swift
//  QFCodable
//
//  Created by FengQIU on 2023/11/2.
//

@testable import QFCodable

enum OnMicUserGender: String, QFDecodable {
    case male = "MALE"
    case female = "FEMALE"
    case unkown = ""
}

struct GLOnMicUserInfo: QFDecodable {
    var uid: Int64
    var logo: String?
    var gender: OnMicUserGender
    
    static func decodingDefaultValue<CodingKeys>(for key: CodingKeys) -> Any? where CodingKeys : CodingKey {
        if key.stringValue == "gender" {
            return OnMicUserGender.unkown
        }
        return nil
    }
}
