//
//  LandmarkList.swift
//  LandMark
//
//  Created by 진태영 on 2022/11/25.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    
    @State private var showFavoritesOnly: Bool = false
    
    // landMark의 배열 중에서 필터링된 landmarks를 리턴해서 filterLandmarks에 대입해준다.
    var filteredLandmarks: [LandMark] {
        get {
            return modelData.landmarks.filter { landmark in
                return (!showFavoritesOnly || landmark.isFavorite)
            }
        }
    }
    
    var body: some View {
        NavigationStack{
            List{
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks){ landmark in
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    } label:{
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (3rd generation)", "iPhone 14 Pro", "iPhone 14 Pro Max"], id: \.self){ deviceName in
            LandmarkList()
                .environmentObject(ModelData())
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
