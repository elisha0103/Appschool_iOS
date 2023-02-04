//
//  StorageDate.swift
//  UserDefaultsStudy230204
//
//  Created by 유재호 on 2023/02/04.
//

import SwiftUI // Dependencies 를 최소화하자!

struct StorageDate: View {

  @AppStorage("adsHiddenDate") private var adsHiddenDate: TimeInterval? // Double 타입의 typealias 임!

  var body: some View {
    VStack(spacing: 30) {

      if shouldShowAds {
        VStack {
          Text("광고광고광고광고광고광고")
          Image("distrust")
          Text("광고광고광고광고광고광고")
        }
        .border(.red, width: 2)
      } else {
        Text("연진아.\n앞으로 약 \(timeUntilAds)초 후에 다시 광고가 뜰 거야.")
      }

      Button("광고 하루 숨기기") {
        // 이 버튼이 눌리는 '시간'을 저장할 거임!
        // MARK: 1번 방법 -- AppStorage
        adsHiddenDate = Date.now.timeIntervalSince1970 // 절대값 처럼 저장함!

        // MARK: 2번 방법 -- UserDefaults
//        UserDefaults.standard.set(Date.now.timeIntervalSince1970, forKey: "adsHiddenDate")
      }
      .buttonStyle(.bordered)
      .tint(.red)
      .disabled(!shouldShowAds)
    }
    .onAppear {
      print("❤️ 광고 페이지의 onAppear 불림!!!")
    }
  }

  private var shouldShowAds: Bool {
    guard let adsHiddenDate else { return true }
    // 현재 시간이 광고가 숨겨진 시간으로부터 15초 보다 많다면 -> 보여줘라.
    return Date.now.timeIntervalSince1970 > adsHiddenDate + 15
    // 24시간? -> 60 * 60 * 24
  }

  private var timeUntilAds: String {
    guard let adsHiddenDate else { return "" }
    return String(format: "%.1f", (adsHiddenDate + 15) - Date.now.timeIntervalSince1970)
  }
}

struct StorageDate_Previews: PreviewProvider {
  static var previews: some View {
    StorageDate()
  }
}
