//
//  ContentView.swift
//  NumberGraph
//
//  Created by 진태영 on 2022/10/31.
//

import SwiftUI

struct ContentView: View {
    @State private var numberArr: [Int] = [0, 0, 0]
    
    var body: some View {
        VStack(alignment: .center){
            Spacer()
            HStack {
                NumberButton(numberArr: $numberArr, index: 0, graph: "삼성전자")
                Spacer()
                NumberButton(numberArr: $numberArr, index: 1, graph: "카카오")
                Spacer()
                NumberButton(numberArr: $numberArr, index: 2, graph: "SK 하이닉스")
                
            }
            .padding()
            HStack(alignment: .center){
                Text("\(numberArr[0]) 원")
                Spacer()
                Text("\(numberArr[1]) 원")
                Spacer()
                Text("\(numberArr[2]) 원")
            }
            .padding(.horizontal, 30.0)
            VStack{
                HStack(alignment: .bottom){
                    VStack{
                        Rectangle()
                            .frame(width: 30, height: CGFloat(numberArr[0]) / 100000 * 100)
                            .foregroundColor(.blue)
                        Text("삼성전자")
                    }
                    .padding()
                    VStack{
                        Rectangle()
                            .frame(width: 30, height: CGFloat(numberArr[1]) / 100000 * 100)
                            .foregroundColor(.gray)
                        Text("카카오")
                    }
                    .padding()
                    VStack{
                        Rectangle()
                            .frame(width: 30, height: CGFloat(numberArr[2]) / 100000 * 100)
                            .foregroundColor(.green)
                        Text("SK 하이닉스")
                    }
                    .padding()
                    
                }
                .frame(width: .infinity, height: 600)
                .animation(.linear(duration: 2))
            }
        }
    }
}

struct NumberButton: View{
    @Binding var numberArr: [Int]
    var index: Int = 0
    var graph: String = ""
    
    var body: some View{
        Button(action: {
            numberArr[index] = .random(in: 0...100000)
        }){
            Text("\(graph)")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
