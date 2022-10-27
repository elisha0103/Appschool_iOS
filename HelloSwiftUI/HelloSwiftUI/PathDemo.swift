//
//  PathDemo.swift
//  RandomOldman
//
//  Created by 진태영 on 2022/10/27.
//

import SwiftUI

struct PathDemo: View {
    
    let colors = Gradient(colors: [Color.red, Color.yellow,
    Color.green, Color.blue, Color.purple])

    var body: some View {
    
        MyShape()
            .fill(RadialGradient(gradient: colors,
                                   center: .center,
                              startRadius: CGFloat(0),
                                endRadius: CGFloat(300)))
             .background(LinearGradient(gradient: Gradient(colors:
                                       [Color.black, Color.white]),
                               startPoint: .topLeading,
                                 endPoint: .bottomTrailing))
             .frame(width: 360, height: 350)
    }
}


struct MyShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY),
            control: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct PathDemo_Previews: PreviewProvider {
    static var previews: some View {
        PathDemo()
    }
}
