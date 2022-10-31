//
//  AnimationDemo.swift
//  HelloSwiftUI
//
//  Created by 진태영 on 2022/10/31.
//

import SwiftUI

struct AnimationDemo: View {
    @State private var rotation: Double = 0.0
    @State private var scale: CGFloat = 1.0
    var body: some View {
        VStack{
            
            // 명시적 애니메이션 선언방법 - withAnimation 클로저 사용
            Button(action: {
                withAnimation(.linear(duration: 1).repeatForever(autoreverses: true)) {
                    rotation = (rotation < 360) ? rotation + 60 : 0
                }
                scale = (scale < 2.8) ? scale + 0.3 : 1
            }) {
                Text("Click to animate")
                    .scaleEffect(scale)
                    .rotationEffect(.degrees(rotation))
            }
            
            // 암묵적 애니메이션 선언방법
            /*
            Button(action: {
                rotation = (rotation < 360) ? rotation + 60 : 0
                scale = (scale < 2.8) ? scale + 0.3 : 1.0
            }) {
                Text("Click to animate")
                    .scaleEffect(scale)
                    .rotationEffect(.degrees(rotation))
                // 애니메이션 기본
                    .animation(.linear, value: scale)
                // 무한 반복 애니메이션
//                    .animation(.linear(duration: 1).repeatForever(autoreverses: true), value: scale)
                // 스프링 애니메이션
//                    .animation(.spring(response: 1, dampingFraction: 0.5, blendDuration: 0), value: scale)
            }
             */
        }
        .padding()
    }
}

struct AnimationDemo_Previews: PreviewProvider {
    static var previews: some View {
        AnimationDemo()
    }
}
