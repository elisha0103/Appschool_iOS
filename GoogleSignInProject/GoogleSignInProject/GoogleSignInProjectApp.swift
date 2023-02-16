//
//  GoogleSignInProjectApp.swift
//  GoogleSignInProject
//
//  Created by 진태영 on 2023/01/25.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()

        return true
    }
}

@main
struct GoogleSignInProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
