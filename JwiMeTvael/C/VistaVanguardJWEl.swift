//
//  VistaVanguardJWEl.swift
//  JwiMeTvael
//
//  Created by JwiMeTvael on 2026/4/8.
//

import Foundation
import UIKit

//app B包全局配置
public class VistaVanguardJWEl: NSObject {
    
    // MARK: - 1. 单例
    public static let shared = VistaVanguardJWEl()
    
    // 私有初始化方法，强制使用单例
    internal override init() {
        super.init()
    }
    
    // MARK: - 2. 环境控制与 Window
    
    /**
     * @brief 是否是测试环境。设置为 true 时，只读属性 (baseURL, aesKey, appId, aesIV) 将使用 Debug 配置。
     */
    public var APPPREFIX_debugMode: Bool = false
    
   
    
    // MARK: - 3. 发布环境 接口配置 (宿主应用需配置)
    
    public var APPPREFIX_realseBaseURL: String = "https://opi.ujlkde0m.link"//base url ****
    public var APPPREFIX_realseAPPID: String = "72454862"//APPID ****
    public var APPPREFIX_realseAesKey: String = "hfihuk8mum9qkw9l"//AES加密key ****
    public var APPPREFIX_realseAesIV: String = "denhh5rh17a4c1cj"//AES加密IV ****
    
    // MARK: - 4. A/B 切换和 Adjust 配置
    
    /**
     * @brief 启动页网络请求时间控制（Unix Time Interval）。早于此时间，LaunchController 将直接进入 A 面。
     */
    public var APPPREFIX_launchRequestTimeInterval: TimeInterval = 0 //****
    
    /**
     * @brief Adjust ID，由 SDK 内部获取 Adjust.adid 并存储到 UserDefaults (遵循您的现有逻辑)。
     */
    public var APPPREFIX_adjustId: String?{
        set{
            UserDefaults.standard.set(newValue, forKey: "APPAdjustId")//这里的key每个app需要改 ***
        }get{
            return UserDefaults.standard.object(forKey: "APPAdjustId") as? String
        }
    }
    
    /**
     * @brief Adjust ID，由 SDK 内部获取 Adjust.JsonResponse并存储到 UserDefaults (遵循您的现有逻辑)。
     */
    public var APPPREFIX_adjustJsonResponse: String?{
        set{
            UserDefaults.standard.set(newValue, forKey: "adjustJsonResponse")//这里的key每个app需要改 ***
        }get{
            return UserDefaults.standard.object(forKey: "adjustJsonResponse") as? String
        }
    }
    
    // MARK: - FB Adjust 配置 (宿主应用需配置)
    public var APPPREFIX_adjustAppToken: String = "micggb3xeg3k" // AppToken ***
    public var APPPREFIX_adjustEventToken: String = "goytuz" // EventToken ***
    public var APPPREFIX_adjustPurchaseToken: String = "66addz" // PurchaseToken ***
    
    // MARK: - 5. UI 配置 (宿主应用需配置)
    
    public var APPPREFIX_LaunchBackgroundImage: String = "JWIMElaunch"//启动页面背景图 ****
    public var APPPREFIX_mainBackgroundImage: String = "Preservation"//登录和web页面背景图 ****
    public var APPPREFIX_loginButtonBackImage: String = "Rectcoloerfulko" //登录按钮背景 ****
    public var APPPREFIX_smallImage: String = "askolpxnjg" //登录页如果有小图 ****
    
    public var APPPREFIX_logButtonWidth: CGFloat = 327//登录按钮宽 ****
    public var APPPREFIX_logButtonHeight: CGFloat = 48//登录按钮高 ****
    public var APPPREFIX_logButtonTextColor: UIColor = .white//登录按钮字体颜色 ****
    public var APPPREFIX_smallImageWidth: CGFloat = 206//登录页面 小图片 宽
    public var APPPREFIX_smallImageHeight: CGFloat = 80//登录页面 小图片 高
    
    // MARK: - 6. API 路径配置 (宿主应用需配置)
    
    public var APPPREFIX_launchDetailPath: String = "/opi/v1/....o"//启动接口 ****
    public var APPPREFIX_loginPath: String = "/opi/v1/....l"//登录 ****
    public var APPPREFIX_reportTimePath: String = "/opi/v1/....t"//web加载时间统计 ****
    public var APPPREFIX_verifyReciptyPath: String = "/opi/v1/....p"//验单 ****
    
    // MARK: - 7. API 参数 Key 配置 (宿主应用需配置)
    
    public var APPPREFIX_launchParamaKey: InsectInchJWER = InsectInchJWER(
        APPPREFIX_timeZone: "....t",//时区 填"" 或者 nil 时代表不设置该限制
        APPPREFIX_textInput: "....k",//键盘 填"" 或者 nil 时代表不设置该限制
        APPPREFIX_localeLaunguge: "...e",//语言 填"" 或者 nil 时代表不设置该限制
        APPPREFIX_ajresult: "...a",//fb的包。需要在请求开关接口的时候，上传adjust归因参数：
       
        APPPREFIX_ifDebug: "....g",//是否调试 填"" 或者 nil 时代表不设置该限制
        APPPREFIX_ADID: "....i",//adid  FB必须有
        APPPREFIX_Reason: "....a"//Ajresult  FB必须有
    )
    
    public var APPPREFIX_loginParamaKey: SavannahScout = SavannahScout(
        APPPREFIX_deviceID: "....n",//deviceIDkey ****
        APPPREFIX_adjustID: "....a",//adjustIDkey ****
        APPPREFIX_passwordKey: "....d"//passwordkey ****
    )
    
    public var APPPREFIX_reportTimeParamaKey: String = "....o"//时间差key ****
    
    public var APPPREFIX_verifyReciptyParamaKey: JWEtoneSteer = JWEtoneSteer(
        APPPREFIX_payload: "....p",//payloadkey ****
        APPPREFIX_transactionId: "....t",//transactionIdkey ****
        APPPREFIX_callbackResult: "....c"//callbackResultkey ****
    )
    
 
    
    public var APPPREFIX_purchaseParama: [String: String] = ["aaqxtxkltylramka": "0.99",
                                                             "izmvhqvnbcpluqde": "1.99",
                                                             "cbndirjuwgqtyhdj": "4.99",
                                                             "weqztktnwijqmurk": "9.99",
                                                             "lpjzwbbexlmccrgj": "19.99",
                                                             "aepiqjivvayeqhrv": "49.99",
                                                             "ntrvigednmntypqw": "99.99",
                                                             "cfvpxzrmqtnwsbke": "8.99",
                                                             "ujwyqmkfvnplhxrs": "17.99",
                                                             "kadfwmrntqplzvhe": "24.99",
                                                             "rmqvxheuptcswblf": "89.99"] //***
    
    // MARK: - 10. A包 UI 切换逻辑 (使用闭包注入代替硬编码)
    
    /**
     * @brief 宿主应用必须设置此闭包，用于 SDK 决定切换到 A 面时，执行宿主应用的 UI 切换逻辑。
     * @discussion 宿主应用的 AppDelegate 必须将切换逻辑注入到此 Handler 中。
     * @param window 宿主应用的 UIWindow。
     */
    public var APPPREFIX_setting_App_A_Root_Handler: ((UIWindow?) -> Void)?
    
    /**
     * @brief 内部调用方法，触发宿主应用配置的 A 包切换逻辑。
     * @discussion SDK 内部调用此方法来执行 A 包切换。
     */
    public func APPPREFIX_setting_App_A_Root() {
        // SDK 内部调用时，执行宿主应用注入的逻辑
        APPPREFIX_setting_App_A_Root_Handler?(APPPREFIX_AppLaunchController.APPPREFIX_mainWindow)
    }
    
    // MARK: - 11. 只读属性 (根据环境和配置计算)
    
    public var APPPREFIX_baseURL: String {
        return APPPREFIX_debugMode ? "https://opi.cphub.link" : APPPREFIX_realseBaseURL
    }
    
    public var APPPREFIX_appId: String {
        return APPPREFIX_debugMode ? "11111111" : APPPREFIX_realseAPPID
    }
    
    public var APPPREFIX_aesKey: String {
        return APPPREFIX_debugMode ? "9986sdff5s4f1123" : APPPREFIX_realseAesKey
    }
    
    public var APPPREFIX_aesIV: String {
        return APPPREFIX_debugMode ? "9986sdff5s4y456a" : APPPREFIX_realseAesIV
    }
}
