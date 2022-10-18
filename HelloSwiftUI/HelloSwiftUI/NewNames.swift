//
//  NewNames.swift
//  HelloSwiftUI
//
//  Created by 진태영 on 2022/10/18.
//

import SwiftUI

struct NewNames: View {
    var body: some View {
        VStack{
            Text("정민")
            Text("도현")
            Text("서현")
            Text("태영")
            Text("한호")
            Text("주희")
            Text("진표")
        }
        .modifier(StandardName())
    }
}

struct StandardName: ViewModifier{
    func body(content: Content) -> some View{
        content
            .foregroundColor(.purple)
            .fontWeight(.bold)
            .padding()
    }
}

struct NewNames_Previews: PreviewProvider {
    static var previews: some View {
        NewNames()
    }
}
