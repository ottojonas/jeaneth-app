import UIKit
import Flutter
import Firebase
import FirebaseMessaging
import FirebaseCore

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
        override func application(_application:UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            FirebaseApp.configure()
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]){granted, error in 
            if granted{
                print('notification permission granted')
            } else {
                print('notification permission denied')
            }
            }
            application.registerForRemoteNotifications()
            Messaging.messaging().delegate=self
            return super.application(application, didFinishLaunchingWithOptions: launchOptions)
        }
        func messaging(_messaging:Messaging, didReceiveRegistrationToken fcmToken: String?){
            print('FCM token: \(fcmToken ??'')')
        }
    }