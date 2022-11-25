//
//  FavoriteButton.swift
//  LandMark
//
//  Created by 진태영 on 2022/11/25.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var buttonImage: String {
        isSet ? "star.fill" : "star"
    }
    
    var buttonColor: Color{
        isSet ? .yellow : .gray
    }
    
    var body: some View {
        Button{
            isSet.toggle()
        }label: {
            Label("Toggle Favorite", systemImage: buttonImage)
                .labelStyle(.iconOnly)
                .foregroundColor(buttonColor)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
