//
//  PlaceDetailView.swift
//  MyPlace
//
//  Created by Jongwook Park on 2022/11/02.
//

import SwiftUI
import MapKit

struct PlaceDetailView: View {
    @State private var isShowingSheet: Bool = false
    
    let place: Place
    
    var body: some View {
        List {
            Section {
                AsyncImage(url: URL(string: place.imageUrl)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .aspectRatio(contentMode: .fit)
                
                Text("\(place.name)")
                    .font(.headline)
                
                VStack(alignment: .leading) {
                    Text("웹사이트")
                    
                    Button {
                        isShowingSheet.toggle()
                    } label: {
                        Text("\(place.siteUrl)")
                    }
                }
            }
            
            Section {
                VStack(alignment: .leading) {
                    NavigationLink {
                        MapDetailView(place: place)
                    } label: {
                        VStack(alignment: .leading) {
                            Text("위치 보기")
                            MapDetailView(place: place)
                                .frame(height: 200)
                        }
                    }

                }
            }
            
            Section {
                VStack(alignment: .leading) {
                    Text("\(place.description)")
                        .font(.body)
                }
            }
        }
        .navigationTitle("\(place.name)")
        .sheet(isPresented: $isShowingSheet, onDismiss: didDismiss) {
            WebSheetView(url: place.siteUrl)
        }
    }
    
    
    func didDismiss() {
        // Handle the dismissing action.
    }
}

struct WebSheetView: View {
    let url: String
    
    var body: some View {
        SafariView(url: URL(string:url)!)
    }
}

struct PlaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PlaceDetailView(place: placeData.last!)
        }
    }
}
