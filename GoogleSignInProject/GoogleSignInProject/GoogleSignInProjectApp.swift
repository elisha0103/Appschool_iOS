
import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()

        return true
    }
}

@main
struct GoogleSignInProjectApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authenticationViewModel: AuthenticationViewModel = AuthenticationViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authenticationViewModel)
        }
    }
}
