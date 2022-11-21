//
//  ContentView.swift
//  ToyChart
//
//  Created by 진태영 on 2022/11/17.
//

import SwiftUI
import Charts

struct ContentView: View {
    var body: some View {
        VStack{
            Chart{
                BarMark(
                    x: .value("Shape Type", data[0].type),
                    y: .value("Total Count", data[0].count)
                )
                BarMark(
                    x: .value("Shape Type", data[1].type),
                    y: .value("Total Count", data[1].count)
                )
                BarMark(
                    x: .value("Shape Type", data[2].type),
                    y: .value("Total Count", data[2].count)
                )
            }
        }
        .padding()
        .navigationTitle("Weely Repoert")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ContentView()
        }
    }
}
