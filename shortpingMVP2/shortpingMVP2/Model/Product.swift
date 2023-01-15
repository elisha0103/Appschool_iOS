//
//  Product.swift
//  shortpingMVP
//
//  Created by 정소희 on 2022/12/20.
//

import Foundation

struct Product: Hashable {
    
    var productId: String
    var brandLogo: String
    var brandName: String
    var productName: String
    var colors: [String]
    var imageList: [String]
    var likeCount: Int
    var mainCategory: String
    var price: String
    var sex: String
    var sizeList: [String]
    var subCategory: String
    
    var productReviews: [ProductReviews]
}

struct ProductReviews {
    var reviewerId: String
    var reviewText: String
    var createdAt: Double
    var ratings: [Int]
    
    var createdDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = "yyyy-MM-dd" // "yyyy-MM-dd HH:mm:ss"
        
        let dateCreatedAt = Date(timeIntervalSince1970: createdAt)
        
        return dateFormatter.string(from: dateCreatedAt)
    }
}
