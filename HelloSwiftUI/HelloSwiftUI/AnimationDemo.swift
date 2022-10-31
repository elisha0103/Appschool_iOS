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
            Button(action: {
                rotation = (rotation < 360) ? rotation + 60 : 0
                scale = (scale < 2.8) ? scale + 0.3 : 1.0
            }) {
                Text("Click to animate")
                    .scaleEffect(scale)
                    .rotationEffect(.degrees(rotation))
                    .animation(.linear, value: rotation)
            }
        }
        .padding()
    }
}

struct AnimationDemo_Previews: PreviewProvider {
    static var previews: some View {
        AnimationDemo()
    }
}
