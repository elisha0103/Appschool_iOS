//
//  ContentView.swift
//  UserDefaultsStudy230204
//
//  Created by 유재호 on 2023/02/04.
//

import SwiftUI

struct ContentView: View {

  var body: some View {
    TabView {
      StorageSimple()
        .tabItem {
          Label("유저디폴트", systemImage: "tray")
        }

      StorageDate()
        .tabItem {
          Label("광고 가리기", systemImage: "eye.slash")
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
