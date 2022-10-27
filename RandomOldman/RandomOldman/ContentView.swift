//
//  ContentView.swift
//  RandomOldman
//
//  Created by 진태영 on 2022/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var resultData: ResultData
    
    var body: some View {
        
        VStack{
            
            Spacer()
            
            Text("12조")
                .font(.largeTitle)
                .padding()
            
            if resultData.resultString.count > 0 {
                Text("최근 결과는 \(resultData.resultString[0]) 입니다.")
                    .multilineTextAlignment(.center)
                    .font(.title2)
                    .padding()
            } else {
                Text("최근 결과가 없습니다.\n게임을 진행해 주세요.")
                    .font(.title2)
                    .padding()
            }
            
            Spacer()
            
            Button(action: {
                resultData.tabNumber = 2
            }) {
                Image("TongButton")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 100)
            }
            
            Button(action: {
                resultData.tabNumber = 3
            }) {
                Image("RoundButton")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 330, height: 120)
            }
            
            Button(action: {
                resultData.tabNumber = 5
            }) {
                Image("RecentResultButton")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 333, height: 120)
            }
            
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ResultData())
    }
}
/*
 
 VStack{
     
     Spacer()
     
     Text("12조")
         .font(.largeTitle)
         .padding()
     //Spacer()
     if resultData.resultString.count > 0 {
         Text("최근 결과는 \(resultData.resultString[0]) 입니다.")
             .multilineTextAlignment(.center)
             .font(.title2)
             .padding()
     } else {
         Text("최근 결과가 없습니다.\n게임을 진행해 주세요.")
             .font(.title2)
             .padding()
     }
     Spacer()
     
     NavigationLink(destination: ButtonView()){
         Image("TongButton")
             .resizable()
             .aspectRatio(contentMode: .fill)
             .frame(width: 300, height: 100)
     }
     
     NavigationLink(destination: SecondGameView()){
         Image("RoundButton")
             .resizable()
             .aspectRatio(contentMode: .fit)
             .frame(width: 330, height: 120)
         
     }
     
     NavigationLink(destination: RecentResultView()){
         Image("RecentResultButton")
             .resizable()
             .aspectRatio(contentMode: .fit)
             .frame(width: 333, height: 120)
     }
     
     Spacer()
 }
 
 */
