//
//  Roller.swift
//  roundingRound-swiftui-20221021-team12
//
//  Created by JeongMin Ko on 2022/10/21.
//

import SwiftUI

struct Roller: View {
    
    @Binding var number : Int
    @Binding var color : [Color]
    @Binding var isActive: Bool
    @Binding var randomInt: Int
    
    @EnvironmentObject var results: ResultData
    
    var body: some View {
        //원판
        ZStack{
            RollingBoard(content: {
            })
            ZStack{
                //항목 개수 만큼 반복해서 원판 영역 나누어 그리기
                ForEach( 0..<number ){ index in
                    var startAngle = 360/number * index
                    var endAngle = ( 360/number * (index + 1))
                    
                    Path { path in
                        path.move(to: CGPoint(x: 150, y: 150))
                        path.addArc(center: .init(x: 150, y: 150), radius: 150, startAngle: Angle(degrees: Double(startAngle)), endAngle: Angle(degrees: Double(endAngle)), clockwise: false)
                        path.closeSubpath()
                        path.submitLabel(.continue)
                    }
                    .fill(color[index])
                    
                }
            }
            .frame(width: 300, height: 300)
            //.background(.blue)
            .rotationEffect(Angle.degrees(isActive ? Double(randomInt) : 0))
            .animation(.easeInOut(duration: 5))
            
            
            // rollerDeactivate()
            
            //원판 핀
            Circle().frame(width: 30,height: 30).foregroundColor(.red).position(x: 200,y: 50)
        }
    }
    
    //    func rollerDeactivate() {
    //        isActive = !isActive
    //    }
}


