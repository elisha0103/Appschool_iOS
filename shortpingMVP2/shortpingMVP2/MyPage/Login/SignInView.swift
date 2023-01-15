//
//  SignInView.swift
//  shortpingMVP
//
//  Created by 진태영 on 2022/12/20.
//

import SwiftUI
import GoogleSignIn

struct SignInView: View {
    @EnvironmentObject var userAuthViewModel: UserAuthViewModel
    @Binding var signInViewState: Bool
    @State private var email: String = ""
    @State private var password: String = ""
    @State var signInProcessing: Bool = false
    
    var body: some View {
        VStack(spacing: 15){
            
            Spacer()
            
            (Text("Welcome")
                .foregroundColor(.black) +
             Text("\n Login to continue")
                .foregroundColor(.gray))
            .font(.title)
            .fontWeight(.semibold)
            .lineSpacing(10)
            .padding(.top, 20)
            .padding(.trailing, 15)
            
            Spacer()
            
            Group{
                CustomTextField(email: $email, password: $password)
                    .padding()
                
                if !userAuthViewModel.errorMessage.isEmpty{
                    Text("회원 정보가 일치하지 않습니다.")
                        .foregroundColor(.red)
                }
            }
            
            HStack{
                Button {
                    signInProcessing = true
                    userAuthViewModel.emailAuthSignIn(email: email, password: password)
                    if !userAuthViewModel.errorMessage.isEmpty{
                        signInProcessing = false
                    }
                    if userAuthViewModel.user != nil{
                        // 원래 뷰 이동
                    }
                } label: {
                    Text("로그인")
                        .font(.callout)
                        .lineLimit(1)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 65, height: 25)
                        .frame(height: 45)
                }
                .foregroundColor(.white)
                .padding(.horizontal, 15)
                .background{
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.black)
                }
                .padding(.horizontal, 15)
                
                
                Button {
                    signInViewState = false
                } label: {
                    Text("회원가입")
                        .font(.callout)
                        .lineLimit(1)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 65, height: 25)
                        .frame(height: 45)
                }
                .foregroundColor(.white)
                .padding(.horizontal, 15)
                .background{
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.black)
                }
                .padding(.horizontal, 15)
            }
            
            Spacer()
            
            Text("(또는)")
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity)
                .padding(.top, 30)
                .padding(.bottom, 20)
                .padding(.horizontal)
            
            
            GoogleSignInButton()
                .padding(.horizontal, 150)
                .onTapGesture{
                    userAuthViewModel.googleSignIn()
                }
            
            Button{
                print("sate check", userAuthViewModel.state)
            } label: {
                Text("check state")
            }
            
            Spacer()
        }
        .onAppear{
            // 이전 로그인 기록이 있다면 자동 로그인실행
            if let platform = UserDefaults.standard.string(forKey: "platform"){
                if platform == "Email"{ // 이전 로그인 기록이 email 로그인방식
                    if let email = UserDefaults.standard.string(forKey: "id"){
                        if let pw = UserDefaults.standard.string(forKey: "pw"){
                            userAuthViewModel.emailAuthSignIn(email: email, password: pw)
                        }
                    }
                    userAuthViewModel.emailAuthListenToAuthState()
                } else if platform == "Google"{ // 이전 로그인 기록이 google 로그인방식
                    userAuthViewModel.googleSignIn()
                }
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(signInViewState: .constant(false))
            .environmentObject(UserAuthViewModel())
    }
}

struct CustomTextField: View{
    @Binding var email: String
    @Binding var password: String
    
    var body: some View{
        VStack(alignment: .leading, spacing: 15) {
            TextField("이메일 (E-mail)", text: $email)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .textInputAutocapitalization(.never)
            SecureField("비밀번호 (Password)", text: $password)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .padding(.bottom, 30)
            
        }
    }
}

struct GoogleSignInButton: UIViewRepresentable {
    @Environment(\.colorScheme) var colorScheme
    
    private var button = GIDSignInButton()
    
    func makeUIView(context: Context) -> GIDSignInButton {
        button.colorScheme = colorScheme == .dark ? .dark : .light
        return button
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        button.colorScheme = colorScheme == .dark ? .dark : .light
    }
}
