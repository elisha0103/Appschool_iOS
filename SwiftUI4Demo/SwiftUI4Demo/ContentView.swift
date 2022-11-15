//
//  ContentView.swift
//  SwiftUI4Demo
//
//  Created by 진태영 on 2022/11/15.
//

import SwiftUI

struct ContentView: View {
    @State private var previousNumbers = [3, 6, 9, 7]
    
    var body: some View {
        NavigationStack(path: $previousNumbers){
            NavigationLink(value: "Bob"){
                Text("CEO")
            }
            
            List(1..<30) {index in
                NavigationLink{
                    Text("Hello Employee No. \(index)")
                }label:{ Label("Employee No. \(index)", systemImage: "1.square")
                }
            }
            .navigationDestination(for: Int.self){ index in
                Text("Hello Employee No. \(index)")
            }
            .navigationDestination(for: String.self) { name in
                Text("CEO \(name) is special one")
            }
            .navigationTitle("Likelion Inc.")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
