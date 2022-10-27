//
//  ContentView.swift
//  ShapeDemo
//
//  Created by 진태영 on 2022/10/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack{
            MyStar()
            
        }
    }
}

struct MyStar: Shape{
    func path(in rect: CGRect) -> Path{
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: 1.5 / 7 * rect.maxY))
        path.addLine(to: CGPoint(x: 3 / 8 * rect.maxX, y: 1 / 3 * rect.maxY))
        path.addLine(to: CGPoint(x: 1 / 7 * rect.maxX, y: 1 / 3 * rect.maxY))
        path.addLine(to: CGPoint(x: 1 / 3 * rect.maxX, y: 3 / 7 * rect.maxY))
        path.addLine(to: CGPoint(x: 2 / 8 * rect.maxX, y: 4 / 7 * rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: 1 / 2 * rect.maxY))
        path.addLine(to: CGPoint(x: 6 / 8 * rect.maxX, y: 4 / 7 * rect.maxY))
        path.addLine(to: CGPoint(x: 2 / 3 * rect.maxX, y: 3 / 7 * rect.maxY))
        path.addLine(to: CGPoint(x: 6 / 7 * rect.maxX, y: 1 / 3 * rect.maxY))
        path.addLine(to: CGPoint(x: 5 / 8 * rect.maxX, y: 1 / 3 * rect.maxY))
        path.closeSubpath()
        
        return path
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
