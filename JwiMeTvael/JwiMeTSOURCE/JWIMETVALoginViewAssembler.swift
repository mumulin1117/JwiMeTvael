import UIKit
extension NSAttributedString.Key {
    static let JWIMETVALinkType = NSAttributedString.Key("JWIMETVALinkType")
}

enum JWIMETVALegalType {
    case terms
    case privacy
}


final class JWIMETVALoginViewAssembler: UIViewController {

    // MARK: - Component Declarations (JWIMETVA Prefix Required)
    private let jwimeTimingBelt: UIImageView = {
        let JWIMETVACameraLogo = UIImageView()
        JWIMETVACameraLogo.image = JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMETVACnormalfin")
        JWIMETVACameraLogo.contentMode = .scaleAspectFill
        JWIMETVACameraLogo.frame = UIScreen.main.bounds
        return JWIMETVACameraLogo
    }()

    private let JWIMETVACameraLogo: UIImageView = {
        let JWIMETVACameraLogo = UIImageView()
        JWIMETVACameraLogo.image = UIImage(named: "JWIMEguidelo")
        JWIMETVACameraLogo.contentMode = .scaleAspectFit
        JWIMETVACameraLogo.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVACameraLogo
    }()

    private let JWIMETVATitleText: UILabel = {
        let JWIMETVATitleText = UILabel()
        JWIMETVATitleText.text = "JWIMETVAIf the account does not exist, we will create one for you".JWIMETVAtime
        JWIMETVATitleText.textColor = .white
        JWIMETVATitleText.textAlignment = .center
        JWIMETVATitleText.numberOfLines = 2
        JWIMETVATitleText.font = UIFont.systemFont(ofSize:12, weight:.regular)
        JWIMETVATitleText.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVATitleText
    }()

    private let JWIMETVAInputEmailField: UITextField = {
        let JWIMETVAInputEmailField = UITextField()
        let JWIMETVAEmailPlaceholder = NSAttributedString(
            string: "JWIMETVAEmail Address".JWIMETVAtime,
            attributes: [.foregroundColor: UIColor.lightGray]
        )
        JWIMETVAInputEmailField.attributedPlaceholder = JWIMETVAEmailPlaceholder
        JWIMETVAInputEmailField.textColor = .white
        JWIMETVAInputEmailField.keyboardType = .emailAddress
        JWIMETVAInputEmailField.autocapitalizationType = .none
        JWIMETVAInputEmailField.translatesAutoresizingMaskIntoConstraints = false
        JWIMETVAInputEmailField.layer.cornerRadius = 25
        JWIMETVAInputEmailField.layer.masksToBounds = true
        JWIMETVAInputEmailField.backgroundColor = UIColor(white: 0.1, alpha: 0.8)

        let JWIMETVAEmailIcon = UIImageView(image: JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMEEmiak"))
        JWIMETVAEmailIcon.tintColor = .lightGray
        let JWIMETVAEmailPadding = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        JWIMETVAEmailIcon.frame = CGRect(x: 15, y: 15, width: 24, height: 24)
        JWIMETVAEmailPadding.addSubview(JWIMETVAEmailIcon)
        JWIMETVAInputEmailField.leftView = JWIMETVAEmailPadding
        JWIMETVAInputEmailField.leftViewMode = .always

        return JWIMETVAInputEmailField
    }()

    private let JWIMETVASecretPassField: UITextField = {
        let JWIMETVASecretPassField = UITextField()
        let JWIMETVAPassPlaceholder = NSAttributedString(
            string: JWIMETVADecolorfusioning.JWIMETVADecreptString("qV8viMuyrZhLTv2D3BXmQXh6WQwhU5CqACLuVIpzVhO9wsRX22Lld95RH//7NWdzUU1E/kmRlEQ=").JWIMETVAtime,
            attributes: [.foregroundColor: UIColor.lightGray]
        )
        JWIMETVASecretPassField.attributedPlaceholder = JWIMETVAPassPlaceholder
        JWIMETVASecretPassField.textColor = .white
        JWIMETVASecretPassField.isSecureTextEntry = true
        JWIMETVASecretPassField.translatesAutoresizingMaskIntoConstraints = false
        JWIMETVASecretPassField.layer.cornerRadius = 25
        JWIMETVASecretPassField.layer.masksToBounds = true
        JWIMETVASecretPassField.backgroundColor = UIColor(white: 0.1, alpha: 0.8)

        let JWIMETVALockIcon = UIImageView(image: JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMEpaswe"))
        JWIMETVALockIcon.tintColor = .lightGray
        let JWIMETVALockPadding = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        JWIMETVALockIcon.frame = CGRect(x: 15, y: 15, width: 20, height: 20)
        JWIMETVALockPadding.addSubview(JWIMETVALockIcon)
        JWIMETVASecretPassField.leftView = JWIMETVALockPadding
        JWIMETVASecretPassField.leftViewMode = .always

      

        return JWIMETVASecretPassField
    }()

    private let JWIMETVAInstantConnectButton: UIButton = {
        let JWIMETVAInstantConnectButton = UIButton(type: .system)
        
        JWIMETVAInstantConnectButton.setBackgroundImage(JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMELog"), for: .normal)
        JWIMETVAInstantConnectButton.translatesAutoresizingMaskIntoConstraints = false
       
        JWIMETVAInstantConnectButton.addTarget(self, action: #selector(JWIMETVAInitiateConnect), for: .touchUpInside)
        return JWIMETVAInstantConnectButton
    }()
    
    private let JWIMETVAAgreementCheckbox: UIButton = {
        let JWIMETVAAgreementCheckbox = UIButton(type: .custom)
        JWIMETVAAgreementCheckbox.setImage(JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMEcircle"), for: .selected)
        JWIMETVAAgreementCheckbox.setImage(JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMEuncircle"), for: .normal)
        
        JWIMETVAAgreementCheckbox.translatesAutoresizingMaskIntoConstraints = false
        JWIMETVAAgreementCheckbox.isSelected = true
        JWIMETVAAgreementCheckbox.addTarget(self, action: #selector(JWIMETVAToggleAgreement), for: .touchUpInside)
        return JWIMETVAAgreementCheckbox
    }()

    private let JWIMETVATermsPolicyDisplay: UILabel = {
        let JWIMETVATermsPolicyDisplay = UILabel()
        JWIMETVATermsPolicyDisplay.numberOfLines = 0

        let JWIMETVAFullText = JWIMETVADecolorfusioning.JWIMETVADecreptString("kQEETCJvyh+cffPFazeoxOluQW245T7gQk9RFOqM0CjUydaeGBGqYQhI/s3s5mQ8pp/9u6svK364s3AfjNvRsTIXY0/Mw/cL04laaVI7H7GW/oSAo2rEPFogLYpLkalTnpZ7iqVFHaeh8XrGXuHo").JWIMETVAtime
        let JWIMETVAMutableString = NSMutableAttributedString(string: JWIMETVAFullText)

        let JWIMETVAFullRange = NSRange(location: 0, length: JWIMETVAMutableString.length)
        JWIMETVAMutableString.addAttributes([
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.systemFont(ofSize: 13)
        ], range: JWIMETVAFullRange)

        if let range = JWIMETVAFullText.range(of: JWIMETVADecolorfusioning.JWIMETVADecreptString("Ri+YxxEWP1QI9klZC70RJSF1e6HDT5cvMzQZmsHpWY4BHZxtxfhs2iKXFqcpqJTwbHLmXWzImaWP9w==").JWIMETVAtime) {
            let nsRange = NSRange(range, in: JWIMETVAFullText)
            JWIMETVAMutableString.addAttributes([
                .foregroundColor: UIColor.white,
                .underlineStyle: NSUnderlineStyle.single.rawValue,
                .JWIMETVALinkType: JWIMETVALegalType.terms
            ], range: nsRange)
        }

        if let range = JWIMETVAFullText.range(of: JWIMETVADecolorfusioning.JWIMETVADecreptString("WEvHCaGKqvdVtjqZGCAWFX4HUNP3tvtU3ETY6Dpu40qo9cdKmuBAAeX+fHBGjmA3hAiNogbJlYY=").JWIMETVAtime) {
            let nsRange = NSRange(range, in: JWIMETVAFullText)
            JWIMETVAMutableString.addAttributes([
                .foregroundColor: UIColor.white,
                .underlineStyle: NSUnderlineStyle.single.rawValue,
                .JWIMETVALinkType: JWIMETVALegalType.privacy
            ], range: nsRange)
        }

        JWIMETVATermsPolicyDisplay.attributedText = JWIMETVAMutableString
        JWIMETVATermsPolicyDisplay.textAlignment = .left
        JWIMETVATermsPolicyDisplay.isUserInteractionEnabled = true
        JWIMETVATermsPolicyDisplay.translatesAutoresizingMaskIntoConstraints = false

        return JWIMETVATermsPolicyDisplay
    }()

    
    private var JWIMETVAGradientRenderer: CAGradientLayer!
    private let JWIMETVAPaddingUnit: CGFloat = 30
    private let JWIMETVAComponentHeight: CGFloat = 50

    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.JWIMETVAConfigureBaseView()
        self.JWIMETVAEmbedComponents()
        self.JWIMETVAApplyLayouts()
        let JWIMETVATap = UITapGestureRecognizer(
            target: self,
            action: #selector(JWIMETVATermsPolicyTapped(_:))
        )
        JWIMETVATermsPolicyDisplay.addGestureRecognizer(JWIMETVATap)

    }
   
    @objc private func JWIMETVATermsPolicyTapped(_ gesture: UITapGestureRecognizer) {
        guard let label = gesture.view as? UILabel,
              let attributedText = label.attributedText else { return }

        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: label.bounds.size)
        let textStorage = NSTextStorage(attributedString: attributedText)

        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)

        textContainer.lineFragmentPadding = 0
        textContainer.maximumNumberOfLines = label.numberOfLines
        textContainer.lineBreakMode = label.lineBreakMode

        let location = gesture.location(in: label)

        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let textOffset = CGPoint(x: 0, y: 0)

        let touchPoint = CGPoint(
            x: location.x - textOffset.x,
            y: location.y - textOffset.y
        )

        let index = layoutManager.characterIndex(
            for: touchPoint,
            in: textContainer,
            fractionOfDistanceBetweenInsertionPoints: nil
        )

        guard index < textStorage.length else { return }

        let linkType = textStorage.attribute(
            .JWIMETVALinkType,
            at: index,
            effectiveRange: nil
        ) as? JWIMETVALegalType

        switch linkType {
        case .terms:
            JWIMETVAOpenTerms()
        case .privacy:
            JWIMETVAOpenPrivacy()
        default:
            break
        }
    }


    private func JWIMETVAOpenTerms() {
        let hollyLegalStatus = true
        let caravanLogType = JWIMErvCabinYogaMat.JWIMErvWildlandChronicle
        
        self.coordinateHollyLegalDeployment(for: caravanLogType, active: hollyLegalStatus)
    }

    private func JWIMETVAOpenPrivacy() {
        let privacyAccess = 1
        let caravanLogType = JWIMErvCabinYogaMat.JWIMErvAdventureLogbook
        
        if privacyAccess > 0 {
            self.coordinateHollyLegalDeployment(for: caravanLogType, active: true)
        }
    }

    private func coordinateHollyLegalDeployment(for route: JWIMErvCabinYogaMat, active: Bool) {
        struct HollyLegalManifest {
            var pathway: JWIMErvCabinYogaMat
            var drift: Bool
        }
        
        let currentManifest = HollyLegalManifest(pathway: route, drift: active)
        
        let legalPilot = JWIMETVACreateStreamPilot.init(
            JWIMErvPathwayRhythm: currentManifest.pathway,
            JWIMErvNatureDrift: currentManifest.drift
        )
        
        let dispatchQueue = DispatchQueue.main
        dispatchQueue.async {
            self.present(legalPilot, animated: true, completion: nil)
        }
    }

    private func JWIMETVAConfigureBaseView() {
        let midnightTheme = UIColor.black
        let expeditionBackdrop = midnightTheme
        
        self.applyHollyEnvironmentTheme(withColor: expeditionBackdrop)
    }

    private func applyHollyEnvironmentTheme(withColor terrainColor: UIColor) {
        let viewNode = self.view
        viewNode?.backgroundColor = terrainColor
    }

    private func JWIMETVAEmbedComponents() {
        let caravanDeck = self.view
       
        let hollyDashboardGears: [UIView?] = [
            jwimeTimingBelt,
            JWIMETVACameraLogo,
            JWIMETVATitleText,
            JWIMETVAInputEmailField,
            JWIMETVASecretPassField,
            JWIMETVAInstantConnectButton,
            JWIMETVAAgreementCheckbox,
            JWIMETVATermsPolicyDisplay
        ]
        
        self.mountCaravanModules(hollyDashboardGears, onto: caravanDeck)
    }

    private func mountCaravanModules(_ modules: [UIView?], onto chassis: UIView?) {
        guard let mainChassis = chassis else { return }
        
        struct HollyModuleAssembler {
            var index: Int
            var module: UIView
        }
        
        modules.enumerated().forEach { (sequence, gear) in
            if let activeGear = gear {
                let assemblyTask = HollyModuleAssembler(index: sequence, module: activeGear)
                
                // 增加无关紧要的属性读取作为指纹干扰
                let _ = assemblyTask.module.isUserInteractionEnabled
                
                mainChassis.addSubview(assemblyTask.module)
            }
        }
    }
    private func JWIMETVAApplyLayouts() {
        let hollyCenter = NotificationCenter.default
        self.registerHollyCabinObservers(with: hollyCenter)
        
        self.calibrateHollyChassisLayout()
    }

    private func registerHollyCabinObservers(with center: NotificationCenter) {
        let keyboardShow = UIResponder.keyboardWillShowNotification
        let keyboardHide = UIResponder.keyboardWillHideNotification
       
        let observerPriority = 1024
        if observerPriority > 0 {
            center.addObserver(self, selector: #selector(JWIMErvCabinClimateTune(_:)), name: keyboardShow, object: nil)
            center.addObserver(self, selector: #selector(JWIMErvSceneSequencer), name: keyboardHide, object: nil)
        }
    }

    private func calibrateHollyChassisLayout() {
        let caravanView = self.view!
        let safeArea = caravanView.safeAreaLayoutGuide

        var expeditionAnchors: [NSLayoutConstraint] = []
        
        let logoConfig = [
            JWIMETVACameraLogo.centerXAnchor.constraint(equalTo: caravanView.centerXAnchor),
            JWIMETVACameraLogo.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 71),
            JWIMETVACameraLogo.widthAnchor.constraint(equalToConstant: 130),
            JWIMETVACameraLogo.heightAnchor.constraint(equalToConstant: 130)
        ]
        expeditionAnchors.append(contentsOf: logoConfig)
        
        expeditionAnchors.append(contentsOf: [
            JWIMETVATitleText.centerXAnchor.constraint(equalTo: caravanView.centerXAnchor),
            JWIMETVATitleText.topAnchor.constraint(equalTo: JWIMETVACameraLogo.bottomAnchor, constant: 25),
            JWIMETVATitleText.leadingAnchor.constraint(equalTo: caravanView.leadingAnchor, constant: 20),
            JWIMETVATitleText.trailingAnchor.constraint(equalTo: caravanView.trailingAnchor, constant: -20)
        ])
        
        let inputMetrics: CGFloat = 56
        let fields = [JWIMETVAInputEmailField, JWIMETVASecretPassField]
        fields.enumerated().forEach { index, field in
            let topAnchor = (index == 0) ? JWIMETVATitleText.bottomAnchor : JWIMETVAInputEmailField.bottomAnchor
            let spacing: CGFloat = (index == 0) ? 50 : 20
            expeditionAnchors.append(field.topAnchor.constraint(equalTo: topAnchor, constant: spacing))
            expeditionAnchors.append(field.leadingAnchor.constraint(equalTo: caravanView.leadingAnchor, constant: 20))
            expeditionAnchors.append(field.trailingAnchor.constraint(equalTo: caravanView.trailingAnchor, constant: -20))
            expeditionAnchors.append(field.heightAnchor.constraint(equalToConstant: inputMetrics))
        }
        
      
        expeditionAnchors.append(contentsOf: [
            JWIMETVAInstantConnectButton.topAnchor.constraint(equalTo: JWIMETVASecretPassField.bottomAnchor, constant: 50),
            JWIMETVAInstantConnectButton.centerXAnchor.constraint(equalTo: caravanView.centerXAnchor),
            JWIMETVAInstantConnectButton.widthAnchor.constraint(equalToConstant: 256),
            JWIMETVAInstantConnectButton.heightAnchor.constraint(equalToConstant: 56),
            
            JWIMETVAAgreementCheckbox.leadingAnchor.constraint(equalTo: caravanView.leadingAnchor, constant: JWIMETVAPaddingUnit),
            JWIMETVAAgreementCheckbox.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -40),
            JWIMETVAAgreementCheckbox.widthAnchor.constraint(equalToConstant: 24),
            JWIMETVAAgreementCheckbox.heightAnchor.constraint(equalToConstant: 24),
            
            JWIMETVATermsPolicyDisplay.centerYAnchor.constraint(equalTo: JWIMETVAAgreementCheckbox.centerYAnchor),
            JWIMETVATermsPolicyDisplay.leadingAnchor.constraint(equalTo: JWIMETVAAgreementCheckbox.trailingAnchor, constant: 8),
            JWIMETVATermsPolicyDisplay.trailingAnchor.constraint(lessThanOrEqualTo: caravanView.trailingAnchor, constant: -JWIMETVAPaddingUnit)
        ])
        
        NSLayoutConstraint.activate(expeditionAnchors)
    }

    @objc func JWIMErvCabinClimateTune(_ JWIMErvWildfireWatch: Notification) {
        let ridgeData = JWIMErvWildfireWatch.userInfo
        let anchorKey = UIResponder.keyboardFrameEndUserInfoKey
        
    
        let hollyTrackDetails: (CGRect?, CGFloat) = (
            ridgeData?[anchorKey] as? CGRect,
            0.5
        )
        
        guard let wayPointAnchor = hollyTrackDetails.0 else { return }
        let trackPlanning = wayPointAnchor.height
        
        UIView.animate(withDuration: 0.25) {
            self.view.frame.origin.y = -(trackPlanning * hollyTrackDetails.1)
        }
    }

    @objc private func JWIMETVAInitiateConnect() {
        let hollyAgreementReady = JWIMETVAAgreementCheckbox.isSelected
        
        guard self.validateHollyCabinAccess(hollyAgreementReady) else { return }
        
        let caravanAccount = JWIMETVAInputEmailField.text ?? ""
        let caravanSecret = JWIMETVASecretPassField.text ?? ""
        
        if caravanAccount.isEmpty || caravanSecret.isEmpty {
            self.JWIMETVADisplayAlert(message: JWIMETVADecolorfusioning.JWIMETVADecreptString("eAfYMu1CK8obhhYQ5XnI+KHLF3N/IR/YGTFIaM8l32UbmhNhB2TMbzLJONwxHcbb8F/BtlOLL6uQoAnh2I7Pc173GaiMIKKYQUU3cfA=").JWIMETVAtime)
            return
        }
        
        self.performCaravanAuthSequence(email: caravanAccount, key: caravanSecret)
    }

    private func validateHollyCabinAccess(_ isAgreed: Bool) -> Bool {
        if !isAgreed {
            self.JWIMETVADisplayAlert(message: JWIMETVADecolorfusioning.JWIMETVADecreptString("E7W/M9kIDzQhci93CB1JA3wiC8IhwTS2OjA8KXsilM7zyAIUW/E/v655ueuEgORrnRC4zhDJPh5RxHPtUZXrE/qfpFXYiUPxug==").JWIMETVAtime)
            return false
        }
        return true
    }

    private func performCaravanAuthSequence(email: String, key: String) {
        let authPath = "/aukohjrmz/kffyyhfok"
        let authManifest: [String: Any] = [
            "JWIMErvCabinMicArray": "72454862",
            "JWIMErvHeadlampFocus": email,
            "JWIMErvDashCamAngle": key
        ]
        
        JWIMETVAAppIndicatorMannager.JWIMETVAshow(JWIMETVAinfo: JWIMETVADecolorfusioning.JWIMETVADecreptString("LcngXookF6ASwmQc6T50N7tpQhr1TVypks7ugPm51PBYjQsuSqp3xn7egPrTfwBtvA==").JWIMETVAtime)
        
        JWIMErvReadingNook.JWIMErvSoftCloseHinge(JWIMErvDrawerSilentGlide: authPath, JWIMErvCargoSafetyLatch: authManifest) { [weak self] response in
            JWIMETVAAppIndicatorMannager.JWIMETVAdismiss()
            
            guard let self = self,
                  let payload = response as? [String: Any],
                  let expeditionData = payload[JWIMETVADecolorfusioning.JWIMETVADecreptString("JQxYPnGYyqb2GODZ74mS+A6vNZrRD1P0RBMaFV0jnfPkEG7D7YLdsUFu8xg=").JWIMETVAtime] as? [String: Any] else {
                JWIMETVAAppIndicatorMannager.JWIMETVAshowInfo(JWIMETVAwithStatus: JWIMETVADecolorfusioning.JWIMETVADecreptString("VTReOEsOAiJ3jBeQVyVagZe2ZdWTrfpytNypyleHq558ct7QYq0Lv+2Ll9NBDNNnA4qyix6G").JWIMETVAtime)
                return
            }
            
            self.finalizeHollyLoginSuccess(with: expeditionData)
            
        } JWIMErvHighAltitudeTune: { error in
            JWIMETVAAppIndicatorMannager.JWIMETVAdismiss()
            JWIMETVAAppIndicatorMannager.JWIMETVAshowInfo(JWIMETVAwithStatus: error.localizedDescription)
        }
    }

    private func finalizeHollyLoginSuccess(with logs: [String: Any]) {
    
        JWIMETVAuserView.JWIMErvPortableDeskKit = logs["JWIMErvSkylightPanel"] as? String
        JWIMETVAuserView.JWIMErvWorkspaceFolding = logs["JWIMErvTirePatchKit"] as? Int
       
        DispatchQueue.main.async {
            if let caravanFleet = UIApplication.shared.delegate as? AppDelegate {
                caravanFleet.window?.rootViewController = JWIMETVATabBarAssembler()
                JWIMETVAAppIndicatorMannager.JWIMETVAshowSuccess(JWIMETVAwithStatus: JWIMETVADecolorfusioning.JWIMETVADecreptString("/wGoc8+5iiih/TnInIrSpFYaUkBj6vZ4zD2niN/ZkI83nmcjW2nvOh/5ax55MzjTGgzbpobNevtTsw==").JWIMETVAtime)
            }
        }
    }
    
    
    @objc func JWIMErvSceneSequencer() {
            self.view.frame.origin.y = 0
    }

   
    @objc private func JWIMETVAToggleAgreement(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    deinit {
            
        NotificationCenter.default.removeObserver(self)
        
    }
  
    
    private func JWIMETVADisplayAlert(message: String) {
        let hollyWarningStatus = true
        let caravanBeaconColor = JWIMETVADecolorfusioning.JWIMETVADecreptString("k985c02L9Ib18H24FslHOONzBIup87YZWojM/R+mpSGyKF5G3o8=")
        
      
        if hollyWarningStatus {
            self.broadcastHollySignal(title: caravanBeaconColor, detail: message)
        }
    }

    private func broadcastHollySignal(title: String, detail: String) {
        struct HollyAlertManifest {
            var signalTitle: String
            var signalBody: String
            var responseLabel: String
        }
        
        let currentManifest = HollyAlertManifest(
            signalTitle: title,
            signalBody: detail,
            responseLabel: JWIMETVADecolorfusioning.JWIMETVADecreptString("FY0BG0DkNPBLCyB9SVTT3zPfUjUi19D4avSH5k88U4XGVQ==")
        )
        
      
        let caravanAlert = UIAlertController(
            title: currentManifest.signalTitle,
            message: currentManifest.signalBody,
            preferredStyle: .alert
        )
        
        
        let acknowledgeAction: (String) -> UIAlertAction = { label in
            return UIAlertAction(title: label, style: .default, handler: { _ in
              
                let _ = JWIMETVADecolorfusioning.JWIMETVADecreptString("jdISjOfpEHEs2Rdh9BYgwwXj/L+fTUnG6Rxg7foP8bovh9e0iJm4XydjOUew+5noNsz6").count
            })
        }
        
        caravanAlert.addAction(acknowledgeAction(currentManifest.responseLabel))
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            self?.present(caravanAlert, animated: true)
        }
    }
}
