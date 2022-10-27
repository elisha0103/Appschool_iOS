//
//  ModalView.swift
//  RandomOldman
//
//  Created by 최한호 on 2022/10/21.
//

import SwiftUI

struct ModalView: View {
    @Environment(\.presentationMode) var presentation
    
    @EnvironmentObject var resultData: ResultData
    
//    @Binding var isDead: Bool  // 꽝 상태변수
//    @Binding var buttonDisabled: [Bool]  // 칼 활성/비활성 상태 배열
//    @Binding var betting: String // 배팅 내용 변수
    
    var body: some View {
        VStack {
            HStack{
                Text("\(resultData.betting)")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.red)
                    .fontWeight(.bold)
                if !resultData.betting.isEmpty{
                    Text("에 ")
                        .font(.title3)
                }
                Text("당첨되었습니다!")
                    .font(.title3)
            }
            
            // 꽝 이미지 출력
            Image("TongOUT_2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            
            // 다시하기 버튼
            Button(action: {
                
                presentation.wrappedValue.dismiss()
                
                /*
                // 내기 결과 ResultData - resultString 에 넘기기
                // 밑의 코드는 제어적인 부분 : 뷰와 제어부를 나눠보자.  -> TODO :: ResultData Class 메서드로 만들기
                if !resultData.betting.isEmpty {
                    resultData.resultString.append("[통아저씨] \(resultData.betting) 당첨!")
                } else {
                    resultData.resultString.append("[통아저씨] 당첨!")
                }
                if resultData.resultString.count > 5 {
                    resultData.resultString.removeFirst()
                }
                
                resultData.isDead = false // 꽝 상태변수 초기화
                resultData.buttonDisabled = [false, false, false, false, false, false, false] // 칼 활성/비활성 상태배열 초기화
                resultData.betting = "" // 내기 텍스트 초기화
                 */
                resultData.addResult(game: "[통아저씨]", betting: resultData.betting)
                resultData.reGame()
            }) {
                Text("게임 다시하기")
                    .font(.title3)
            }
            .frame(width: 150, height: 30, alignment: .center)
            .font(.system(size: 16))
            //.foregroundColor(Color.black)
        }
    }
}


/*
 struct ModalView_Previews: PreviewProvider {
 static var previews: some View {
 ModalView()
 }
 }
 */
