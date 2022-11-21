//
//  PhotoUIView.swift
//  ShareLinkPhotos
//
//  Created by 진태영 on 2022/11/16.
//

import SwiftUI
import PhotosUI

struct PhotosUIView: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    var body: some View {
        VStack{
            if let selectedImageData,
               let uiImage = UIImage(data: selectedImageData){
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
            }
            PhotosPicker(
                selection: $selectedItem,
                matching: .images,
                photoLibrary: .shared())
            {
                Text("Select a Photo")
            }
            .onChange(of: selectedItem){ newItem in
                Task{
                    if let data = try? await
                        newItem?.loadTransferable(type: Data.self){
                        selectedImageData = data
                    }
                }
            }
        }
    }
}

struct PhotosUIView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosUIView()
    }
}
