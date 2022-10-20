//
//  ContentView.swift
//  randomNumber
//
//  Created by 진태영 on 2022/10/20.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack {
            
            NumberSlider()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
