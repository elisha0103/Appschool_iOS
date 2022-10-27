//
//  TabView.swift
//  RandomOldman
//
//  Created by 진태영 on 2022/10/26.
//

import SwiftUI

struct ContentTabView: View {
    
    @EnvironmentObject var resultData: ResultData
    
    var body: some View {
        TabView(selection: $resultData.tabNumber){
            ContentView()
                .tabItem{
                Image(systemName: "house.fill")
                Text("Home")
            }.tag(1)
            
            ButtonView()
                .tabItem {
                Image(systemName: "arrow.up.bin.fill")
                Text("통아저씨")
            }.tag(2)
            
            SecondGameView()
                .tabItem {
                Image(systemName: "chart.pie.fill")
                Text("돌림판")
            }.tag(3)
            
            CalculatorView()
                .tabItem {
                    Image(systemName: "plusminus.circle.fill")
                    Text("계산기")
                }.tag(4)
            
            RecentResultView()
                .tabItem{
                Image(systemName: "chart.bar.doc.horizontal")
                Text("최근 결과")
            }.tag(5)
        }
    }
}

struct ContentTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentTabView().environmentObject(ResultData())
    }
}
