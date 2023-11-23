//
//  QFReusableResponse.swift
//  QFCodable
//
//  Created by FengQIU on 2023/11/2.
//

import Foundation
import QFCodable

public struct QFReusableResponse<T: QFDecodable>: QFDecodable {
    public var code: Int?
    public var msg: String?
    public var data: T?
    public var message: String?
}
