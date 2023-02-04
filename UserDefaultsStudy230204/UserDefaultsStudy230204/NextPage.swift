//
//  NextPage.swift
//  UserDefaultsStudy230204
//
//  Created by 유재호 on 2023/02/04.
//

import SwiftUI

struct NextPage: View {

  @AppStorage("name") private var name: String?

  var body: some View {
    VStack(spacing: 30) {
      GroupBox {
        VStack(spacing: 20) {
          Text("현재 사용자의 이름은")

          if let name {
            Text(name)
              .font(.largeTitle)
              .bold()
          } else {
            Text("없습니다.")
              .font(.largeTitle)
              .bold()
          }
        }
      }

      Button("삭제") {
        // MARK: 1번 방법 -- AppStorage
//        name = nil

        // MARK: 2번 방법 -- UserDefaults
//        UserDefaults.standard.set(nil, forKey: "name")

        // MARK: 3번 방법
        UserDefaults.standard.removeObject(forKey: "name") // nil 을 할당하는 것과 동일한 의미임!
      }
      .buttonStyle(.bordered)
      .tint(.red)
      .disabled(name == nil)
    }
  }
}

struct NextPage_Previews: PreviewProvider {
  static var previews: some View {
    NextPage()
  }
}
