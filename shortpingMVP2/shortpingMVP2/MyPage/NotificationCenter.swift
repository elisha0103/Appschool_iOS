//
//  NotificationCenter.swift
//  shortpingMVP
//
//  Created by 진태영 on 2022/12/20.
//

import SwiftUI

struct NotoficationCenter: View {
    var body: some View {
        Image("notoficationImage")
            .resizable()
            .edgesIgnoringSafeArea(.all)
            .padding(EdgeInsets(top: 10, leading: 3, bottom: 0, trailing: 10))
    }
}

struct NotoficationCenter_Previews: PreviewProvider {
    static var previews: some View {
        NotoficationCenter()
    }
}
