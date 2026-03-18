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
        let hollyViewport = UIScreen.main.bounds
        let caravanDisplay = UIWindow(frame: hollyViewport)
        self.window = caravanDisplay
        
        let roadTripContext = self.inspectHollyCampingInventory()
        self.coordinateExpeditionRoute(on: caravanDisplay, with: roadTripContext)
        
        self.window?.makeKeyAndVisible()
        return true
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

