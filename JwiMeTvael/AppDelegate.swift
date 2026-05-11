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
        ApplicationDelegate.shared.initializeSDK()
        let hollyViewport = UIScreen.main.bounds
        let caravanDisplay = UIWindow(frame: hollyViewport)
        self.window = caravanDisplay
        VistaVanguardJWEl.shared.fastFindJOWE = { window in
             let roadTripContext = self.inspectHollyCampingInventory()
             self.coordinateExpeditionRoute(on: caravanDisplay, with: roadTripContext)
        }
        
        if let addwindow = self.window {
         
            ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
            StreamStrollJWER.feelFind.vibrantVenture(energyEcho: addwindow)
        }
       
        window?.rootViewController = StreamStrollJWER.feelFind.abideAimjwoe()
        self.window?.makeKeyAndVisible()
       
        return true
    }
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
      
        StreamStrollJWER.feelFind.clueCruise(hintHush: deviceToken)
    }
 
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

