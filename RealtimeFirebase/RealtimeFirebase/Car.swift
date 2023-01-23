//
//  Car.swift
//  RealtimeFirebase
//
//  Created by 진태영 on 2023/01/23.
//

import Foundation

struct Car : Codable, Identifiable, Hashable {
    var id: String
    var name: String
    
    var description: String
    var isHybrid: Bool
}
