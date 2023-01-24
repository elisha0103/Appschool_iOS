//
//  CustomAlert.swift
//  CustomComponent
//
//  Created by 진태영 on 2023/01/24.
//

import SwiftUI

struct CustomAlert: View {
    @Binding var isPresented: Bool
    let title: String
    let message: String
    let primaryButtonTitle: String
    let primaryAction: () -> Void
    let withCancelButton: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            
        }
    }
}

struct CustomAlert_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlert(isPresented: .constant(true), title: "title", message: "message", primaryButtonTitle: "확인", primaryAction: { }, withCancelButton: true)
    }
}
