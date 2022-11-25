//
//  LandMark.swift
//  LandMark
//
//  Created by 진태영 on 2022/11/25.
//

import Foundation
import SwiftUI
import MapKit

struct LandMark: Hashable, Codable, Identifiable{
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    
    private var imageName: String
    var image: Image{
        get{
            return Image(imageName)
        }
    }
    
    private var coordinates: Coordinates
    var locationCoordinates: CLLocationCoordinate2D{
        get{
            return CLLocationCoordinate2D(latitude: coordinates.latitude , longitude: coordinates.longitude)
        }
    }
    
    struct Coordinates: Hashable, Codable {
        var longitude: Double
        var latitude: Double
    }
}
