//
//  claHistory.swift
//  Calc-twoNumber
//
//  Created by 진태영 on 2022/10/14.
//

import Foundation
import UIKit

func historyPrint(arrayString: inout [String], printLabel: UILabel) -> [String]{
    var arrayString: [String] = arrayString  // 전달받은 기록 배열
    let itemCount = arrayString.count  // 기록 배열의 유닛 수
    var totalText: String = ""  // 기록 창에 띄울 문자열 저장 변수
    if itemCount == 6{  // 기록 최대 5개유지하도록 하는 조건문
        arrayString.remove(at: 0)   // 5개 넘어가면(6개) 제일 과거(0번 인덱스) 삭제
    
    }
    for astring in arrayString{
        totalText += "\(astring)\n"  // totalText 변수에 계산 기록 한개씩 꺼내고 줄바꿈까지 처리한 상태로 하나의 문자열 형태로 저장
    }
    printLabel.text = totalText  // 기록 라벨에 출력
    totalText = ""  // 다음번 출력을 위한 초기화
    
    return arrayString  // 변경된 배열 반환
    
}
