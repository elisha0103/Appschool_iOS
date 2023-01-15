//
//  ProductStore.swift
//  shortpingMVP
//
//  Created by 정소희 on 2022/12/20.
//

import Foundation
import FirebaseFirestore

class ProductStore: ObservableObject {
    @Published var products: [Product] = []
    
    let database = Firestore.firestore()
  
    func fetchProduct() {
        database.collection("Product")
            .getDocuments { snapshot, error in
                self.products.removeAll()
                
                if let snapshot {
                    for document in snapshot.documents {
                        //let id: String = document.documentID
                        let docData = document.data()
                        
                        let productId: String = docData["productId"] as? String ?? ""
                        let brandLogo: String = docData["brandLogo"] as? String ?? ""
                        let brandName: String = docData["brandName"] as? String ?? ""
                        let productName: String = docData["productName"] as? String ?? ""
                        let colors: [String] = docData["colors"] as? [String] ?? []
                        let imageList: [String] = docData["imageList"] as? [String] ?? []
                        let likeCount: Int = docData["likeCount"] as? Int ?? 0
                        let mainCategory: String = docData["mainCategory"] as? String ?? ""
                        let price: String = docData["price"] as? String ?? ""
                        let sex: String = docData["sex"] as? String ?? ""
                        let sizeList: [String] = docData["sizeList"] as? [String] ?? []
                        let subCategory: String = docData["subCategory"] as? String ?? ""
                        
                        let product: Product = Product(productId: productId, brandLogo: brandLogo, brandName: brandName, productName: productName, colors: colors, imageList: imageList, likeCount: likeCount, mainCategory: mainCategory, price: price, sex: sex, sizeList: sizeList, subCategory: subCategory)
                        
                        self.products.append(product)
                    }
            }
        }
    }
    
    
}
