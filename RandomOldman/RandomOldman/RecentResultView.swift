//
//  RecentResultView.swift
//  RandomOldman
//
//  Created by 최한호 on 2022/10/24.
//

import SwiftUI
import Foundation

struct RecentResultView: View {
    
    @EnvironmentObject var resultData: ResultData
    
    var body: some View {
        
        NavigationView {
            
            List {
                ResultListView(game: "통아저씨")
                ResultListView(game: "돌림판")
                ResultListView(game: "계산기")
            }
            .navigationTitle(Text("최근 게임 결과"))
            .listStyle(SidebarListStyle())
        }
    }
}

struct RecentResultView_Previews: PreviewProvider {
    static var previews: some View {
        RecentResultView().environmentObject(ResultData())
    }
}

struct ResultListView: View {
    
    @EnvironmentObject var resultData: ResultData
    var game: String = ""
    
    var body: some View {
        Section(header: Text(game).font(.headline)) {
            
            if game == "통아저씨" && resultData.tongCount == 0 {
                Text("최근 결과가 없습니다.\n게임을 진행해 주세요.")
            } else if game == "돌림판" && resultData.roundingCount == 0 {
                Text("최근 결과가 없습니다.\n게임을 진행해 주세요.")
            } else if game == "계산기" && resultData.calCount == 0 {
                Text("최근 결과가 없습니다.\n작업을 진행해 주세요.")
            } else {
                ForEach(resultData.resultString, id: \.self) { result in
                    if result.starts(with: "[\(game)]") {
                        Text(result)
                    }
                }
                .onDelete(perform: deleteItems)
                
//                ForEach(0 ..< resultData.resultString.count) { index in
//                    if resultData.resultString[index].starts(with: "[\(game)]") {
//                        Text("\(resultData.resultString[index])")
//                    }
//                }
            }
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        resultData.resultString.remove(atOffsets: offsets)
        if game == "통아저씨" {
            resultData.tongCount -= 1
        } else if game == "돌림판" {
            resultData.roundingCount -= 1
        }
    }
    
}
