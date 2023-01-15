//
//  ProductReviewsStore.swift
//  shortpingMVP
//
//  Created by 정소희 on 2022/12/20.
//

import Foundation
import FirebaseFirestore

class ProductReviewsStore: ObservableObject {
    @Published var productReviews: [ProductReviews] = []
    
    let database = Firestore.firestore()
    //productId일치하는 리뷰 연결
    var productId: String = ""
  
    func fetchReviews() {
        database.collection("Product").document(productId).collection("ProductReviews")
            .getDocuments { snapshot, error in
                if error != nil {
                    print(error as Any)
                }
                self.productReviews.removeAll()
                
                if let snapshot {
                    for document in snapshot.documents {
                        let docData = document.data()
                        let reviewerId: String = docData["reviewerId"] as? String ?? ""
                        let reviewText: String = docData["reviewText"] as? String ?? ""
                        let createdAt: Double = docData["createdAt"] as? Double ?? 0.0
                        let ratings: [Int] = docData["ratings"] as? [Int] ?? []
                        
//                        let createdDate: String = docData["createdDate"] as? String ?? ""
//
                        let productReview: ProductReviews = ProductReviews(reviewerId: reviewerId, reviewText: reviewText, createdAt: createdAt, ratings: ratings)
                        
                        self.productReviews.append(productReview)
                    }
                }
            }
    }
}
