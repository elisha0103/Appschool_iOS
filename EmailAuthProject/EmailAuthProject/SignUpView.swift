//
//  SignUp.swift
//  EmailAuthProject
//
//  Created by 진태영 on 2023/04/17.
//

import SwiftUI

// MARK: - 회원가입 뷰
struct SignUpView: View {
    @State private var nameText: String = ""        // 이름 Text
    @State private var emailText: String = ""       // email Text
    @State private var passwordText: String = ""    // 패스워드 Text
    @State private var passwordConfirmText: String = ""   // 패스워드 확인 Text
    @State var isShowingProgressView = false                   // 로그인 비동기 ProgressView
    @State var isShowingAlert: Bool = false                     // 로그인 완료 Alert
    @State var isPasswordCountError: Bool = false               // 비밀번호 6자리 이상 확인
    @State var isPasswordUnCorrectError: Bool = false             // 비밀번호 텍스트 일치 확인
    @EnvironmentObject var viewModel: ViewModel                 // ViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        
        ScrollView {
            VStack(spacing: 30) {
                VStack {
                    Text("이메일 ID 생성")
                        .font(.largeTitle)
                    
                    Text("하나의 ID로 모든 서비스를 이용할 수 있습니다.")
                }
                .lineSpacing(10)
                
                VStack(alignment: .leading) {
                    Text("이름")
                        .font(.headline)
                    TextField("이름을 입력해주세요", text: $nameText)
                        .padding()
                        .background(.thinMaterial)
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                }
                
                VStack(alignment: .leading) {
                    Text("이메일")
                        .font(.headline)
                    TextField("이메일을 입력해주세요", text: $emailText)
                        .padding()
                        .background(.thinMaterial)
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                }
                
                VStack(alignment: .leading) {
                    Text("비밀번호")
                        .font(.headline)
                    SecureField("비밀번호를 6자리 이상 입력해주세요", text: $passwordText)
                        .padding()
                        .background(.thinMaterial)
                        .cornerRadius(10)
                    Text("비밀번호는 6자리 이상 입력해주세요.")
                        .font(.system(size: 15))
                        .foregroundColor(isPasswordCountError ? .red : .clear)
                }
                
                VStack(alignment: .leading) {
                    Text("비밀번호 확인")
                    SecureField("비밀번호를 다시 입력해주세요", text: $passwordConfirmText)
                        .padding()
                        .background(.thinMaterial)
                        .border(.red, width: passwordConfirmText != passwordText ? 1 : 0)
                        .cornerRadius(10)
                    Text("비밀번호가 서로 다릅니다.")
                        .font(.system(size: 15))
                        .foregroundColor(isPasswordUnCorrectError ? .red : .clear)
                }
                
                // (1)
                Button {
                    isShowingProgressView = true // ProgressView 보이기
                    
                    if passwordText.count < 6 {
                        isPasswordCountError = true
                    }
                    if passwordConfirmText != passwordText {
                        isPasswordUnCorrectError = true
                    }
                    if passwordText.count >= 6 && passwordConfirmText == passwordText {
                       viewModel.emailAuthSignUp(email: emailText, userName: nameText, password: passwordText)
                        isShowingAlert = true
                    }
                } label: {
                    Text("회원 가입")
                        .frame(width: 100, height: 50)
                        .background(!checkSignUpCondition() ? .gray : .blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .alert("회원가입", isPresented: $isShowingAlert) {
                            Button {
                                dismiss()
                            } label: {
                                Text("OK")
                            }
                        } message: {
                            Text("회원가입이 완료되었습니다.")
                        }
                        .padding()
                }
                .disabled(!checkSignUpCondition() ? true : false)
                
                //(2)
                if isShowingProgressView {
                    ProgressView()
                }

            }
            .padding()
            .padding(.bottom, 15)
        }

    }
    
    func checkSignUpCondition () -> Bool {
        if nameText.isEmpty || emailText.isEmpty || passwordText.isEmpty || passwordConfirmText.isEmpty {
            return false
        }
        return true
    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(ViewModel())
    }
}
