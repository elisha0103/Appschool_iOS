//
//  DrawDemo.swift
//  RandomOldman
//
//  Created by 진태영 on 2022/10/27.
//

import SwiftUI

import SwiftUI

struct DrawDemo: View {
    var body: some View {
        VStack {
//            Text("Hello, Rectangle!")
//                .font(.largeTitle)
//            Rectangle()
//                .foregroundColor(.black)
//                .frame(width:20, height: 20)
            
//            Text("Hello, Circle!")
//                .font(.largeTitle)
//            Circle()
//                .fill(Color.purple)
//                .frame(width: 200, height: 200)
            
            Text("Hello, Capsule")
                .font(.largeTitle)
            Capsule()
                .stroke(lineWidth: 10)
                .foregroundColor(.blue)
                .frame(width: 200, height: 100)
            
            Text("Hello, RoundRectangle")
            RoundedRectangle(cornerRadius: CGFloat(20))
                .stroke(style: StrokeStyle(lineWidth: CGFloat(5), dash: [CGFloat(10), CGFloat(5)]))
            
            Text("Hello Ellipse")
            Ellipse()
                .stroke(style: StrokeStyle(lineWidth: 20, dash: [CGFloat(10), CGFloat(5), CGFloat(2)], dashPhase: CGFloat(10)))
                .foregroundColor(.blue)
                .frame(width: 250, height: 150)
            
        }
        .padding()
    }
    
}

struct DrawDemo_Previews: PreviewProvider {
    static var previews: some View {
        DrawDemo()
    }
}
