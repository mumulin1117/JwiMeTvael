//
//  OrbitalCompassJWE.swift
//  JwiMeTvael
//
//  Created by JwiMeTvael on 2026/4/8.
//

import UIKit
import WebKit



public class SavannahScout: NSObject {
    public var APPPREFIX_deviceID: String
    public var APPPREFIX_adjustID: String
    public var APPPREFIX_passwordKey: String
    public init(APPPREFIX_deviceID: String,APPPREFIX_adjustID:String,APPPREFIX_passwordKey:String) {
        self.APPPREFIX_deviceID = APPPREFIX_deviceID
        self.APPPREFIX_adjustID = APPPREFIX_adjustID
        self.APPPREFIX_passwordKey = APPPREFIX_passwordKey
    }
}
// 快速登录
class OrbitalCompassJWE: UIViewController  {
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APPPREFIX_foreLoadWebContent()
        APPPREFIX_addBackgroundImageView()
        APPPREFIX_addLoginButton()
        APPPREFIX_addSmallImageView()
    }
    
    private func APPPREFIX_addBackgroundImageView()  {
        let APPPREFIX_laungchstr = VistaVanguardJWEl.shared.APPPREFIX_mainBackgroundImage
        
        let APPPREFIX_backgroundImage = UIImage(named: APPPREFIX_laungchstr)
       
        let APPPREFIX_BbckgroundImageView = UIImageView(image:APPPREFIX_backgroundImage )
        APPPREFIX_BbckgroundImageView.contentMode = .scaleAspectFill
        APPPREFIX_BbckgroundImageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        view.addSubview(APPPREFIX_BbckgroundImageView)
       
    }
    
    
    private func APPPREFIX_addLoginButton()  {
        let  APPPREFIX_loginButton = UIButton.init()
        let APPPREFIX_laungchstr = VistaVanguardJWEl.shared.APPPREFIX_loginButtonBackImage
        
        let APPPREFIX_backgroundImage = UIImage(named: APPPREFIX_laungchstr)
     
        APPPREFIX_loginButton.setBackgroundImage(APPPREFIX_backgroundImage, for: .normal)
        if VistaVanguardJWEl.shared.APPPREFIX_loginButtonBackImage == "" {
            APPPREFIX_loginButton.layer.cornerRadius = 10
            APPPREFIX_loginButton.layer.masksToBounds = true
            APPPREFIX_loginButton.backgroundColor = .white
        }
        
        APPPREFIX_loginButton.setTitleColor(VistaVanguardJWEl.shared.APPPREFIX_logButtonTextColor, for: .normal)
        APPPREFIX_loginButton.setTitle(WoodsWalkerJWER.APPPREFIX_22, for: .normal)
        APPPREFIX_loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        
        
        view.addSubview(APPPREFIX_loginButton)
        APPPREFIX_loginButton.addTarget(self, action: #selector(APPPREFIX_performLoginRequest), for: .touchUpInside)
        APPPREFIX_loginButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            APPPREFIX_loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            APPPREFIX_loginButton.heightAnchor.constraint(equalToConstant: VistaVanguardJWEl.shared.APPPREFIX_logButtonHeight),
            APPPREFIX_loginButton.widthAnchor.constraint(equalToConstant: VistaVanguardJWEl.shared.APPPREFIX_logButtonWidth),
            APPPREFIX_loginButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,
                                              constant: -self.view.safeAreaInsets.bottom - 55)
        ])
       
    }
   
    func APPPREFIX_addSmallImageView() {
        if VistaVanguardJWEl.shared.APPPREFIX_smallImage != "" {
            let backgroundImage = UIImage(named:VistaVanguardJWEl.shared.APPPREFIX_smallImage)
            let BbckgroundImageView = UIImageView(image:backgroundImage )
            BbckgroundImageView.contentMode = .scaleAspectFill

            view.addSubview(BbckgroundImageView)
            NSLayoutConstraint.activate([
                BbckgroundImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                BbckgroundImageView.heightAnchor.constraint(equalToConstant:VistaVanguardJWEl.shared.APPPREFIX_smallImageHeight),
                BbckgroundImageView.widthAnchor.constraint(equalToConstant: VistaVanguardJWEl.shared.APPPREFIX_smallImageWidth),
                BbckgroundImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,
                                                  constant: -self.view.safeAreaInsets.bottom - 55 - VistaVanguardJWEl.shared.APPPREFIX_logButtonHeight - 30)
            ])
            
        }
        
    }
    //预加载
    private func APPPREFIX_foreLoadWebContent()  {
     
        let APPPREFIX_webConfig = WKWebViewConfiguration()
        APPPREFIX_webConfig.allowsAirPlayForMediaPlayback = false
        APPPREFIX_webConfig.allowsInlineMediaPlayback = true
        APPPREFIX_webConfig.preferences.javaScriptCanOpenWindowsAutomatically = true
        APPPREFIX_webConfig.mediaTypesRequiringUserActionForPlayback = []
        
       let APPPREFIX_webViewContainer = WKWebView(frame: UIScreen.main.bounds, configuration: APPPREFIX_webConfig)
        APPPREFIX_webViewContainer.isHidden = true
        APPPREFIX_webViewContainer.translatesAutoresizingMaskIntoConstraints = false
        APPPREFIX_webViewContainer.scrollView.alwaysBounceVertical = false
        APPPREFIX_webViewContainer.scrollView.contentInsetAdjustmentBehavior = .never
        
        APPPREFIX_webViewContainer.allowsBackForwardNavigationGestures = true
        view.addSubview(APPPREFIX_webViewContainer)
       
        if let APPPREFIX_openValue = UserDefaults.standard.object(
            forKey: WoodsWalkerJWER.APPPREFIX_63
        ) as? String, let url = URL(string: APPPREFIX_openValue) {
            APPPREFIX_webViewContainer.load(URLRequest(url: url))
            
        }
        
        
    }
    
    @objc func APPPREFIX_performLoginRequest() {
        
        ShieingWeightDistribution.JWIMETVAshowInfo(JWIMETVAwithStatus: WoodsWalkerJWER.APPPREFIX_11)
        
        var APPPREFIX_loginParams: [String: Any] = [:]
        
        // 设备 ID
        APPPREFIX_loginParams[VistaVanguardJWEl.shared.APPPREFIX_loginParamaKey.APPPREFIX_deviceID] = SummitSentinelJWE.APPPREFIX_getEquipmentOnlyID()
   
         
        // Adjust ID
        let adjustIDKey = VistaVanguardJWEl.shared.APPPREFIX_loginParamaKey.APPPREFIX_adjustID
        APPPREFIX_loginParams[adjustIDKey] = VistaVanguardJWEl.shared.APPPREFIX_adjustId
       
        // 密码（首次登录才会存在）
        if let APPPREFIX_savedPassword = SummitSentinelJWE.APPPREFIX_getUserloginpassword() {
            APPPREFIX_loginParams[VistaVanguardJWEl.shared.APPPREFIX_loginParamaKey.APPPREFIX_passwordKey] = APPPREFIX_savedPassword
        }
        
        // 发起登录
        TerrainTapestryJwe.shared.APPPREFIX_postRequest(
            VistaVanguardJWEl.shared.APPPREFIX_loginPath,
                    APPPREFIX_params: APPPREFIX_loginParams
        ) { result in
            
            ShieingWeightDistribution.JWIMETVAdismiss()
            
            switch result {
            case .success(let APPPREFIX_response):
                
                guard
                    let APPPREFIX_responseDict = APPPREFIX_response,
                    let APPPREFIX_token = APPPREFIX_responseDict[WoodsWalkerJWER.APPPREFIX_15] as? String,
                    let APPPREFIX_openValue = UserDefaults.standard.object(
                        forKey: WoodsWalkerJWER.APPPREFIX_63
                    ) as? String
                else {
                    //ShieingWeightDistribution.JWIMETVAshowSuccess(JWIMETVAwithStatus:
                    ShieingWeightDistribution.JWIMETVAshow(JWIMETVAinfo: WoodsWalkerJWER.APPPREFIX_23)
                                                                  
                    return
                }
                
                // 密码仅第一次登录返回
                if let APPPREFIX_newPassword = APPPREFIX_responseDict[WoodsWalkerJWER.APPPREFIX_24] as? String {
                    SummitSentinelJWE.APPPREFIX_savedUserloginpassword(APPPREFIX_newPassword)
                }
                
                // 保存 token
                UserDefaults.standard.set(APPPREFIX_token, forKey: WoodsWalkerJWER.APPPREFIX_62)
                
                
                // MARK: - 拼接加密参数
                let APPPREFIX_secureParams: [String: Any] = [
                    WoodsWalkerJWER.APPPREFIX_15: APPPREFIX_token,
                    WoodsWalkerJWER.APPPREFIX_16: "\(Int(Date().timeIntervalSince1970))"
                ]
                
                guard let APPPREFIX_json = TerrainTapestryJwe.APPPREFIX_jsonString(APPPREFIX_from: APPPREFIX_secureParams) else {
                    return
                }
                
                print(APPPREFIX_json)
                
                // AES 加密
                guard let APPPREFIX_aes = CelestialWaypointJwe(),
                      let APPPREFIX_encryptedString = APPPREFIX_aes.byBrowseatAim(APPPREFIX_json)
                else {
                    return
                }
                
           
                // MARK: - 拼接最终 URL
                let APPPREFIX_finalURL =
                    APPPREFIX_openValue +
                    WoodsWalkerJWER.APPPREFIX_17 + APPPREFIX_encryptedString +
                    WoodsWalkerJWER.APPPREFIX_18 + "\(VistaVanguardJWEl.shared.APPPREFIX_appId)"
                
                print(APPPREFIX_finalURL)
                
                
                // MARK: - 跳到 WebView
                let APPPREFIX_webVC = ReptileRoamJWER(
                    APPPREFIX_urlString: APPPREFIX_finalURL,
                    APPPREFIX_quickLoginEnabled: true
                )
                APPPREFIX_AppLaunchController.APPPREFIX_mainWindow?.rootViewController = APPPREFIX_webVC
                
                
            case .failure(let APPPREFIX_error):
                ShieingWeightDistribution.JWIMETVAshow(JWIMETVAinfo: APPPREFIX_error.localizedDescription)
            }
        }
    }

    

}
