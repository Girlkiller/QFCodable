//
//  GLAnchorDataVOModel.swift
//  QFCodable
//
//  Created by FengQIU on 2023/11/2.
//

@testable import QFCodable

enum GLAnchorChannelType: Int, QFCodable {
    case unknown = -1
    case normal = 0
    case official = 1
    case union = 2
    case chatRoom = 3
    case privateChannel = 4
    case voicePersonal = 5
    case voiceUnion = 6
}

final class GLAnchorDataVOModel: QFCodable {
    var uid: Int
    var sid: Int
    var ssid: Int?
    var label: String?
    var hotVal: Int?
    var cover: String?
    var title: String?
    var templateId: Int?
    var nick: String?
    var streamInfo: GLLiveStreamInfo?
    var disliked: Bool?
    var challengeAward: GLChallengeAwardVOModel?
    var roomStatus: Int?
    var channelType: GLAnchorChannelType?
    var onMicUserInfoList: [GLOnMicUserInfo]?
    
    static func shouldUseDefaultValue() -> Bool {
        true
    }
    
    static func decodingDefaultValue<CodingKeys>(for key: CodingKeys) -> Any? where CodingKeys : CodingKey {
        if key.stringValue == "sid" {
            return 0
        } else if key.stringValue == "channelType" {
            return GLAnchorChannelType.unknown
        }
        
        return nil
    }
}
