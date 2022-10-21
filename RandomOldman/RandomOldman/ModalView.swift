//
//  ModalView.swift
//  RandomOldman
//
//  Created by 최한호 on 2022/10/21.
//

import SwiftUI

struct ModalView: View {
    @Environment(\.presentationMode) var presentation
    
    @Binding var isDead: Bool  // 꽝 상태변수
    @Binding var buttonDisabled: [Bool]  // 칼 활성/비활성 상태 배열
    @Binding var betting: String // 배팅 내용 변수
    
    var body: some View {
        VStack {
            HStack{
                Text("\(betting)")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.red)
                    .fontWeight(.bold)
                Text("에 당첨되었습니다!")
                    .font(.title3)
            }
            
            // 꽝 이미지 출력
            Image("TongOUT_2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 500, height: 500)
            
            // 다시하기 버튼
            Button(action: {
                isDead = false // 꽝 상태변수 초기화
                buttonDisabled = [false, false, false, false, false, false, false] // 칼 활성/비활성 상태배열 초기화
                presentation.wrappedValue.dismiss()
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
