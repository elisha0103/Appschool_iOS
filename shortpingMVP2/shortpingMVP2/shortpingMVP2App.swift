import SwiftUI
import FirebaseCore
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct shortpingMVPApp2: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
//    @StateObject var userAuthViewModel: UserAuthViewModel = UserAuthViewModel()
    @StateObject var productStore: ProductStore = ProductStore()

    var body: some Scene {
        
        WindowGroup {
            LoginView()
//                .environmentObject(UserAuthViewModel)
                .environmentObject(ProductStore())

        }
    }
}
