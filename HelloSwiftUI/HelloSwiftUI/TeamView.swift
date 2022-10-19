//
//  TeamView.swift
//  HelloSwiftUI
//
//  Created by 진태영 on 2022/10/18.
//

import SwiftUI

struct TeamView: View {
    var body: some View {
        VStack {
            Button(action: {
                print("하이")
            }, label: {
                Image(systemName: "apple.logo")
                    .resizable()
                    .frame(width: 64, height: 64)
                    .modifier(StandardImage())
            }).padding()
            
            HStack {
                Image("SwiftUI").resizable()
                    .frame(width: 100, height: 100)
                Image(systemName: "sun.haze")
                    .resizable()
                    .modifier(StandardImage())
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 5))
                
                VStack(alignment: .leading) {
                    Text("Team12")
                        .modifier(StandardText())
                    Text("도현 정민 서현 태영 한호 주희 진표")
                        .foregroundColor(Color(red: 0.39, green: 0.43, blue: 0.45))
                        .modifier(StandardText())
                        
                }.layoutPriority(100)
            }

            
            .padding()
          //  .border(.gray)
        }
    }
}

struct StandardImage: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.orange)
        //            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50)
    }
}

struct StandardText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.orange)
            .bold()
            .italic()
            .padding()
    }
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView()
    }
}
