//
//  Postit.swift
//  HelloDemo
//
//  Created by Jongwook Park on 2022/12/08.
//

import Foundation
import SwiftUI

struct Postit: Codable, Identifiable {
    var id: String
    var user: String
    var memo: String
    var colorIndex: Int
    var createdAt: Double
    
    var color: Color {
        get {
            switch colorIndex {
            case 0:
                return .cyan
            case 1:
                return .purple
            case 2:
                return .blue
            case 3:
                return .yellow
            case 4:
                return .brown
            default:
                return .white
            }
        }
    }
}

