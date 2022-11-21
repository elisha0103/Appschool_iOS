//
//  ContentView.swift
//  ShareLinkPhotos
//
//  Created by 진태영 on 2022/11/16.
//

import SwiftUI

struct SharingPhoto: Transferable{
    static var transferRepresentation: some TransferRepresentation{
        ProxyRepresentation(exporting: \.image)
    }
    
    public var image: Image
    public var caption: String
}

struct ContentView: View {
    private let url = URL(string : "https://likelion.net")!
    private let photo = SharingPhoto(image: Image(systemName: "flame"), caption: "This is a flame!")
    
    var body: some View {
        VStack {
            ShareLink(item: url){
                Label("Share", systemImage: "link.icloud")
                    .font(.largeTitle)
            }
            
            Divider()
            
            photo.image
                .font(.largeTitle)
            
            ShareLink(item: photo, subject: Text("Flame Photo"), message: Text("Check it out!"), preview: SharePreview(photo.caption, image: photo.image))
                .font(.largeTitle)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
