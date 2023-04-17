//
//  EmailAuthProjectApp.swift
//  EmailAuthProject
//
//  Created by 진태영 on 2023/04/17.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct YourApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var viewModel: ViewModel = ViewModel()

  var body: some Scene {
    WindowGroup {
      NavigationView {
        ContentView()
              .environmentObject(viewModel)
      }
    }
  }
}
