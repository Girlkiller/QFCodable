//
//  GLLiveListResponse.swift
//  QFCodable
//
//  Created by FengQIU on 2023/11/2.
//

@testable import QFCodable

struct GLLiveListResponse: QFDecodable {
    var id: Int?
    var biz: String?
    var subBiz: String?
    var isLastPage: Bool = true
    var data: [GLLiveListItem]?
    var name: String?
    var message: String?
    var img: String?
    var moduleType: String?
}

enum GLLiveListItemType: Int, QFDecodable {
    case unknown = -1
    case live = 1
    case banner = 2
    case notInLiving = 3 //不在直播中的擂主
    
    static var supportedTypes: [GLLiveListItemType] {
        [.live, .banner, .notInLiving]
    }
}

struct GLLiveListItem: QFDecodable {
    var type: GLLiveListItemType
    var bannerDataVO: [GLBannerDataVOModel]?
    var anchorDataVO: GLAnchorDataVOModel?
    var uid: Int
    var layout: String
    
    static var modelCustomPropertyMapper: [String : QFCodableKeysMapperValue]? {
        ["uid": ["anchorDataVO.userId"],
         "layout": "anchorDataVO.streamInfo.extend.layout"]
    }
    
    static func decodingDefaultValue<CodingKeys>(for key: CodingKeys) -> Any? where CodingKeys : CodingKey {
        if key.stringValue == "type" {
            return GLLiveListItemType.unknown
        }
        return nil
    }
}
