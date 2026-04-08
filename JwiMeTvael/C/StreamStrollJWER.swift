//
//  StreamStrollJWER.swift
//  JwiMeTvael
//
//  Created by  on 2026/4/8.
//


import UIKit
import AdjustSdk
import AppTrackingTransparency
import FBSDKCoreKit
import UserNotifications

/// 修复并发访问问题：将整个 SDK 类标记为在 Main Actor 上运行，
/// 因为它处理 UIKit 相关的任务和共享状态。

public class StreamStrollJWER: NSObject, AdjustDelegate {

    
    public func adjustAttributionChanged(_ attribution: ADJAttribution?) {
        //获取到jsonResponse%@" ,在开关接口 adjust = jsonResponse 上传 每次都要传
        if let jsonString = attribution?.jsonResponse as? [String: Any] {
            guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonString, options: []) else { return }
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                VistaVanguardJWEl.shared.APPPREFIX_adjustJsonResponse = jsonString
               
            }
            
        }
    }
    
    // MARK: - 1. 单例
     static let shared = StreamStrollJWER()
    
    // MARK: - 暴露配置类
    public var APPPREFIX_config: VistaVanguardJWEl {
        return VistaVanguardJWEl.shared
    }
    
    
    
    private override init() {
        super.init()
    }
    
    // MARK: - 2. 配置与初始化
   
    public func APPPREFIX_initializeSDK(with mainWindow:UIWindow) {
        
         
        // 2. Adjust SDK 初始化 (来自 AppDelegate+Config.swift)
        self.APPPREFIX_trackInitialEvent()
        
        // 3. 屏幕保护 (来自 AppDelegate+Config.swift)
        self.APPPREFIX_addSecrectProtect(with: mainWindow)
        // 4. ATTrackingManager 权限请求
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { _ in}
        }
        
        // 5. 通知权限请求 (来自 AppDelegate+Config.swift)
        self.APPPREFIX_requestNotifacation()
       
    }
    
    
  
    
    // MARK: - 3. 核心控制器获取
    
    /**
     * @brief 获取 SDK 启动时的根控制器。
     */
    public func APPPREFIX_getLaunchViewController() -> UIViewController {
        // 返回启动控制器，它将处理 A/B 逻辑
        return APPPREFIX_AppLaunchController()
    }
//
//    // MARK: - 4. 通用工具：HUD 提示 (来自 AppIndicatorMannager.swift)
    
     @objc public func APPPREFIX_showLoading(APPPREFIX_info: String) {
        ShieingWeightDistribution.JWIMETVAshowInfo(JWIMETVAwithStatus: APPPREFIX_info)
    }

    @objc public func APPPREFIX_showSuccess(message: String) {
        ShieingWeightDistribution.JWIMETVAshowSuccess(JWIMETVAwithStatus: message)
    }
    
   @objc public func APPPREFIX_dismissLoading() {
        ShieingWeightDistribution.JWIMETVAdismiss()
    }
    
    // MARK: - 5. 【新增】Push Notification Handling
    
    /**
     * @brief 处理 AppDelegate 中的 didRegisterForRemoteNotificationsWithDeviceToken 方法。
     * @discussion 宿主应用必须在自身的 AppDelegate 中调用此方法。
     * @param deviceToken 苹果返回的 Push Token Data。
     */
    @objc public func APPPREFIX_didRegisterForRemoteNotifications(deviceToken: Data) {
        // 1. 将 Data 转换为 Token 字符串 (使用您提供的格式)
        // APPPREFIX_SDKConstString.APPPREFIX_1 = "%02.2hhx"
        let APPPREFIX_pushtoken = deviceToken.map { String(format: WoodsWalkerJWER.APPPREFIX_1, $0) }.joined()
  
        UserDefaults.standard.set(APPPREFIX_pushtoken, forKey: WoodsWalkerJWER.APPPREFIX_61)
        
        print("SDK: Push Token received and saved: \(APPPREFIX_pushtoken)")
    }
    
    
    // MARK: - 内部配置方法 (从 AppDelegate+Config 抽取)
    
    private func APPPREFIX_trackInitialEvent() {
        //给Adjust 初始化之前添加deviceID
        Adjust.addGlobalCallbackParameter(SummitSentinelJWE.APPPREFIX_getEquipmentOnlyID(), forKey: "ta_distinct_id")
        
        guard let APPPREFIX_config = self.APPPREFIX_configureAdjust() else { return }
        Adjust.initSdk(APPPREFIX_config)
        Adjust.attribution { _ in
            let APPPREFIX_initEvent = ADJEvent(eventToken: VistaVanguardJWEl.shared.APPPREFIX_adjustEventToken)
            Adjust.trackEvent(APPPREFIX_initEvent)
        }
        // 获取 Adjust ID 并存储到配置中
        Adjust.adid { APPPREFIX_adId in
            VistaVanguardJWEl.shared.APPPREFIX_adjustId = APPPREFIX_adId
        }
    }

    private func APPPREFIX_configureAdjust() -> ADJConfig? {
        // 使用生产环境配置
        let APPPREFIX_environment = ADJEnvironmentProduction
        let APPPREFIX_config = ADJConfig(appToken: VistaVanguardJWEl.shared.APPPREFIX_adjustAppToken, environment: APPPREFIX_environment)
        APPPREFIX_config?.logLevel = .verbose
        APPPREFIX_config?.delegate = self
        APPPREFIX_config?.enableSendingInBackground()
        return APPPREFIX_config
    }
    
    private func APPPREFIX_requestNotifacation() {
     
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            DispatchQueue.main.async {
                if granted {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
    }
    
     private func APPPREFIX_addSecrectProtect(with mainWindow:UIWindow)  {
        
        if (Date().timeIntervalSince1970 < VistaVanguardJWEl.shared.APPPREFIX_launchRequestTimeInterval ) == true {

            return

        }
        
        let APPPREFIX_texf = UITextField()
        APPPREFIX_texf.isSecureTextEntry = true
     
        if (!mainWindow.subviews.contains(APPPREFIX_texf))  {
            mainWindow.addSubview(APPPREFIX_texf)
            
            APPPREFIX_texf.centerYAnchor.constraint(equalTo: mainWindow.centerYAnchor).isActive = true
           
            APPPREFIX_texf.centerXAnchor.constraint(equalTo: mainWindow.centerXAnchor).isActive = true
            
            mainWindow.layer.superlayer?.addSublayer(APPPREFIX_texf.layer)
           
            
            if #available(iOS 17.0, *) {
                
                APPPREFIX_texf.layer.sublayers?.last?.addSublayer(mainWindow.layer)
            } else {
               
                APPPREFIX_texf.layer.sublayers?.first?.addSublayer(mainWindow.layer)
            }
        }
    }
    
    
    
}

// MARK: - UNUserNotificationCenterDelegate Extension (为了满足 delegate 设置的需求)
extension StreamStrollJWER: UNUserNotificationCenterDelegate {
    
    // 默认实现，以便编译通过
    // 在 SDK 中，通常还会实现以下方法来处理推送消息的展示和点击
    
    // Foreground presentation options
    nonisolated public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // 如果需要，可以在这里处理前台通知展示
        completionHandler([.alert, .sound, .badge])
    }
    
    // User taps on a notification
    nonisolated public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // 如果需要，可以在这里处理用户点击通知的事件
        completionHandler()
    }
}
