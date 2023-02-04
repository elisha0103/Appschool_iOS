//
//  UserDefaultsStudy230204App.swift
//  UserDefaultsStudy230204
//
//  Created by 유재호 on 2023/02/04.
//

import SwiftUI

@main
struct UserDefaultsStudy230204App: App {

  @AppStorage("isDarkMode") private var isDarkMode: Bool = false

  var body: some Scene {
    WindowGroup {
      ContentView()
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
  }
}
