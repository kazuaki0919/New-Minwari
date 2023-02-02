//
//  AppDelegate.swift
//  New Minwari
//
//  Created by 並木一晃 on 2023/01/30.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // 多画面サイズ対応
//    var window: UIWindow?
//    var iphoneSE3 : CGRect = CGRect(x: 0.0, y: 0.0, width: 375.0, height: 667.0)
//    var iphone6Plus : CGRect = CGRect(x: 0.0, y: 0.0, width: 414.0, height: 736.0)
//    var iphoneX : CGRect = CGRect(x: 0.0, y: 0.0, width: 375.0, height: 812.0)
//    var iphoneXR : CGRect = CGRect(x: 0.0, y: 0.0, width: 414.0, height: 896.0)
//    var iphoneXsMax : CGRect = CGRect(x: 0.0, y: 0.0, width: 414.0, height: 896.0)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 多画面サイズ対応
//        let screenWidth = Int(UIScreen.main.bounds.size.width);
//        //スクリーンの高さ
//        let screenHeight = Int(UIScreen.main.bounds.size.height);
//
//        if(screenHeight == Int(iphoneSE3.width) && screenWidth == Int(iphoneSE3.height)){
//            let storyboard: UIStoryboard = UIStoryboard(name: "4.7inch", bundle: Bundle.main)
//            let mainViewController: UIViewController = (storyboard.instantiateInitialViewController() as UIViewController?)!
//            self.window?.rootViewController = mainViewController
//            NSLog("iphone6")
//        }else {
//            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//            let mainViewController: UIViewController = (storyboard.instantiateInitialViewController() as UIViewController?)!
//            self.window?.rootViewController = mainViewController
//            NSLog("other's iphone")
//        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

