//
//  CarDetail.swift
//  ListNavDemo
//
//  Created by 진태영 on 2022/10/25.
//

import SwiftUI

// 리스트 클릭시 나타나는 상세 뷰
struct CarDetail: View {
    
    // 리스트에서 선택된 자동차 정보
    let selectedCar: Car
    var body: some View {
        // 뷰들을 그룹핑 하고 서로 다른 섹션으로 나누게 해줌
        Form{
            // 상단 제목으로 그룹핑
            // 각 컴포넌트마다 작은 구분선으로 구분
            Section(header: Text("Car Details")){
                Image(selectedCar.imageName)
                    .resizable()
                    .cornerRadius(12.0)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Text(selectedCar.name)
                    .font(.headline)
                
                Text(selectedCar.description)
                    .font(.body)
                
                HStack{
                    Text("Hybrid")
                        .font(.headline)
                    Spacer()
                    Image(systemName: selectedCar.isHybrid ? "checkmark.circle" : "xmark.circle")
                }
            }
        }
    }
}

struct CarDetail_Previews: PreviewProvider {
    static var previews: some View {
        CarDetail(selectedCar: carData[0])
    }
}
