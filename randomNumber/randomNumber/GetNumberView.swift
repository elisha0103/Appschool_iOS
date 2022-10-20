//
//  GetNumber.swift
//  randomNumber
//
//  Created by 홍진표 on 2022/10/20.
//

import SwiftUI

struct GetNumberView: View {
    @State var iNumber: Int = 0  // 사용자에 의해 입력되는 숫자
    @State var isCorrect: Bool = false   // 정답 버튼 활성화 상태 변수
    @State var isInCorrect: Bool = false  // 오답 버튼 활성화 상태 태변수
    @Binding var randomNumber: Int
    
    var body: some View {
        ZStack(alignment: .top) {  // 정답, 오답 버튼 플로팅하기 위해 ZStack 사용
            VStack {
                HStack {
                    Button("\(Image(systemName: "minus.circle"))") {  // 사용자 입력 숫자 - 1 버튼
                        if (iNumber > 0) {
                            iNumber -= 1
                        }
                    }
                    
                    // 사용자 입력 텍스트
                    TextField("input", value: $iNumber, formatter: NumberFormatter())
                        .border(.blue)
                        .multilineTextAlignment(.center)
                        .keyboardType(.decimalPad)
                    
                    // 사용자 입력 숫자 + 1 버튼
                    Button("\(Image(systemName: "plus.circle"))") {
                        if (iNumber < 99) {
                            iNumber += 1
                        }
                    }
                }
                .padding(100)
                
                // 확인 버튼
                Button(action: verifiNumber) {  // 랜덤 숫자와 입력 숫자 비교 함수 실행
                    Text("확인")
                }
            }
            Spacer()
            
            // 정답인 경우 정답 버튼 활성화
            if isCorrect{
                Button(action:{isCorrect = !isCorrect}){  // 버튼 누르면 정답 버튼 비활성화 됨 (사라짐)
                    Image("Magician")
                        .resizable()
                        .frame(width: 160, height: 160)
                        .cornerRadius(8)
                }
            }
            
            // 오답인 경우 오답 버튼 활성화
            if isInCorrect{
                Button(action: {isInCorrect = !isInCorrect}){  // 버튼 누르면 오답 버튼 비활성화 됨 (사라짐)
                    Image("incorrect")
                        .resizable()
                        .frame(width: 160, height: 160)
                        .cornerRadius(8)
                }
            }
        }
        
    }
    
    func verifiNumber() {
        // 랜덤 숫자와 사용자 입력 숫자 서로 비교
        if self.randomNumber == self.iNumber {
            self.isCorrect = true
            self.isInCorrect = false
        } else {
            self.isCorrect = false
            self.isInCorrect = true
        }
    }
    
    //    @ViewBuilder func verifiNumber() -> some View {
    //        if randomNumber == iNumber {
    //            print("correct")
    //            return Button(action: {
    //                isCorrect = !isCorrect
    //            }) {
    //                Image("Magician")
    //                    .border(.blue, width: 8)
    //                    .cornerRadius(8)
    //            }
    //        } else {
    //            print("incorrect")
    //            return Button(action: { isCorrect = !isCorrect}) {
    //                Image("Magician")
    //                    .border(.black, width: 20)
    //                    .cornerRadius(8)
    //            }
    //        }
    //    }
}

//struct GetNumberView_Previews: PreviewProvider {
//    static var previews: some View {
//        GetNumberView()
//    }
//}
