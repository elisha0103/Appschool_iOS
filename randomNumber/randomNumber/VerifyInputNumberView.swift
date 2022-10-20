//
//  VerifyInputNumberView.swift
//  randomNumber
//
//  Created by 고도 on 2022/10/20.
//

import SwiftUI

struct VerifyInputNumberView: View {
    @Binding var number: Int
    
    var body: some View {
        Text("\(number)")
            .foregroundColor(.blue)
    }

}

//struct VerifyInputNumberView_Previews: PreviewProvider {
//    static var previews: some View {
//        VerifyInputNumberView(number: <#Binding<Int>#>)
//    }
//}
