//
//  ContextMenuDemo.swift
//  HelloSwiftUI
//
//  Created by 진태영 on 2022/10/26.
//

import SwiftUI

struct ContextMenuDemo: View {
    @State var foregroundColor: Color = .white
    @State var backgroundColor: Color = .purple
    
    var body: some View {
        VStack{
            Text("Hello, world!")
                .font(.largeTitle)
                .padding()
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .contextMenu{
                    Button(action: {
                        self.foregroundColor = .black
                        self.backgroundColor = .white
                    }){
                        Text("Normal Colors")
                        Image(systemName: "paintbrush")
                    }
                    
                    Button(action: {
                        self.foregroundColor = .white
                        self.backgroundColor = .purple
                    }){
                        Text("Purple Colors")
                        Image(systemName: "paintbrush.fill")
                    }
                }
        }
    }
}

struct ContextMenuDemo_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuDemo()
    }
}
