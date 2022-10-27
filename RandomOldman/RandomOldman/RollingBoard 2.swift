//
//  RollingBoard.swift
//  roundingRound-swiftui-20221021-team12
//
//  Created by JeongMin Ko on 2022/10/21.
//

import SwiftUI

struct RollingBoard<Content : View>: View {
    let content : () -> Content
    init(@ViewBuilder content: @escaping () -> Content){
        self.content = content
    }
    var body: some View {
        
        
        ZStack{
            content()

        }
        
        
        
    }
}

