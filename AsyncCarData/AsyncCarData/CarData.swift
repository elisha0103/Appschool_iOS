//
//  CarData.swift
//  AsyncCarData
//
//  Created by 진태영 on 2022/11/22.
//

import Foundation
import Combine

struct Cars: Codable, Hashable{
    var carData: [Car]
}

struct Car: Codable, Identifiable, Hashable{
    var id: String
    var name: String
    
    var description: String
    var isHybrid: Bool
    
    var imageName: String
}

class CarStore: ObservableObject{
    @Published var cars: [Car] // 게시된 프로퍼티
    
    init(cars: [Car] = []){
        self.cars = cars // 초기화로 전달된 배열을 게시자로 선정
    }
}
