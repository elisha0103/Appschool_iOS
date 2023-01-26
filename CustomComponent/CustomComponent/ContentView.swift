//
//  ContentView.swift
//  CustomComponent
//
//  Created by 진태영 on 2023/01/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showsCustomAlert = false
    @State private var text: String = ""

    var body: some View {
        VStack {
            CustomTextField(
              text: $text,
              placeholder: "플레이스 홀더",
              maximumCount: 5)

            Button(action: { showsCustomAlert.toggle() }) {
              Text("커스텀 Alert 진행시켜!")
                .foregroundColor(.cyan)
            }
          .padding()
          .customAlert(
            isPresented: $showsCustomAlert,
            title: "제목제목",
            message: "내용입니다",
            primaryButtonTitle: "확인",
            primaryAction: { print("확인 눌림!") },
            withCancelButton: true)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
