//
//  NumberSlider.swift
//  randomNumber
//
//  Created by 진태영 on 2022/10/20.
//

import SwiftUI

struct NumberSlider: View {
    @State private var minNumberSlider: Double = 0 // 최소 숫자 설정
    @State private var maxNumberSlider: Double = 99 // 최대 숫자 설정
    @State private var isSliderOn = true  // 슬라이드 토글 변수
    @State var randomNumber: Int = 0  // 랜덤 선택 숫자
    
    var body: some View {
        VStack{
            Toggle("범위 선택하기", isOn: $isSliderOn) // slider 활성화
                .padding()
            
            if isSliderOn {
                // 최소 최대 슬라이더
                SliderView(minNumber: $minNumberSlider,  maxNumber: $maxNumberSlider)
            }
            
            // 랜덤으로 선택될 숫자 범위 출력
            Text("선택된 범위는 \(Int(minNumberSlider)) ~ \(Int(maxNumberSlider))입니다.")
            
            // 범위 내 랜덤 숫자 생성
            Button(action: generateRandomNumber) {
                Text("숫자 생성하기")
            }
            
            // Text("\(randomNumber)") // 생성된 숫자 보기
            GetNumberView(randomNumber: self.$randomNumber)
            Spacer()
            
        }
    }

    // 랜덤 숫자 생성 함수
    func generateRandomNumber() {
        self.randomNumber = Int.random(in: Int(minNumberSlider)...Int(maxNumberSlider))
        // 슬라이더에 의해 선택된 것을 범위로 지정
    }
    
}

// 최소 최대 슬라이더
struct SliderView: View{
    @Binding var minNumber: Double
    @Binding var maxNumber: Double
    
    var body: some View{
        VStack{
            Text("최소값")
                .multilineTextAlignment(.leading)
            Slider(value: $minNumber, in: 0...99, step: 1)
                .padding()
            Text("최대값")
                .multilineTextAlignment(.leading)
            Slider(value: $maxNumber, in: 0...99, step: 1)
                .padding()
        }
        
    }
}

struct NumberSlider_Previews: PreviewProvider {
    static var previews: some View {
        NumberSlider()
    }
}
