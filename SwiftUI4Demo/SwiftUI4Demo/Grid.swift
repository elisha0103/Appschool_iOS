//
//  Grid.swift
//  SwiftUI4Demo
//
//  Created by 진태영 on 2022/11/15.
//

import SwiftUI

struct GridDemo: View {
    @State private var koreaScore: Int = 0
    @State private var uruguayScore: Int = 0
    
    var body: some View {
        Grid{
            GridRow{
                Text("Korea")
                ForEach(0..<koreaScore, id:\.self){ _ in
                    Circle()
                        .fill(.red)
                        .frame(width: 20, height: 20)
                }
            }
            
            Divider()
            
            GridRow{
                Text("Uruguay")
                    .gridCellColumns(2)
//                ForEach(0..<uruguayScore, id:\.self){_ in
//                    Circle()
//                        .fill(.blue)
//                        .frame(width: 20, height: 20)
//                }
            }
            Button("Korea"){koreaScore += 1}
            Button("Uruguay"){uruguayScore += 1}
        }
        .font(.title)
    }
}

struct GridDemo_Previews: PreviewProvider {
    static var previews: some View {
        GridDemo()
    }
}
