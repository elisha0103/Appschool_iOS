//
//  SliderView.swift
//  HelloSwiftUI
//
//  Created by 진태영 on 2022/10/19.
//

import SwiftUI

struct SliderAsyncImage: View {
    
    var colors : [Color] = [.black, .red, .green, .blue]
    var colornames = ["Black", "Red", "Green", "Blue"]
    
    //스테이트 변수
    @State private var rotation : Double = 0
    @State private var text : String = "Welcome to SwiftUI"
    @State private var colorIndex = 0
    //색상 RGB 상태 값
    @State private var red : Double = 0
    @State private var blue : Double = 0
    @State private var green : Double = 0
    //투명도
    @State private var opacity : Double = 1
    
    
    var body: some View {
        VStack {
            
            Text(text).font(.largeTitle)
                .fontWeight(.heavy)
                .rotationEffect(.degrees(self.rotation))// 회전 상태 프로퍼티 수정자
                .foregroundColor(Color(UIColor(red: red, green: green, blue: blue, alpha: opacity))) //State 바인딩 //self.colors[self.colorIndex]
                .animation(.easeInOut(duration: 5)
                ) //애니메이션 프로퍼티 수정자
            
            TextField("Enter text here" , text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle()) //텍스트필드 상태 수정자
                .padding()
            
            SliderView(red: self.$red, green: self.$green, blue: self.$blue, opacity: self.$opacity, rotation: self.$rotation)
            
//            Divider()
//
//            //현재 선택된 colorIndex 저장, 색상 이름 표시에 사용
//            Picker(selection: $colorIndex, label: Text("Color")){
//
//                ForEach(0 ..< colornames.count, id: \.self){
//                    Text(self.colornames[$0])
//                        .foregroundColor(self.colors[$0])
//                }
//            }.pickerStyle(WheelPickerStyle()) //3.0부터 버려짐 WheelPickerStyle
//                .padding()
//                .frame(height: 100)
        }
        .padding()
    }
}

struct SliderView: View {
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double
    @Binding var opacity: Double
    @Binding var rotation: Double
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("RED")
                .font(.title2)
                .foregroundColor(.red)
            
            Slider(value: $red, in: 0...1, step: 1/255)
            
            Text("GREEN")
                .font(.title2)
                .foregroundColor(.green)
            
            Slider(value: $green, in: 0...1, step: 1/255)
            
            Text("BLUE")
                .font(.title2)
                .foregroundColor(.blue)
    
            Slider(value: $blue, in: 0...1, step: 1/255)
  
            Text("OPACITY")
                .font(.title2)
                .foregroundColor(.gray)
            
            Slider(value: $opacity, in: 0...1, step: 0.05)
            
            Text("LOTATION")
                .font(.title2)
                .foregroundColor(.gray)
            
            //텍스트 회전 총량 제어 , rotation 프로퍼티 바인딩
            Slider(value: $rotation, in: 0...360, step: 0.1)
        }
        .padding()
    }
}



struct SliderAsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        SliderAsyncImage()
    }
}
