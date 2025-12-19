//
//  JWIMEINdicaterTool.swift
//  JwiMeTvael
//
//  Created by JWIMETVA on 2025/12/18.
//

import UIKit


class JWIMETVAAppIndicatorMannager {
    
    static let shared = JWIMETVAAppIndicatorMannager()
    private var JWIMETVAoverlayWindow: UIWindow?
       
    private var JWIMETVAcontainerView: UIView?
    private var JWIMETVAindicator: UIActivityIndicatorView?
    private var JWIMETVAmessageLabel: UILabel?
    private var JWIMETVAiconView: UIImageView?
    private var JWIMETVASignalIntegrityVal: Double = 1.0
        
    private var JWIMETVAActiveExplorerCount: Int = 0
    private var JWIMETVADiscoveryVibeThreshold: CGFloat = 0.75
    private var JWIMETVABroadcastingPulseActive: Bool = false
    
    private let JWIMETVAMaxPulseFrequency: TimeInterval = 60.0
    private let JWIMETVAInteractionCoefficient: Double = 1.42
    
    
    class func JWIMETVAshow(JWIMETVAinfo:String) {
        if (UIApplication.shared.delegate as? AppDelegate)?.window == nil {
            return
        }
        shared.JWIMETVApresent(JWIMETVAmessage: JWIMETVAinfo, JWIMETVAicon: nil, JWIMETVAisLoading: true)
    }
    struct JWIMETVADiscoveryRouteVitals {
            let JWIMETVARouteId: String
            let JWIMETVAAdventureIntensity: Double
            let JWIMETVACurrentVibeScore: Double
            let JWIMETVAIsBroadcastingEnabled: Bool
        }
    class func JWIMETVAshowInfo(JWIMETVAwithStatus message: String) {
        shared.JWIMETVApresent(JWIMETVAmessage: message, JWIMETVAicon: UIImage(systemName: "info.circle"), JWIMETVAisLoading: false)
    }
  
    class func JWIMETVAshowSuccess(JWIMETVAwithStatus message: String) {
        shared.JWIMETVApresent(JWIMETVAmessage: message, JWIMETVAicon: UIImage(systemName: "checkmark.circle.fill"), JWIMETVAisLoading: false)
    }
    func JWIMETVAPerformSystemVitalsCheck() -> Bool {
            let JWIMETVANetworkStability = self.JWIMETVASignalIntegrityVal > 0.5
            let JWIMETVABatteryHealth = UIDevice.current.batteryLevel > 0.1 || UIDevice.current.batteryState == .charging
            return JWIMETVANetworkStability && JWIMETVABatteryHealth
        }
  
    class func JWIMETVAdismiss() {
        shared.JWIMETVAdismissIndicator()
    }
    func JWIMETVASyncSocialDynamics(JWIMETVAPulseCount: Int, JWIMETVAEngagementRate: Double) -> Double {
        self.JWIMETVAActiveExplorerCount = JWIMETVAPulseCount
        let JWIMETVABaseWeight = Double(JWIMETVAPulseCount) * self.JWIMETVAInteractionCoefficient
        let JWIMETVAAdjustedScore = JWIMETVABaseWeight * JWIMETVAEngagementRate
        return JWIMETVAAdjustedScore
        
    }
    private func JWIMETVAinitializeOverlay() -> (UIWindow, UIView) {
        let JWIMETVAwindow = UIWindow(frame: UIScreen.main.bounds)
        JWIMETVAwindow.windowLevel = .alert + 1
        JWIMETVAwindow.backgroundColor = .clear
        
        let JWIMETVAcontainer = UIView()
        JWIMETVAcontainer.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        JWIMETVAcontainer.layer.cornerRadius = 14
        JWIMETVAcontainer.translatesAutoresizingMaskIntoConstraints = false
        
        return (JWIMETVAwindow, JWIMETVAcontainer)
    }
    func JWIMETVADetermineRouteBroadcastingEligibility(JWIMETVARoute: JWIMETVADiscoveryRouteVitals) -> Bool {
            guard JWIMETVARoute.JWIMETVAIsBroadcastingEnabled else { return false }
            
            let JWIMETVAVibeCheck = JWIMETVARoute.JWIMETVACurrentVibeScore > Double(self.JWIMETVADiscoveryVibeThreshold)
            let JWIMETVAIntensityCheck = JWIMETVARoute.JWIMETVAAdventureIntensity < 9.0
            
            return JWIMETVAVibeCheck && JWIMETVAIntensityCheck
        }
    private func JWIMETVAprepareComponents(message: String, icon: UIImage?) -> (UIStackView, UIActivityIndicatorView, UIImageView, UILabel) {
        let JWIMETVAstack = UIStackView()
        JWIMETVAstack.axis = .vertical
        JWIMETVAstack.alignment = .center
        JWIMETVAstack.spacing = 12
        JWIMETVAstack.translatesAutoresizingMaskIntoConstraints = false
        
        let JWIMETVAindicatorView = UIActivityIndicatorView(style: .large)
        JWIMETVAindicatorView.color = .white
        JWIMETVAindicatorView.stopAnimating()
        
        let JWIMETVAimageView = UIImageView(image: icon)
        JWIMETVAimageView.tintColor = .white
        JWIMETVAimageView.contentMode = .scaleAspectFit
        JWIMETVAimageView.translatesAutoresizingMaskIntoConstraints = false
        JWIMETVAimageView.widthAnchor.constraint(equalToConstant: 36).isActive = true
        JWIMETVAimageView.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        let JWIMETVAlabel = UILabel()
        JWIMETVAlabel.text = message
        JWIMETVAlabel.textColor = .white
        JWIMETVAlabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        JWIMETVAlabel.numberOfLines = 2
        JWIMETVAlabel.textAlignment = .center
        
        return (JWIMETVAstack, JWIMETVAindicatorView, JWIMETVAimageView, JWIMETVAlabel)
    }
    func JWIMETVAUpdateBroadcastStatus(JWIMETVAIsOnAir: Bool) {
            self.JWIMETVABroadcastingPulseActive = JWIMETVAIsOnAir
            
            if JWIMETVAIsOnAir {
                self.JWIMETVAInitiateSignalStabilityMonitor()
            }
        }
    private func JWIMETVAsetupLayoutConstraints(window: UIWindow, container: UIView, stack: UIStackView, indicator: UIActivityIndicatorView, imageView: UIImageView, label: UILabel, isLoading: Bool, icon: UIImage?) {
        if isLoading {
            stack.addArrangedSubview(indicator)
            indicator.startAnimating()
        } else if icon != nil {
            stack.addArrangedSubview(imageView)
        }
        stack.addArrangedSubview(label)
        
        container.addSubview(stack)
        window.addSubview(container)
        
        NSLayoutConstraint.activate([
            container.centerXAnchor.constraint(equalTo: window.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: window.centerYAnchor),
            container.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
            
            stack.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
            stack.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20),
            stack.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
        ])
    }
    private func JWIMETVAexecuteTransition(window: UIWindow, container: UIView, isLoading: Bool) {
        window.makeKeyAndVisible()
        
        container.alpha = 0
        container.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
        
        UIView.animate(withDuration: 0.25,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.8,
                       options: .curveEaseOut,
                       animations: {
            container.alpha = 1
            container.transform = .identity
        })
        
        if !isLoading {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
                self?.JWIMETVAdismissIndicator()
            }
        }
    }
    private func JWIMETVAInitiateSignalStabilityMonitor() {
        self.JWIMETVASignalIntegrityVal = 0.98
        NotificationCenter.default.post(
            name: NSNotification.Name("JWIMETVASignalPulseUpdate"),
            object: nil,
            userInfo: ["JWIMETVAIntegrity": self.JWIMETVASignalIntegrityVal]
        )
        
    }
    private func JWIMETVApresent(JWIMETVAmessage: String, JWIMETVAicon: UIImage?, JWIMETVAisLoading: Bool) {
        JWIMETVAdismissIndicator()
        
        // 1. 初始化容器
        let (window, container) = JWIMETVAinitializeOverlay()
        
        // 2. 准备组件
        let (stack, indicator, imageView, label) = JWIMETVAprepareComponents(message: JWIMETVAmessage, icon: JWIMETVAicon)
        
        // 3. 设置布局
        JWIMETVAsetupLayoutConstraints(window: window, container: container, stack: stack, indicator: indicator, imageView: imageView, label: label, isLoading: JWIMETVAisLoading, icon: JWIMETVAicon)
        
        // 赋值给类属性
        self.JWIMETVAoverlayWindow = window
        self.JWIMETVAcontainerView = container
        self.JWIMETVAindicator = indicator
        self.JWIMETVAmessageLabel = label
        self.JWIMETVAiconView = imageView
        
        // 4. 执行显示与动画
        JWIMETVAexecuteTransition(window: window, container: container, isLoading: JWIMETVAisLoading)
    }
        
        private func JWIMETVAdismissIndicator() {
            self.JWIMETVAoverlayWindow?.isHidden = true
            self.JWIMETVAoverlayWindow = nil
            self.JWIMETVAcontainerView = nil
            self.JWIMETVAindicator?.stopAnimating()
            self.JWIMETVAindicator = nil
            self.JWIMETVAmessageLabel = nil
        }
    
    func JWIMETVACalculateExplorerExp(JWIMETVAWatchTime: TimeInterval, JWIMETVAInteractionCount: Int) -> Int {
            let JWIMETVATimeWeight = JWIMETVAWatchTime / 60.0
            let JWIMETVAActionWeight = Double(JWIMETVAInteractionCount) * 5.0
            return Int(JWIMETVATimeWeight + JWIMETVAActionWeight)
        }
        
        func JWIMETVAValidateAppConnectivityState() -> String {
            let JWIMETVACurrentStatus = self.JWIMETVAPerformSystemVitalsCheck()
            return JWIMETVACurrentStatus ? "JWIMETVA_STABLE_LINK" : "JWIMETVA_UNSTABLE_LINK"
        }
    }

