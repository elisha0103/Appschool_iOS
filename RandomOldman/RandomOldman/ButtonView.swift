//
//  ButtonView.swift
//  RandomOldman
//
//  Created by 진태영 on 2022/10/21.
//

import SwiftUI

struct ButtonView: View {
    @State var betting: String = "" // 내기 제목
    @State var randomNumber: Int = Int.random(in: 1...7) // 랜덤 꽝 숫자 생성
    @State var isDead: Bool = false // 꽝 상태변수
    
    @State var buttonDisabled: [Bool] = [false, false, false, false, false, false, false]  // 칼 선택 상태 변수
    
    var body: some View {
        ZStack{
            VStack {
               // Text("\(randomNumber)")
                Image("TongMan_2")  // 통아저씨 사진
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 700, height: 700)
            }
            Spacer()
            VStack{
                Spacer()
                Spacer()
                HStack{
                    // 1번 칼 버튼
                    Button(action:{
                        let buttonNumber = 1  // 칼 버튼 번호
                        compare(number: buttonNumber) // 이 버튼이 꽝 숫자와 맞는지
                        buttonDisabled[0] = true  // 선택된 버튼은 비활성화
                    }){
                        if !buttonDisabled[0] {  // 버튼 활성화 되어있으면
                            Image("RedKnife")  // 빨간 칼 이미지 출력
                                .resizable()
                                .modifier(KnifeButton())
                        } else {    // 버튼 비활성화시
                            Image("DisableKnife")  // 회색 칼 출력
                                .resizable()
                                .modifier(KnifeButton())
                        }
                    }
                    .disabled(buttonDisabled[0])  // 버튼 비활성화
                    .sheet(isPresented: self.$isDead) {  // 꽝이라면 ModaView 출력 (꽝 이미지)
                        ModalView(isDead: $isDead, buttonDisabled: $buttonDisabled, betting: $betting)
                    }
                    
                    
                    // 2번 칼 버튼
                    // 1번 버튼과 기능 동일
                    Button(action:{
                        let buttonNumber = 2
                        compare(number: buttonNumber)
                        buttonDisabled[1] = true
                    }){
                        if !buttonDisabled[1] {
                            Image("BlueKnife")
                                .resizable()
                                .modifier(KnifeButton())
                        } else {
                            Image("DisableKnife")
                                .resizable()
                                .modifier(KnifeButton())
                        }
                    }
                    .disabled(buttonDisabled[1])
                    .sheet(isPresented: self.$isDead) {
                        ModalView(isDead: $isDead, buttonDisabled: $buttonDisabled, betting: $betting)
                    }
                    
                    
                    // 3번 칼 버튼
                    // 1번 버튼과 기능 동일
                    Button(action:{
                        let buttonNumber = 3
                        compare(number: buttonNumber)
                        buttonDisabled[2] = true
                    }){
                        if !buttonDisabled[2] {
                            Image("GreenKnife")
                                .resizable()
                                .modifier(KnifeButton())
                        } else {
                            Image("DisableKnife")
                                .resizable()
                                .modifier(KnifeButton())
                        }
                    }
                    .disabled(buttonDisabled[2])
                    .sheet(isPresented: self.$isDead) {
                        ModalView(isDead: $isDead, buttonDisabled: $buttonDisabled, betting: $betting)
                    }
                    
                    
                    
                    // 4번 칼 버튼
                    // 1번 버튼과 기능 동일
                    Button(action:{
                        let buttonNumber = 4
                        compare(number: buttonNumber)
                        buttonDisabled[3] = true
                    }){
                        if !buttonDisabled[3] {
                            Image("YellowKnife")
                                .resizable()
                                .modifier(KnifeButton())
                        } else {
                            Image("DisableKnife")
                                .resizable()
                                .modifier(KnifeButton())
                        }
                    }
                    .disabled(buttonDisabled[3])
                    .sheet(isPresented: self.$isDead) {
                        ModalView(isDead: $isDead, buttonDisabled: $buttonDisabled, betting: $betting)
                    }
                    
                }
                .frame(width: 400, height: 100)
                .offset(x: 0, y: 50)
                
                HStack{
                    
                    // 5번 칼 버튼
                    // 1번 버튼과 기능 동일
                    Button(action:{
                        let buttonNumber = 5
                        compare(number: buttonNumber)
                        buttonDisabled[4] = true
                    }){
                        if !buttonDisabled[4] {
                            Image("YellowKnife")
                                .resizable()
                                .modifier(KnifeButton())
                        } else {
                            Image("DisableKnife")
                                .resizable()
                                .modifier(KnifeButton())
                        }
                    }
                    .disabled(buttonDisabled[4])
                    .sheet(isPresented: self.$isDead) {
                        ModalView(isDead: $isDead, buttonDisabled: $buttonDisabled, betting: $betting)
                    }
                    
                    
                    
                    // 6번 칼 버튼
                    // 1번 버튼과 기능 동일
                    Button(action:{
                        let buttonNumber = 6
                        compare(number: buttonNumber)
                        buttonDisabled[5] = true
                    }){
                        if !buttonDisabled[5] {
                            Image("BlueKnife")
                                .resizable()
                                .modifier(KnifeButton())
                        } else {
                            Image("DisableKnife")
                                .resizable()
                                .modifier(KnifeButton())
                        }
                    }
                    .disabled(buttonDisabled[5])
                    .sheet(isPresented: self.$isDead) {
                        ModalView(isDead: $isDead, buttonDisabled: $buttonDisabled, betting: $betting)
                    }
                    
                    
                    
                    // 7번 칼 버튼
                    // 1번 버튼과 기능 동일
                    Button(action:{
                        let buttonNumber = 7
                        compare(number: buttonNumber)
                        buttonDisabled[6] = true
                    }){
                        if !buttonDisabled[6] {
                            Image("RedKnife")
                                .resizable()
                                .modifier(KnifeButton())
                        } else {
                            Image("DisableKnife")
                                .resizable()
                                .modifier(KnifeButton())
                        }
                    }
                    .disabled(buttonDisabled[6])
                    .sheet(isPresented: self.$isDead) {
                        ModalView(isDead: $isDead, buttonDisabled: $buttonDisabled, betting: $betting)
                    }
                    
                }
                .frame(width: 300, height: 100)
                .offset(x: -30, y: 40)
                Spacer()
                HStack{
                    TextField("무슨 내기인가요?", text: $betting) // 배팅 내용
                        .multilineTextAlignment(.center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .border(.gray)
                        .padding(.horizontal, 200)
                    
                }
                

            }
        }
    }
    
    // 꽝버튼 비교함수
    func compare(number: Int) {
        if randomNumber == number { // 버튼 번호와 꽝 번호 맞으면
            isDead = true  // true 반환
            randomNumber = Int.random(in: 1...7) // 재시작을 위해 랜덤함수 재설정
        } else {
            isDead = false
        }
    }
}

// 칼 버튼 모델뷰
struct KnifeButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}

