//
//  Video.swift
//  shortpingMVP
//
//  Created by 정소희 on 2022/12/20.
//

import Foundation

struct Video {
    var videoId: String
    var viewCount: Int
    var LikeCount: Int
    var brandLogo: String
    var brandName: String
    var modelHeight: Int
    var modelWeight: Int
    var tags: [String]
    
    var modelProductList: [ModelProductList]
}

struct ModelProductList {
    var modelProductId: String
    var modelProductPrice: String
    var modelProductSize: String
}
