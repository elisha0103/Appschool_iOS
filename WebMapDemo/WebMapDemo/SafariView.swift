//
//  SafariView.swift
//  WebMapDemo
//
//  Created by 진태영 on 2022/11/02.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable{
    let url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController{
        
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
        
    }
    
}

struct SafariView_Previews: PreviewProvider {
    static var previews: some View {
        SafariView(url: URL(string: "https://www.apple.com/kr/")!)
    }
}
