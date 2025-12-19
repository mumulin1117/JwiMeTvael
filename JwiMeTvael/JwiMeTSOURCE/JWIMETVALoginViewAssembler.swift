import UIKit
extension NSAttributedString.Key {
    static let JWIMETVALinkType = NSAttributedString.Key("JWIMETVALinkType")
}

enum JWIMETVALegalType {
    case terms
    case privacy
}

// MARK: - JWIMETVALoginViewAssembler Class
//log
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
        JWIMETVACameraLogo.image = JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMEguidelo")
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
            string: "JWIMETVAEnter secret key".JWIMETVAtime,
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

        let JWIMETVAFullText = "JWIMETVABy continuing you agree to our <Terms of Service> and <Privacy Policy>.".JWIMETVAtime
        let JWIMETVAMutableString = NSMutableAttributedString(string: JWIMETVAFullText)

        let JWIMETVAFullRange = NSRange(location: 0, length: JWIMETVAMutableString.length)
        JWIMETVAMutableString.addAttributes([
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.systemFont(ofSize: 13)
        ], range: JWIMETVAFullRange)

        // Terms of Service
        if let range = JWIMETVAFullText.range(of: "JWIMETVA<Terms of Service>".JWIMETVAtime) {
            let nsRange = NSRange(range, in: JWIMETVAFullText)
            JWIMETVAMutableString.addAttributes([
                .foregroundColor: UIColor.white,
                .underlineStyle: NSUnderlineStyle.single.rawValue,
                .JWIMETVALinkType: JWIMETVALegalType.terms
            ], range: nsRange)
        }

        // Privacy Policy
        if let range = JWIMETVAFullText.range(of: "JWIMETVA<Privacy Policy>".JWIMETVAtime) {
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
        let vc = JWIMETVACreateStreamPilot.init(JWIMErvPathwayRhythm: .JWIMErvWildlandChronicle,JWIMErvNatureDrift:true)
        self.present(vc, animated: true)
    }

    private func JWIMETVAOpenPrivacy() {
        let vc = JWIMETVACreateStreamPilot.init(JWIMErvPathwayRhythm: .JWIMErvAdventureLogbook,JWIMErvNatureDrift:true)
        self.present(vc, animated: true)
    }


    private func JWIMETVAConfigureBaseView() {
        view.backgroundColor = .black
    }
    
    private func JWIMETVAEmbedComponents() {
        self.view.addSubview(jwimeTimingBelt)
        view.addSubview(JWIMETVACameraLogo)
        view.addSubview(JWIMETVATitleText)
        view.addSubview(JWIMETVAInputEmailField)
        view.addSubview(JWIMETVASecretPassField)
        view.addSubview(JWIMETVAInstantConnectButton)
        view.addSubview(JWIMETVAAgreementCheckbox)
        view.addSubview(JWIMETVATermsPolicyDisplay)
    }

    private func JWIMETVAApplyLayouts() {
       
        NotificationCenter.default.addObserver(self, selector: #selector(JWIMErvCabinClimateTune(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
                        
                
        NotificationCenter.default.addObserver(self, selector: #selector(JWIMErvSceneSequencer), name: UIResponder.keyboardWillHideNotification, object: nil)
        NSLayoutConstraint.activate([
            // Logo
            JWIMETVACameraLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            JWIMETVACameraLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 71),
            JWIMETVACameraLogo.widthAnchor.constraint(equalToConstant: 130),
            JWIMETVACameraLogo.heightAnchor.constraint(equalToConstant: 130),

            // Title
            JWIMETVATitleText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            JWIMETVATitleText.topAnchor.constraint(equalTo: JWIMETVACameraLogo.bottomAnchor, constant: 25),
            JWIMETVATitleText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            JWIMETVATitleText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            // Email Field
            JWIMETVAInputEmailField.topAnchor.constraint(equalTo: JWIMETVATitleText.bottomAnchor, constant: 50),
            JWIMETVAInputEmailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            JWIMETVAInputEmailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            JWIMETVAInputEmailField.heightAnchor.constraint(equalToConstant: 56),

            // Password Field
            JWIMETVASecretPassField.topAnchor.constraint(equalTo: JWIMETVAInputEmailField.bottomAnchor, constant: 20),
            JWIMETVASecretPassField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            JWIMETVASecretPassField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            JWIMETVASecretPassField.heightAnchor.constraint(equalToConstant: 56),

            // Login Button
            JWIMETVAInstantConnectButton.topAnchor.constraint(equalTo: JWIMETVASecretPassField.bottomAnchor, constant: 50),
            JWIMETVAInstantConnectButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            JWIMETVAInstantConnectButton.widthAnchor.constraint(equalToConstant: 256),
            JWIMETVAInstantConnectButton.heightAnchor.constraint(equalToConstant: 56),
            
            // Checkbox
            JWIMETVAAgreementCheckbox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: JWIMETVAPaddingUnit),
            JWIMETVAAgreementCheckbox.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            JWIMETVAAgreementCheckbox.widthAnchor.constraint(equalToConstant: 24),
            JWIMETVAAgreementCheckbox.heightAnchor.constraint(equalToConstant: 24),
            
            // Terms and Policy Text
            JWIMETVATermsPolicyDisplay.centerYAnchor.constraint(equalTo: JWIMETVAAgreementCheckbox.centerYAnchor),
            JWIMETVATermsPolicyDisplay.leadingAnchor.constraint(equalTo: JWIMETVAAgreementCheckbox.trailingAnchor, constant: 8),
            JWIMETVATermsPolicyDisplay.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -JWIMETVAPaddingUnit)
        ])
    }
    
    @objc func JWIMErvCabinClimateTune(_ JWIMErvWildfireWatch: Notification) {
        guard let JWIMErvRidgeHikingPath = JWIMErvWildfireWatch.userInfo,
              let JWIMErvWayPointAnchor = JWIMErvRidgeHikingPath[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        let JWIMErvTrackPlanning = JWIMErvWayPointAnchor.height
        
        self.view.frame.origin.y = -JWIMErvTrackPlanning / 2

    }
     
  
    // MARK: - Action Handlers

    @objc private func JWIMETVAInitiateConnect() {
        guard JWIMETVAAgreementCheckbox.isSelected else {
            self.JWIMETVADisplayAlert(message: "JWIMETVAAgreement terms must be accepted.".JWIMETVAtime)
            return
        }
        
        let JWIMETVAEnteredEmail = JWIMETVAInputEmailField.text ?? ""
        let JWIMETVAEnteredPassword = JWIMETVASecretPassField.text ?? ""
        
        if JWIMETVAEnteredEmail.isEmpty || JWIMETVAEnteredPassword.isEmpty {
            self.JWIMETVADisplayAlert(message: "JWIMETVAEmail and secret key cannot be empty.".JWIMETVAtime)
            return
        }
        JWIMETVAAppIndicatorMannager.JWIMETVAshow(JWIMETVAinfo: "JWIMETVALogin....".JWIMETVAtime)
        JWIMErvReadingNook.JWIMErvSoftCloseHinge(JWIMErvDrawerSilentGlide: "/aukohjrmz/kffyyhfok", JWIMErvCargoSafetyLatch: ["JWIMErvCabinMicArray":"72454862","JWIMErvHeadlampFocus":JWIMETVAEnteredEmail,"JWIMErvDashCamAngle":JWIMETVAEnteredPassword]) { JWIMETVAsresult in
            JWIMETVAAppIndicatorMannager.JWIMETVAdismiss()
            if let FMberRECglsss = JWIMETVAsresult as? [String: Any],
                              
                let FMberRECrns = FMberRECglsss["JWIMETVAdata".JWIMETVAtime] as? [String: Any] {
                
                JWIMErvReadingNook.JWIMErvPortableDeskKit = FMberRECrns["JWIMErvSkylightPanel"] as? String
                JWIMErvReadingNook.JWIMErvWorkspaceFolding = FMberRECrns["JWIMErvTirePatchKit"] as? Int
                
                ((UIApplication.shared.delegate) as? AppDelegate)?.window?.rootViewController = JWIMETVATabBarAssembler()
                
                JWIMETVAAppIndicatorMannager.JWIMETVAshowSuccess(JWIMETVAwithStatus: "JWIMETVAlog in successful!".JWIMETVAtime)
            } else {
                JWIMETVAAppIndicatorMannager.JWIMETVAshowInfo(JWIMETVAwithStatus: "JWIMETVAlog in Failed!".JWIMETVAtime)
                
            }
            
            
           
           
            
            
        } JWIMErvHighAltitudeTune: { JWIMETVAerrorot in
            JWIMETVAAppIndicatorMannager.JWIMETVAdismiss()
            JWIMETVAAppIndicatorMannager.JWIMETVAshowInfo(JWIMETVAwithStatus: JWIMETVAerrorot.localizedDescription)
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
        let JWIMETVAAlertController = UIAlertController(title: "Notice", message: message, preferredStyle: .alert)
        JWIMETVAAlertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(JWIMETVAAlertController, animated: true)
    }
}
