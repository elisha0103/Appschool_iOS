//
//  MainView.swift
//  EmailAuthProject
//
//  Created by 진태영 on 2023/04/17.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewmodel: ViewModel
    
    var body: some View {
        VStack {
            Text("로그인 완료")
            Button {
                viewmodel.signout()
            } label: {
                Text("로그아웃")
            }

        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ViewModel())
    }
}
