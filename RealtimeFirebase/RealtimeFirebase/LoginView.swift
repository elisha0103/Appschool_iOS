//
//  LoginView.swift
//  RealtimeFirebase
//
//  Created by 진태영 on 2023/05/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var carStore: CarStore = CarStore()
    
    var body: some View {
        NavigationStack {
            NavigationLink {
                ContentView()
                    .environmentObject(carStore)
            } label: {
                Text("ContentView")
                    .onAppear {
                        print("onappear root")
                    }
                    .onDisappear {
                        print("on disappear root")
                    }
            }
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
