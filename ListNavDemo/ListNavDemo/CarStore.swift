//
//  CarStore.swift
//  ListNavDemo
//
//  Created by 진태영 on 2022/10/25.
//

import Foundation
import Combine
import SwiftUI

// 최신 데이터가 항상 표시되어야 하므로, Observable 객체에 의존해야하기 때문에 Observable 객체를 생성
class CarStore: ObservableObject{
    @Published var cars: [Car] // 게시된 프로퍼티
    
    init(cars: [Car] = []){
        self.cars = cars // 초기화로 전달된 배열을 게시자로 선정
    }
}
