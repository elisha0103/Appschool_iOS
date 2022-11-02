//
//  GestureDemo.swift
//  HelloSwiftUI
//
//  Created by 진태영 on 2022/11/01.
//

import SwiftUI

struct GestureDemo: View {
    @State private var magnification: CGFloat = 1.0
        var body: some View {
        let magnificationGesture = MagnificationGesture(minimumScaleDelta: 0)
            .onChanged({ value in
                print("Magnifying")
                self.magnification = value
            })
            .onEnded{ _ in
                print("Gesture Ended")
            }
        return Image(systemName: "hand.point.right.fill")
            .resizable()
            .font(.largeTitle)
            .scaleEffect(magnification)
            .gesture(magnificationGesture)
            .frame(width: 100, height: 90)
        
    }
}


struct GestureDemo_Previews: PreviewProvider {
    static var previews: some View {
        GestureDemo()
    }
}
