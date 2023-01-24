//
//  CustomAlertModifier.swift
//  CustomComponent
//
//  Created by 진태영 on 2023/01/24.
//

import SwiftUI

struct CustomAlertModifier: ViewModifier {
    @Binding var isPresented: Bool
    let title: String
    let message: String
    let primaryButtonTitle: String
    let primaryAction: () -> Void
    let withCancelButton: Bool
    
    init(isPresented: Bool, title: String, message: String, primaryButtonTitle: String, primaryAction: @escaping () -> Void, withCancelButton: Bool) {
        self.isPresented = isPresented
        self.title = title
        self.message = message
        self.primaryButtonTitle = primaryButtonTitle
        self.primaryAction = primaryAction
        self.withCancelButton = withCancelButton
    }
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            ZStack {
                if isPresented {
                        Rectangle()
                            .fill(.black.opacity(0.3))
                            .ignoresSafeArea()
                            .transition(.opacity.animation(.easeInOut(duration: 0.3)))
                        
                        CustomAlert(isPresented: _isPresented, title: self.title, message: self.message, primaryButtonTitle: self.primaryButtonTitle, primaryAction: self.primaryAction, withCancelButton: self.withCancelButton)
                        .transition(.asymmetric(insertion: .move(edge: .bottom).combined(with: .opacity), removal: .move(edge: .top).combined(with: .opacity)).animation(.easeInOut(duration: 0.3)))
                }
            }
            .animation(.easeInOut, value: isPresented)
        }
    }
}

extension View {
    func customAlert(
        isPresented: Binding<Bool>,
        title: String,
        message: String,
        primaryButtonTitle: String,
        primaryAction: @escaping () -> Void,
        withCalcenButton: Bool) -> some View
    {
        
    }
    
}

struct CustomAlertModifier_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            Text("가즈아")
        }
        .modifier(
            CustomAlertModifier(isPresented: true, title: "title", message: "message", primaryButtonTitle: "확인버튼", primaryAction: { }, withCancelButton: true))
    }
}
