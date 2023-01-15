//
//  VideoStore.swift
//  shortpingMVP
//
//  Created by 정소희 on 2022/12/20.
//

import Foundation
import FirebaseFirestore

class VideoStore: ObservableObject {
    @Published var videos: [Video] = []
    
    let database = Firestore.firestore()
    
    func fetchVideo() {
        database.collection("Video")
            .getDocuments { snapshot, error in
                if error != nil {
                    print(error as Any)
                }
                self.videos.removeAll()
                
                if let snapshot {
                    for doucment in snapshot.documents {
                        let docData = doucment.data()
                        
                        let videoId: String = docData["videoId"] as? String ?? ""
                        let viewCount: Int = docData["viewCount"] as? Int ?? 0
                        let likeCount: Int = docData["likeCount"] as? Int ?? 0
                        let brandLogo: String = docData["brandLogo"] as? String ?? ""
                        let brandName: String = docData["brandName"] as? String ?? ""
                        let modelHeight: Int = docData["modelHeight"] as? Int ?? 0
                        let modelWeight: Int = docData["modelWeight"] as? Int ?? 0
                        let tags: [String] = docData["tags"] as? [String] ?? []
                        
                        let video: Video = Video(videoId: videoId, viewCount: viewCount, likeCount: likeCount, brandLogo: brandLogo, brandName: brandName, modelHeight: modelHeight, modelWeight: modelWeight, tags: tags)
                        
                        self.videos.append(video)
                    }
                }
            }
    }
}
