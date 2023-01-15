//
//  SignUpView.swift
//  shortpingMVP
//
//  Created by 진태영 on 2022/12/20.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @EnvironmentObject var userAuthViewModel: UserAuthViewModel
    @Binding var signInViewState: Bool
    @State var email: String = ""
    @State var userName: String = ""
    @State var password: String = ""
    @State var passwordConfirmation = ""
    @State var signUpProcessing = false
        
    var body: some View {
            VStack(spacing: 15){
                Spacer()
                SignUpCredentialFields(email: $email, userName: $userName, password: $password, passwordConfirmation: $passwordConfirmation)
                Button(action: {
                    signUpProcessing = true
                    userAuthViewModel.emailAuthSignUp(email: email, userName: userName, password: password)
                    if !userAuthViewModel.errorMessage.isEmpty{ // errormessage가 존재한다면 회원가입 실패로 처리
                        signUpProcessing = false
                    } else{
                        
                        signInViewState = true
                    }
                    // sign up user using firebase
                }){
                    Text("회원가입")
                        .bold()
                        .frame(width: 360, height: 50)
                        .background(.thinMaterial)
                        .cornerRadius(10)
                }
                .disabled(!signUpProcessing && !email.isEmpty && !userName.isEmpty && !password.isEmpty && !passwordConfirmation.isEmpty && password == passwordConfirmation ? false : true)
                if signUpProcessing{
                    ProgressView()
                }
                if !userAuthViewModel.errorMessage.isEmpty{
                    Text("Failed creating accoung: \(userAuthViewModel.errorMessage)")
                        .foregroundColor(.red)
                }
                Spacer()
                
            }.padding()
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(signInViewState: .constant(false))
            .environmentObject(UserAuthViewModel())
    }
}

struct SignUpCredentialFields: View{
    @Binding var email: String
    @Binding var userName: String
    @Binding var password: String
    @Binding var passwordConfirmation: String
    
    var body: some View{
        Group{
            TextField("이메일 (E-mail)", text: $email)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .textInputAutocapitalization(.never)
            TextField("이름 (Name)", text: $userName)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .textInputAutocapitalization(.never)
            SecureField("비밀번호 (Password)", text: $password)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
            SecureField("비밀번호 확인 (Password)", text: $passwordConfirmation)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .border(Color.red, width: passwordConfirmation != password ? 1 : 0)
                .padding(.bottom, 30)
        }
    }
}
