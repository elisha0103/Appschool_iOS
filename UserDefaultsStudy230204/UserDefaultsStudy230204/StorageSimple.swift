//
//  StorageSimple.swift
//  UserDefaultsStudy230204
//
//  Created by 유재호 on 2023/02/04.
//

import SwiftUI

struct StorageSimple: View {

  @AppStorage("name") private var name: String?
  @AppStorage("isDarkMode") private var isDarkMode: Bool = false

  @State private var tempName: String = ""

  var body: some View {
    NavigationView {
      VStack(spacing: 30) {
        GroupBox {
          Toggle(isDarkMode ? "다크모드 ON" : "다크모드 OFF", isOn: $isDarkMode)

          Text("현재 사용자의 이름은")

          // 위 내용이 길면 이렇게 할 수도 있음! 살짝 찝찝함은 있지만 ㅎ
          Text(name == nil ? "없습니다." : name!)
            .font(.largeTitle)
            .bold()
        }

        TextField("사용자 이름", text: $tempName)
          .autocorrectionDisabled()
          .padding()
          .background(
            RoundedRectangle(cornerRadius: 12)
              .stroke(.mint, lineWidth: 2)
          )
          .submitLabel(.search)
          .onSubmit {
            save()
          }

        Button("이름 저장") {
          save()
        }
        .buttonStyle(.bordered)
        .tint(.mint)

        NavigationLink("다음 페이지로") {
          NextPage()
        }
        .buttonStyle(.bordered)
      }
      .padding()
    }

  }

  private func save() {
    // MARK: 1번 방법 -- AppStorage
    name = tempName

    // MARK: 2번 방법 -- UserDefaults
    UserDefaults.standard.set(tempName, forKey: "name") // 90% 점유율

    tempName = ""
  }
}

struct StorageSimple_Previews: PreviewProvider {
  static var previews: some View {
    StorageSimple()
  }
}
