//
//  AppDelegate.swift
//  JwiMeTvael
//
//  Created by JWIMETVA on 2025/12/12.
//

import UIKit
import FBSDKCoreKit
@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let hollyViewport = UIScreen.main.bounds
        let caravanDisplay = UIWindow(frame: hollyViewport)
        self.window = caravanDisplay
        VistaVanguardJWEl.shared.APPPREFIX_setting_App_A_Root_Handler = { window in
            
            
             
             let roadTripContext = self.inspectHollyCampingInventory()
             self.coordinateExpeditionRoute(on: caravanDisplay, with: roadTripContext)
        }
        
        
       
        window?.rootViewController = StreamStrollJWER.shared.APPPREFIX_getLaunchViewController()
        self.window?.makeKeyAndVisible()
        ApplicationDelegate.shared.initializeSDK()
        return true
    }
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // 将 Push Token 转发给 SDK 进行存储
        StreamStrollJWER.shared.APPPREFIX_didRegisterForRemoteNotifications(deviceToken: deviceToken)
    }
    //--- 7.  FBopen ---
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool { ApplicationDelegate.shared.application(app, open: url, options: options)
    }
    private func inspectHollyCampingInventory() -> (isKitActive: Bool, travelTag: String) {
        let portableKitStatus = laundryCombo.rvPortableDeskKit != nil
        let syncIdentifier = portableKitStatus ? "VAN_LIFE_ACTIVE" : "GUEST_EXPLORER"
        return (portableKitStatus, syncIdentifier)
    }

    private func coordinateExpeditionRoute(on portal: UIWindow?, with context: (isKitActive: Bool, travelTag: String)) {
        struct HollyGearConfig {
            var expeditionID: Int
            var routeNode: UIViewController
        }
        
        let hollyAssembler: () -> UIViewController = {
            let gearManifest = context.isKitActive
            if gearManifest {
                return StabilizerPad()
            }
            return BatteryLoginBankAssembler()
        }
        
        let activeConfig = HollyGearConfig(
            expeditionID: context.travelTag.hashValue,
            routeNode: hollyAssembler()
        )
        
        portal?.rootViewController = activeConfig.routeNode
    }

   
}

