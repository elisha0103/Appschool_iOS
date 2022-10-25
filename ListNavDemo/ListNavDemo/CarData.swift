//
//  CarData.swift
//  ListNavDemo
//
//  Created by 진태영 on 2022/10/25.
//

import Foundation
import UIKit
import SwiftUI



// JSON 파일 가져오기,
var carData: [Car] = loadJson("carData.json") // JSON 파일의 내용을 Car 구조체 타입의 배열에 저장!

// 배열 초기화 함수
func loadJson<T: Decodable>(_ filename: String) -> T{
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) // 파일과 확장 파일 가져오기
    else{
        fatalError("\(filename) not found.") // 파일 없는 경우 에러 처리
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch{
        fatalError("Could not load \(filename): \(error)")
    }
    
    do{
        return try JSONDecoder().decode(T.self, from: data)
    } catch{
        fatalError("Unable to parse \(filename): \(error)")
    }
}
