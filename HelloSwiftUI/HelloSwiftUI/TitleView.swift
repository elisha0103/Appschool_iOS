//
//  TitleView.swift
//  HelloSwiftUI
//
//  Created by 진태영 on 2022/10/18.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        VStack{
            Button("Hello", action: {
                print("전기차를 충전해주세요")
            })
            
            Button("Hello") {
                print("전기차를 충전해주세요")
            }
            
            Button(action: {
                print("전기차를 충전해주세요")
            }, label: {
                Image(systemName: "bolt.car")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            })
            
            Button(action: {
                print("전기차를 충전해주세요")
            }) {
                Image(systemName: "bolt.car")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }
        }
        
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
