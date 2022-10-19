//
//  MyVStack.swift
//  HelloSwiftUI
//
//  Created by 진태영 on 2022/10/19.
//

import SwiftUI

struct MyVStack<Content: View>: View{
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View{
        VStack(){
            content()
        }
        .font(.title)
        .foregroundColor(.accentColor)
        .padding()
    }
}
struct MyHStack<Content: View>: View{
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View{
        HStack(){
            content()
        }
        .font(.title)
        .foregroundColor(.red)
        .padding()
    }
}
