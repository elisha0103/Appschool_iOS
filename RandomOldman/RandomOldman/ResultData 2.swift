//
//  ResultData.swift
//  RandomOldman
//
//  Created by 진태영 on 2022/10/24.
//

import Foundation

class ResultData: ObservableObject, Identifiable {
    
    @Published var betting: String = ""  // 내기 제목
    @Published var isDead: Bool = false  // 꽝 상태변수
    @Published var buttonDisabled: [Bool] = [false, false, false, false, false, false, false]  // 칼 선택 상태 변수
    
    @Published var resultString: [String] = [] // 최근 결과 5개를 담을 String 배열
    
    @Published var tongCount: Int = 0 // 통아저씨 결과 개수
    @Published var roundingCount: Int = 0  // 돌림판 결과 개수
    
    @Published var tabNumber: Int = 1 // 탭 화면 넘버
    
    // 제어적인 부분은 클래스에서 해결할 수 있게
    
    init(){
        betting = self.betting
        
        
    }
    
    // 각 게임별 결과 저장 함수
    func addResult(game: String, betting: String){
        if !betting.isEmpty {
            if game == "[통아저씨]" {
                tongCount += 1
            } else if game == "[돌림판]" {
                roundingCount += 1
            }
            self.resultString.insert("\(game) \(betting) 당첨!", at: 0)
        } else {
            tongCount += 1
            self.resultString.insert("[통아저씨] 당첨!", at: 0)
        }
//        if self.resultString.count > 5 {
//            self.resultString.removeFirst()
//        }
    }
    
    // 통아저씨 게임 초기화 하기 위한 함수
    func reGame() {
        
        // 내기 결과 ResultData - resultString 에 넘기기
        // 밑의 코드는 제어적인 부분 : 뷰와 제어부를 나눠보자.  -> TODO :: ResultData Class 메서드로 만들기
        self.isDead = false // 꽝 상태변수 초기화
        self.buttonDisabled = [false, false, false, false, false, false, false] // 칼 활성/비활성 상태배열 초기화
        self.betting = "" // 내기 텍스트 초기화
    }
    
    
}
