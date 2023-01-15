//
//  SubCategory.swift
//  shortpingMVP
//
//  Created by 염성필 on 2022/12/21.
//

import SwiftUI


/// 서브 카테고리
struct SubCategoryView: View {
    
    let isActive: Bool
    let text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            Text(text)
                .foregroundColor(Color.green)
            if isActive {
                Rectangle()
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
                    .foregroundColor(Color.green)
            }
            
        }
    }
}

struct SubCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        SubCategoryView(isActive: false, text: "니트")
    }
}
