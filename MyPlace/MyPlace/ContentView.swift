//
//  ContentView.swift
//  MyPlace
//
//  Created by Jongwook Park on 2022/11/02.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var placeStore: PlaceStore = PlaceStore(places: placeData)
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(placeStore.places) { place in
                    Section {
                        NavigationLink {
                            PlaceDetailView(place: place)
                        } label: {
                            LazyVStack(alignment: .leading) {
                                AsyncImage(url: URL(string: place.imageUrl)) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .aspectRatio(contentMode: .fit)
                                
                                Text("\(place.name)")
                                    .font(.headline)
                            }
                        }
                    }
                }
            }
            .navigationTitle("우리의 장소들")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
