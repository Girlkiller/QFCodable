//
//  GLLiveStreamInfo.swift
//  QFCodable
//
//  Created by FengQIU on 2023/11/2.
//

@testable import QFCodable

struct GLLiveStreamInfo: QFCodable {
    var appid: Int?
    var cid: Int?
    var sid: Int?
    var whRatio: String?
    var stream: [GLLiveStreamItem]?
    var extend: GLLiveStreamExtend?
}

struct GLLiveStreamItem: QFCodable {
    struct GLLiveStreamItemExtend: QFCodable {
        var gearInfo: String?
        var line_infos: String?
        var stage: Int?
        var mix_token: String?
        var mix_ver: Int?
    }
    
    var a_encoderType: Int?
    var a_rate: Int?
    var a_stream_name: String?
    var v_encoderType: Int?
    var v_rate: Int?
    var v_stream_name: String?
    var pair: Int?
    var extend: GLLiveStreamItemExtend?
}


struct GLLiveStreamExtend: QFCodable {
    var layout: String?
    var uid64: Int?
}
