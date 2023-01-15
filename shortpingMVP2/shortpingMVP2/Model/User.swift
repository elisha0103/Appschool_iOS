//
//  User.swift
//  shortpingMVP
//
//  Created by 정소희 on 2022/12/20.
//

import Foundation

struct User {
    var uid: String
    var userName: String
    var email: String
    
    var cart: [Cart]
    var history: [History]
}

struct Cart: Hashable {
    var productId: String
    var selectedColor: String
    var selectedSize: String
    var isMarked: Bool
}

struct History {
    var purchaseId: String
    var productId: String
    var purchasedAt: Double
    var isWritten: Bool
    var rating: Int
    var reviewText: String
    var selectedColor: String
    var selectedSize: String
    
    var purchasedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = "yyyy-MM-dd" // "yyyy-MM-dd HH:mm:ss"
        
        let dateCreatedAt = Date(timeIntervalSince1970: purchasedAt)
        
        return dateFormatter.string(from: dateCreatedAt)
    }
}
