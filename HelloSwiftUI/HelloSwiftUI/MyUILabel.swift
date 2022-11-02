//
//  MyUILabel.swift
//  HelloSwiftUI
//
//  Created by 진태영 on 2022/11/02.
//

import SwiftUI


struct MyUILabel: UIViewRepresentable {
    var text: String
    
    // UIView 기반 컴포넌트의 인스턴스를 생성하고
    // 필요한 초기화 작업을 수행한 뒤 반환하는 역할을 한다.
    func makeUIView(context: UIViewRepresentableContext<MyUILabel>) -> UIView {
        let myLabel = UILabel()
        myLabel.text = text
        return myLabel
    }
    
    // UIView 자체를 업데이트해야 하는 변경이
    // SwiftUI 뷰에서 생길 때마다 호출된다.
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<MyUILabel>) {
        // 필요한 작업을 수행한다.
    }
    
}

struct MyUILabe_Previews: PreviewProvider{
    static var previews: some View{
        MyUILabel(text: "Hello")
    }
}

