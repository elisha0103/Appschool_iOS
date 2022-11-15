//
//  ContentView.swift
//  MyGlobalApp
//
//  Created by 진태영 on 2022/11/14.
//

import SwiftUI

struct ContentView: View {
    private let title: String = "Hello, World!"
    private let items: [String] = [
        "Wakanda",
        "England",
        "Japan",
        "USA",
        "Germany",
        "Wales"
    ]
    var body: some View {
        NavigationStack{
            List{
                ForEach(items, id: \.self){item in
                    Text(LocalizedStringKey(item))
                }
                Section{
                    Text("Total \(items.count) countries")
                }
            }
            .navigationTitle(Text(LocalizedStringKey(title)))

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
