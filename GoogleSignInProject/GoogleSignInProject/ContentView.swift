//
//  ContentView.swift
//  GoogleSignInProject
//
//  Created by 진태영 on 2023/01/25.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    
    var body: some View {
        VStack {
            if authenticationViewModel.signState == .signIn {
                MainView()
            } else {
                LoginView()
            }
        }
        .onAppear {
            if Auth.auth().currentUser != nil {
                authenticationViewModel.signState = .signIn
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthenticationViewModel())
    }
}
