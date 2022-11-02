//
//  WebTabView.swift
//  WebMapDemo
//
//  Created by 진태영 on 2022/11/02.
//

import SwiftUI

struct WebTabView: View {
    @State private var isShowingSheet = false
    
    var body: some View {
        VStack{
            Button(action: {
                isShowingSheet.toggle()
            }) {
                Text("Open Web Browser")
            }
        }
        .sheet(isPresented: $isShowingSheet, onDismiss: didDismiss){
                WebSheetview()
        }
    }
    func didDismiss(){
        // Handle the dismissing action.
    }
}

struct WebSheetview: View{
    var body: some View{
        SafariView(url: URL(string: "https://www.nexon.com/")!)
    }
}

struct WebTabView_Previews: PreviewProvider {
    static var previews: some View {
        WebTabView()
    }
}
