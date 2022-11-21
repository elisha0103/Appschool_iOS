//
//  ShareLinkView.swift
//  ShareLinkPhotos
//
//  Created by 진태영 on 2022/11/16.
//

import SwiftUI

struct ShareLinkView: View {
    var body: some View {
        NavigationStack{
            List{
                NavigationLink{
                    ShareLinkView()
                } label: {
                    Label("ShareLink Demo", systemImage: "photo")
                }
            }
        }
    }
}

struct ShareLinkView_Previews: PreviewProvider {
    static var previews: some View {
        ShareLinkView()
    }
}
