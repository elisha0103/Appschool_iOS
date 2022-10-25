//
//  Car.swift
//  ListNavDemo
//
//  Created by 진태영 on 2022/10/25.
//

import Foundation

// 자동차 모델을 나타내는 구조체
struct Car: Codable, Identifiable{ // 이 타입의 인스턴스는 List 뷰에서 식별 가능
    var id: String
    var name: String
    
    var description: String
    var isHybrid: Bool
    
    var imageName: String
}
