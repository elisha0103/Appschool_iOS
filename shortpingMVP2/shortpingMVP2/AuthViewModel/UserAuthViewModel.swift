//
//  EmailAuthViewModel.swift
//  shortpingMVP
//
//  Created by 진태영 on 2022/12/20.
//

import Foundation
import FirebaseAuth
import Firebase
import GoogleSignIn

final class UserAuthViewModel: ObservableObject {
    @Published var state: SignInState = .signedOut
    let database = Firestore.firestore()
    
    // MARK: Email Auth property
    var user: FirebaseAuth.User? {
        didSet {
            objectWillChange.send()
        }
    }
    
    // MARK: Google Auth property
    var googleUser: GIDGoogleUser?
    
    
    var uid: String = ""
    var userName: String?
    var email: String?
    
    
    var errorMessage: String = ""
    
    // MARK: User Information
    var cart: [Cart] = []
    var history: [History] = []
    
    
    enum SignInState{
        case signedIn
        case signedOut
    }
    
    
    // MARK: Email Auth Function - Check Login State
    func emailAuthListenToAuthState() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self = self else {
                return
            }
            self.user = user
            print("email login listen")
            
            
        }
    }
    
    // MARK: Email Auth Function - Sign In
    func emailAuthSignIn(email: String, password: String){
        self.errorMessage = ""
        Auth.auth().signIn(withEmail: email, password: password){result, error in
            if let error = error{
                self.errorMessage = error.localizedDescription
                print("Login error: \(self.errorMessage)")
            }
            if let user = result?.user{
                self.user = user
                self.uid = user.uid
                self.email = user.email
                UserDefaults.standard.set("Email", forKey: "platform")
                UserDefaults.standard.set(email, forKey: "email")
                UserDefaults.standard.set(password, forKey: "pw")
                self.state = .signedIn
                print("email login complete + auto")
                self.fetchUserData()
            }
        }
    }
    
    // MARK: Email Auth Function - Sign Up
    func emailAuthSignUp(email: String, userName: String, password: String){
        self.errorMessage = ""
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                print("an error occured: \(self.errorMessage)")
                return
            }
            
            switch result {
            case .none:
                print("Could not create account")
                self.errorMessage = "계정을 생성할 수 없습니다."
            case .some(_):
                print("User created")
                self.uid = result?.user.uid ?? UUID().uuidString
                self.userName = userName
                self.email = email
                self.firebaseSignUp() // User collection에 등록
            }
        }
    }
    
    // MARK: Email Auth Function - Sign Out
    func emailAuthSignOut() {
        self.errorMessage = ""
        do {
            try Auth.auth().signOut()
            UserDefaults.standard.removeObject(forKey: "platform")
            UserDefaults.standard.removeObject(forKey: "email")
            UserDefaults.standard.removeObject(forKey: "pw")
            state = .signedOut
            self.uid = ""
            self.userName = nil
            self.email = nil
            self.cart = []
            self.history = []
            self.user = nil
        } catch let signOutError as NSError {
            self.errorMessage = signOutError.localizedDescription
            print("Error signing out: \(self.errorMessage)")
        }
    }
    
    // MARK: Google Auth Function - Sign In
    func googleSignIn(){
        if GIDSignIn.sharedInstance.hasPreviousSignIn(){
            GIDSignIn.sharedInstance.restorePreviousSignIn{ [unowned self] user, error in
                authenticateUser(for: user, with: error)
                self.googleUser = user
                
                if let userID = user?.userID{
                    self.uid = userID
                }
                if let email = user?.profile?.email{
                    self.email = email
                    print("Google Login + auto")
                    UserDefaults.standard.set("Google", forKey: "platform")
                    UserDefaults.standard.set(self.email, forKey: "email")
                }
                if let userName = user?.profile?.name{
                    self.userName = userName
                    fetchUserData()
                }
            }
        } else{
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }
            let configuration = GIDConfiguration(clientID: clientID)
            
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
            guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
            
            GIDSignIn.sharedInstance.signIn(with: configuration, presenting: rootViewController){[unowned self] user, error in
                authenticateUser(for: user, with: error)
                
                guard error == nil else {return}
                guard let user = user else { return }
                
                self.googleUser = user
                
                if let userID = user.userID{
                    self.uid = userID
                }
                if let email = user.profile?.email{
                    self.email = email
                    print("Google Login")
                    UserDefaults.standard.set("Google", forKey: "platform")
                    UserDefaults.standard.set(self.email, forKey: "email")
                }
                if let userName = user.profile?.name{
                    self.userName = userName
                    fetchUserData()
                }
            }
        } // else
    }
    
    private func authenticateUser(for user: GIDGoogleUser?, with error: Error?){
        self.errorMessage = ""
        if let error = error{
            self.errorMessage = error.localizedDescription
            print("Google Login error : \(errorMessage)")
            return
        }
        guard let authentication = user?.authentication, let idToken = authentication.idToken else { return }
        
        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
        
        Auth.auth().signIn(with: credential) { [unowned self] (_, error) in
            self.errorMessage = ""
            if let errorMassage = error?.localizedDescription {
                print("Error sign In: \(errorMassage)")
            } else {
                print("google sign state signin")
                self.state = .signedIn
            }
        }
    }
    
    // MARK: Google Auth Function - Sign Out
    func googleSignOut(){
        self.errorMessage = ""
        GIDSignIn.sharedInstance.signOut()
        
        do{
            try Auth.auth().signOut()
            state = .signedOut
            UserDefaults.standard.removeObject(forKey: "platform")
            UserDefaults.standard.removeObject(forKey: "emailAddress")
            self.uid = ""
            self.userName = nil
            self.email = nil
            self.cart = []
            self.history = []
            self.googleUser = nil
        } catch{
            self.errorMessage = error.localizedDescription
            print("google signout error: \(self.errorMessage)")
        }
    }
    
    // MARK: User Data Function
    func fetchUserData() {
        print("fetchUserData start")
            self.cart.removeAll()
            self.history.removeAll()
        var checkId: Bool = false // User 데이터베이스에 ID가 있는지 확인
        // User collection에 id가 없으면 추가해줘야함
        // GoogleLogin 경우, 회원가입같은 로직이 없는데 로그인과 동시에 User Collection에 등록해줄 수 없다. 따라서 Google id가 User collection에 없으면 추가해주는 것도 진행
        
        // email 로그인 경우, 데이터베이스에서 해당 이름을 찾아와야 함. (Firebase Auth에 Name은 저장되지 않음)
        database.collection("User")
            .getDocuments { snapshot, error in
                if let snapshot{
                    for document in snapshot.documents{
                        if self.uid == document.documentID{
                            let docData = document.data()
                            self.userName = docData["userName"] as? String
                            checkId = true
                        }
                    }
                    if !checkId{ // 현재 로그인된 uid가 User collection에는 없는 경우(Google 계정으로 처음 로그인 경우가 해당)
                        self.firebaseSignUp() // Google 계정 정보를 User Collection에 등록해줌.
                        checkId = false
                    }
                }
            }
        
        
        database.collection("User").document(self.uid).collection("Cart")
            .getDocuments{(snapshot, error) in
                if let snapshot{
                    for document in snapshot.documents{
                        let docData = document.data()
                        
                         //let cartId: String = document.documentID
                        let productId: String = docData["productId"] as? String ?? ""
                        let selectedColor: String = docData["selectedColor"] as? String ?? ""
                        let selectedSize: String = docData["selectedSize"] as? String ?? ""
                        let isMarked: Bool = docData["isMarked"] as? Bool ?? true
                        
                        let cart: Cart = Cart(productId: productId, selectedColor: selectedColor, selectedSize: selectedSize, isMarked: isMarked)
                        self.cart.append(cart)
                    }
                }
            }
        
        database.collection("User").document(self.uid).collection("History")
            .getDocuments { (snapshot, error) in
                if let snapshot{
                    for document in snapshot.documents{
                        let docData = document.data()
                        
                        let purchaseId: String = document.documentID
                        let productId: String = docData["productId"] as? String ?? ""
                        let purchasedAt: Double = docData["purchasedAt"] as? Double ?? 0
                        let isWritten: Bool = docData["isWritten"] as? Bool ?? false
                        let rating: Int = docData["rating"] as? Int ?? 0
                        let reviewText: String = docData["reviewText"] as? String ?? ""
                        let selectedColor: String = docData["selectedColor"] as? String ?? ""
                        let selectedSize: String = docData["selectedSize"] as? String ?? ""
                        
                        let history: History = History(purchaseId: purchaseId, productId: productId, purchasedAt: purchasedAt, isWritten: isWritten, rating: rating, reviewText: reviewText, selectedColor: selectedColor, selectedSize: selectedSize)
                        
                        self.history.append(history)
                    }
                }
            }
    }
    
    func firebaseSignUp(){
            database.collection("User")
                .document(self.uid)
                .setData([
                    "uid": self.uid,
                    "userName": self.userName ?? "",
                    "email": self.email ?? ""
                ])
    }
}

