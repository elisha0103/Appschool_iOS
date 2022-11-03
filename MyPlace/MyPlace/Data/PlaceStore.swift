//
//  PlaceStore.swift
//  MyPlace
//
//  Created by Jongwook Park on 2022/11/02.
//

import SwiftUI
import Combine

class PlaceStore : ObservableObject {
    
    @Published var places: [Place]
    
    init (places: [Place] = []) {
        self.places = places
    }
}

