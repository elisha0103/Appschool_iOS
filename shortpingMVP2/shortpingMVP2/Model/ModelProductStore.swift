//
//  ModelProductStore.swift
//  shortpingMVP
//
//  Created by 정소희 on 2022/12/20.
//

import Foundation
import FirebaseFirestore

class ModelProductStore: ObservableObject {
    @Published var modelProducts: [ModelProduct] = []
    
    let database = Firestore.firestore()
    var videoId: String = ""
    func fetchModelProduct() {
        database.collection("Video").document(videoId).collection("modelProductList")
            .getDocuments { snapshot, error in
                if error != nil {
                    print(error as Any)
                }
                self.modelProducts.removeAll()
                
                if let snapshot {
                    for document in snapshot.documents {
                        let docData = document.data()
                        
                        let modelProductId: String = docData["modelProductId"] as? String ?? ""
                        let modelProductPrice: String = docData["modelProductPrice"] as? String ?? ""
                        let modelProductSize: String = docData["modelProductSize"] as? String ?? ""
                        
                        let modelProduct: ModelProduct = ModelProduct(modelProductId: modelProductId, modelProductPrice: modelProductPrice, modelProductSize: modelProductSize)
                        
                        self.modelProducts.append(modelProduct)
                    }
                }
            }
    }
}
