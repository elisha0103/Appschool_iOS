//
//  SoHeeSearchView.swift
//  shortpingMVP
//
//  Created by 정소희 on 2022/12/21.
//

import SwiftUI

struct SoHeeSearchView: View {
    @State private var searchText = ""
 var clothes = ["무스탕", "자켓"]
      var body: some View {
          NavigationView {
              VStack{
                  
                  HStack{
                      Text("최근 검색어")
                          .font(.title2)
                          .fontWeight(.bold)
                      Spacer()
                      Button(action: {}) {
                          Text("전체 삭제")
                              .fontWeight(.medium)
                              .foregroundColor(.gray)
                          
                          }
                  }.padding()
                  
                  HStack{
                      ForEach(clothes, id: \.self) { item in
                      Button(action: {
                       
                      }) {
                          RoundedRectangle(cornerRadius: 10)
                              .fill(Color("ivory"))
                              .frame(width: 120, height: 40)
                              .overlay {
                                  HStack{
                                      Text(item)
                                      Image(systemName: "xmark")
                                  }
                              }
                      }
                      }
                      Spacer()
                  }.padding(.leading)
                   .padding(.bottom, 60)

                  HStack{
                      Text("인기 검색어")
                          .font(.title2)
                          .fontWeight(.bold)
                      Spacer()
                  }.padding(.leading)
                  HStack{
                      VStack(alignment: .leading, spacing: 10){
                          Text("1. 오버핏")
                          Text("2. 기모")
                          Text("3. 와이드")
                      }.font(.title3)
                          .padding(.trailing, 90)
                      VStack(alignment: .leading, spacing: 10){
                          Text("4. 벤딩")
                          Text("5. 나이키")
                          Text("6. 맨투맨")
                      }.font(.title3)
                      Spacer()
                  }.padding()
                  Spacer()
              }.searchable(text: $searchText)
                  
              
          }
      }
}


struct SoHeeSearchView_Previews: PreviewProvider {
    static var previews: some View {
        SoHeeSearchView()
    }
}
