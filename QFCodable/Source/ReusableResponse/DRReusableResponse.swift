//
//  DRReusableResponse.swift
//  QFCodable
//
//  Created by FengQIU on 2023/11/2.
//

import Foundation

public struct GLReusableResponse<T: QFCodable>: QFCodable {
    public var code: Int?
    public var msg: String?
    public var data: T?
    public var message: String?
}
