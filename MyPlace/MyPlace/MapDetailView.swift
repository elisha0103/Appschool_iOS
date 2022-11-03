//
//  MapDetailView.swift
//  MyPlace
//
//  Created by Jongwook Park on 2022/11/02.
//

import SwiftUI
import MapKit

struct AnnotatedItem: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

struct MapDetailView: View {
    let place: Place
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 40.75773, longitude: -73.985708),
            span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        )
    
    @State private var annotatedItems: [AnnotatedItem] = []
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region, annotationItems: annotatedItems) { item in
                MapMarker(coordinate: item.coordinate, tint: .purple)
            }
            .ignoresSafeArea(.all)
        }
//        .navigationTitle("위치")
        .onAppear(perform: {
            let coordinate = CLLocationCoordinate2D(latitude: place.lat, longitude: place.long)
            let annotatedItem = AnnotatedItem(name: place.name, coordinate: coordinate)
            annotatedItems.append(annotatedItem)
            
            region.center = coordinate
        })
    }
}

struct MapDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MapDetailView(place: placeData.last!)
        }
    }
}
