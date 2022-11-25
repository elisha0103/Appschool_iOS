//
//  LandmarkDetail.swift
//  LandMark
//
//  Created by 진태영 on 2022/11/25.
//

import SwiftUI
import MapKit

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: LandMark
    
    
    var landmarkIndex: Int{
        get{
            // 앞 선 List에서 넘겨준 landmark가 전체 목록(modelData의에서 몇 번째인지 알고자 하는 코드
            return modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
        }
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinates)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading){
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
                HStack{
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            Spacer()

        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        NavigationStack{
            LandmarkDetail(landmark: ModelData().landmarks[0])
                .environmentObject(ModelData())
        }
    }
}
