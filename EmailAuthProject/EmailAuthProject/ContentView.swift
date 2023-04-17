//
//  ContentView.swift
//  EmailAuthProject
//
//  Created by 진태영 on 2023/04/17.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            if viewModel.state == .signedIn {
                MainView()
            } else {
                SignInView()
            }
        }
        .onAppear {
            if Auth.auth().currentUser != nil {
                viewModel.state = .signedIn
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
