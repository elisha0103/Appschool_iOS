//
//  MainView.swift
//  GoogleSignInProject
//
//  Created by 진태영 on 2023/03/07.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    
    var body: some View {
        Text("로그인 완료!")
        
        Button {
            authenticationViewModel.signOut()
        } label: {
            Text("로그아웃")
        }

    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(AuthenticationViewModel())
    }
}
