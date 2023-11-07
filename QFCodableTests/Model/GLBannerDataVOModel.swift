//
//  GLBannerDataVOModel.swift
//  QFCodable
//
//  Created by FengQIU on 2023/11/2.
//

@testable import QFCodable

public struct GLBannerDataVOModel: Equatable, QFCodable {
    var id: Int?
    var img: String?
    var ordering: Int?
    var jump: String?
}
