//
//  AppDelegate.swift
//  JwiMeTvael
//
//  Created by JWIMETVA on 2025/12/12.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        if JWIMETVAuserView.JWIMErvPortableDeskKit  == nil {
            self.window?.rootViewController = JWIMETVALoginViewAssembler()
        }else{
            self.window?.rootViewController =  JWIMETVATabBarAssembler()
        }
       
        self.window?.makeKeyAndVisible()
        return true
    }

   
}

