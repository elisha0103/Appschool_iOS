//
//  LoginView.swift
//  shortpingMVP
//
//  Created by 진태영 on 2022/12/20.
//

import SwiftUI

struct LoginView: View {
    @State var signInViewState: Bool = true
    @StateObject var userAuthViewModel: UserAuthViewModel = UserAuthViewModel()
    
    var body: some View{
        VStack{
            if signInViewState{
                SignInView(signInViewState: $signInViewState)
                    .environmentObject(UserAuthViewModel())
            } else{
                SignUpView(signInViewState: $signInViewState)
                    .environmentObject(UserAuthViewModel())
            }
        }
    }
        
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(userAuthViewModel: UserAuthViewModel())
//            .environmentObject(UserAuthViewModel())
    }
}


