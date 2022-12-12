//
//  PostitStore.swift
//  HelloDemo
//
//  Created by Jongwook Park on 2022/12/08.
//

import Foundation
import FirebaseFirestore

class PostitStore: ObservableObject {
    @Published var postits: [Postit] = []
    
    let database = Firestore.firestore()

//    private lazy var databaseReference: DatabaseReference? = {
//            let ref = Database.database().reference().child("postits")
//            return ref
//        }()
//
//    private let encoder = JSONEncoder()
//    private let decoder = JSONDecoder()
    
    func fetchPostits() {
        database.collection("Postits")
            .getDocuments { (snapshot, error) in
                self.postits.removeAll()
                
                if let snapshot {
                    for document in snapshot.documents{
                        print("\(document.documentID)")
                        
                        let docData = document.data()
                        let user: String = docData["user"] as? String ?? ""
                        let memo: String = docData["memo"] as? String ?? ""
                        let colorIndex: Int = docData["colorIndex"] as? Int ?? 0
                        let createAt: Double = docData["createdAt"] as? Double ?? 0
                        
                        let postit: Postit = Postit(id: document.documentID, user: user, memo: memo, colorIndex: colorIndex, createdAt: createAt)
                        self.postits.append(postit)
                    }
                }
            }
    }
    
    func addPostit(_ postit: Postit) {
        database.collection("Postits")
            .document(postit.id)
            .setData(["user": postit.user,
                      "memo" : postit.memo,
                      "colorIndex" : postit.colorIndex,
                      "createdAt" : postit.createdAt])
        fetchPostits()
    }
    
    func removePostit(_ postit: Postit) {
        database.collection("Postits")
            .document(postit.id).delete()
        fetchPostits()
    }
    
}
