//
//  LandMarkApp.swift
//  LandMark
//
//  Created by 진태영 on 2022/11/25.
//

import SwiftUI

@main
struct LandMarkApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
