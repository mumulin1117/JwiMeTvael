import AuthenticationServices
import AVFoundation
import PhotosUI
import UIKit
//login
final class BatteryLoginBankAssembler: UIViewController {
    static let BatteryRV: [(String, String, String)] = [
        ("RVtravelt0", "Coastal RV Drive", "Characteristics: Scenic coastal RV routes offer ocean views, fresh air, and relaxing drives. Traveling along the coast allows flexible stops and immersive nature experiences. Suitable scenarios: Weekend getaways, sunset drives, and slow travel exploration. Related emotions: Sense of freedom, relaxation, and connection with nature."),
        ("RVtravelt1", "Campground Living", "Characteristics: RV campgrounds provide essential facilities like water, electricity, and waste disposal. They also create opportunities to meet fellow travelers and share experiences. Suitable scenarios: Overnight stays, social gatherings, and long-distance travel breaks. Related emotions: Comfort, community feeling, and security during travel."),
        ("RVtravelt2", "Vanlife Essentials", "Characteristics: RV travel requires careful planning of essentials such as water storage, power supply, and compact cooking setups. Efficient space usage is key to a smooth journey. Suitable scenarios: Long road trips, off-grid adventures, and minimalist travel lifestyles. Related emotions: Independence, adventure, and self-sufficiency."),
        ("RVtravelt4", "Starry Night Solitude", "High-altitude or remote locations far from light pollution, offering 360-degree views of the Milky Way. It involves turning off non-essential electronics to embrace the profound silence of the cosmos.Deep meditation, astronomical photography, and off-grid mental resets after high-intensity work.Cosmic awe, profound inner peace, and a sense of existential clarity.")
    ]

    private enum HollyStep {
        case welcome
        case login
        case register
        case verify
    }

    private enum HollyCameraPurpose {
        case avatar
        case verification
    }

    private struct HollyRegistrationDraft {
        var nickname: String = ""
        var email: String = ""
        var password: String = ""
    }

    private var hollyCurrentStep: HollyStep = .welcome
    private var hollyDraft = HollyRegistrationDraft()
    private var hollyAgreementAccepted = true
    private var hollyPendingRegisterSubmission = false
    private var hollyCurrentAuthEmail: String?
    private var hollyCurrentAuthSecret: String?
    private var hollyCurrentAuthNickname: String?
    private var hollyCurrentCameraPurpose: HollyCameraPurpose?
    private var hollySelectedAvatar: UIImage?
    private var hollySelectedPassport: UIImage?

    private let hollyHeroImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Preservationsoei"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let hollyBackdropView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.42)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let hollyContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var hollyBackButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.backgroundColor = UIColor.white.withAlphaComponent(0.08)
        button.layer.cornerRadius = 18
        button.addTarget(self, action: #selector(JWIMETVAHandleBackTap), for: .touchUpInside)
        return button
    }()

    private let hollyWelcomePanel: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let hollyLoginPanel: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let hollyRegisterPanel: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let hollyVerifyPanel: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let hollyWelcomeLogoView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "JWIMEguidelo"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var hollyWelcomeEmailButton: HollyGradientButton = {
        let button = HollyGradientButton(title: "Login with Email")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(JWIMETVAOpenEmailLogin), for: .touchUpInside)
        return button
    }()

    private lazy var hollyWelcomeAppleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.tintColor = .white
//        button.backgroundColor = UIColor(red: 0.35, green: 0.03, blue: 0.53, alpha: 1)
        button.setImage(UIImage(named: "aploooiholly"), for: .normal)
//        button.layer.cornerRadius = 28
        button.addTarget(self, action: #selector(JWIMETVAInitiateAppleConnect), for: .touchUpInside)
        return button
    }()

    private let hollyLoginLogoView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "JWIMEguidelo"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let hollyLoginEmailInput = HollyInputField(iconName: "envelope", placeholder: "Email Address", secure: false)
    private let hollyLoginPasswordInput = HollyInputField(iconName: "lock", placeholder: "Enter password", secure: true)

    private lazy var hollyQuickLoginButton: HollyGradientButton = {
        let button = HollyGradientButton(title: "Quick login")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(JWIMETVAHandleQuickLogin), for: .touchUpInside)
        return button
    }()

    private lazy var hollyRegisterAccountButton: HollyOutlineButton = {
        let button = HollyOutlineButton(title: "Register an account")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(JWIMETVAOpenRegister), for: .touchUpInside)
        return button
    }()

    private let hollyRegisterTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Create a new\naccount"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 31, weight: .heavy)
        return label
    }()

    private lazy var hollyAvatarButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 48
        button.backgroundColor = UIColor(red: 0.15, green: 0.15, blue: 0.18, alpha: 1)
        button.setImage(UIImage(named: "Preservationtaking"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.addTarget(self, action: #selector(JWIMETVAOpenMediaSheetForAvatar), for: .touchUpInside)
        return button
    }()

    private let hollyAvatarCameraBadge: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "camera.fill"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .white
        imageView.backgroundColor = UIColor.black.withAlphaComponent(0.55)
        imageView.layer.cornerRadius = 18
        imageView.layer.masksToBounds = true
        imageView.contentMode = .center
        return imageView
    }()

    private let hollyRegisterNicknameInput = HollyInputField(iconName: "person", placeholder: "Enter nickname", secure: false)
    private let hollyRegisterEmailInput = HollyInputField(iconName: "envelope", placeholder: "Email Address", secure: false)
    private let hollyRegisterPasswordInput = HollyInputField(iconName: "lock", placeholder: "Enter password", secure: true)

    private lazy var hollyRegisterButton: HollyGradientButton = {
        let button = HollyGradientButton(title: "Register")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(JWIMETVAHandleRegister), for: .touchUpInside)
        return button
    }()

    private let hollyVerifyTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Verify Your\nIdentity"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
        return label
    }()

    private let hollyVerifySubtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Take a clear selfie so we can verify your age and help keep the community safe."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor.white.withAlphaComponent(0.6)
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        return label
    }()

    private let hollyVerifyScanRing: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white.withAlphaComponent(0.08)
        view.layer.borderColor = UIColor.white.withAlphaComponent(0.15).cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 88
        return view
    }()

    private let hollyVerifyScanIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "viewfinder"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let hollyVerifyNoteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "By proceeding, you consent to the processing of your selfie for age verification purposes. Your photo will not be shared with third parties."
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = UIColor.white.withAlphaComponent(0.6)
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        return label
    }()

    private lazy var hollyShootingButton: HollyGradientButton = {
        let button = HollyGradientButton(title: "Shooting")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(JWIMETVAHandleShooting), for: .touchUpInside)
        return button
    }()

    private let hollyAgreementContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var hollyAgreementToggle: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 9
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.withAlphaComponent(0.28).cgColor
        button.addTarget(self, action: #selector(JWIMETVAToggleAgreement), for: .touchUpInside)
        return button
    }()

    private let hollyAgreementTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "By continuing you agree to our"
        label.textColor = UIColor.white.withAlphaComponent(0.7)
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        return label
    }()

    private lazy var hollyTermsButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 11, weight: .medium)
        button.setAttributedTitle(NSAttributedString(string: "Terms of Service", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue]), for: .normal)
        button.addTarget(self, action: #selector(JWIMETVAOpenTerms), for: .touchUpInside)
        return button
    }()

    private lazy var hollyPrivacyButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 11, weight: .medium)
        button.setAttributedTitle(NSAttributedString(string: "Privacy Policy", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue]), for: .normal)
        button.addTarget(self, action: #selector(JWIMETVAOpenPrivacy), for: .touchUpInside)
        return button
    }()

    private let hollySheetOverlay: UIControl = {
        let control = UIControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.backgroundColor = UIColor.black.withAlphaComponent(0.45)
        control.alpha = 0
        control.isHidden = true
        return control
    }()

    private let hollySheetCard: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.08, green: 0.04, blue: 0.15, alpha: 1)
        view.layer.cornerRadius = 28
        view.isHidden = true
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()

    private lazy var hollySheetPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Photo", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        button.addTarget(self, action: #selector(JWIMETVASelectPhotoMode), for: .touchUpInside)
        return button
    }()

    private lazy var hollySheetAlbumButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Album", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        button.addTarget(self, action: #selector(JWIMETVASelectAlbumMode), for: .touchUpInside)
        return button
    }()

    private lazy var hollySheetCancelButton: HollyGradientButton = {
        let button = HollyGradientButton(title: "Cancel")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(JWIMETVADismissMediaSheet), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.JWIMETVAConfigureBaseView()
        self.JWIMETVAEmbedComponents()
        self.JWIMETVAApplyLayouts()
        self.JWIMETVAApplyPersistedHollyAccess()
        self.JWIMETVARefreshAgreementState()
        self.JWIMETVAShowStep(.welcome, animated: false)
        NotificationCenter.default.addObserver(self, selector: #selector(JWIMErvCabinClimateTune(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(JWIMErvSceneSequencer), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    private func JWIMETVAConfigureBaseView() {
        self.view.backgroundColor = .black
    }

    private func JWIMETVAEmbedComponents() {
        self.view.addSubview(hollyHeroImageView)
        self.view.addSubview(hollyBackdropView)
        self.view.addSubview(hollyContentView)
        self.view.addSubview(hollyAgreementContainer)
        self.view.addSubview(hollySheetOverlay)
        self.view.addSubview(hollySheetCard)

        [hollyWelcomePanel, hollyLoginPanel, hollyRegisterPanel, hollyVerifyPanel, hollyBackButton].forEach { hollyContentView.addSubview($0) }

        self.JWIMETVABuildWelcomePanel()
        self.JWIMETVABuildLoginPanel()
        self.JWIMETVABuildRegisterPanel()
        self.JWIMETVABuildVerifyPanel()
        self.JWIMETVABuildAgreementFooter()
        self.JWIMETVABuildMediaSheet()
    }

    private func JWIMETVABuildWelcomePanel() {
        hollyWelcomePanel.addSubview(hollyWelcomeLogoView)
        hollyWelcomePanel.addSubview(hollyWelcomeEmailButton)
        hollyWelcomePanel.addSubview(hollyWelcomeAppleButton)
    }

    private func JWIMETVABuildLoginPanel() {
        let stack = UIStackView(arrangedSubviews: [hollyLoginLogoView, hollyLoginEmailInput, hollyLoginPasswordInput, hollyQuickLoginButton, hollyRegisterAccountButton])
        stack.axis = .vertical
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        hollyLoginPanel.addSubview(stack)

        NSLayoutConstraint.activate([
            hollyLoginLogoView.heightAnchor.constraint(equalToConstant: 150),
            hollyQuickLoginButton.heightAnchor.constraint(equalToConstant: 56),
            hollyRegisterAccountButton.heightAnchor.constraint(equalToConstant: 56),
            stack.topAnchor.constraint(equalTo: hollyLoginPanel.topAnchor, constant: 58),
            stack.leadingAnchor.constraint(equalTo: hollyLoginPanel.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: hollyLoginPanel.trailingAnchor)
        ])
    }

    private func JWIMETVABuildRegisterPanel() {
        hollyRegisterPanel.addSubview(hollyRegisterTitleLabel)
        hollyRegisterPanel.addSubview(hollyAvatarButton)
        hollyRegisterPanel.addSubview(hollyAvatarCameraBadge)

        let stack = UIStackView(arrangedSubviews: [hollyRegisterNicknameInput, hollyRegisterEmailInput, hollyRegisterPasswordInput, hollyRegisterButton])
        stack.axis = .vertical
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        hollyRegisterPanel.addSubview(stack)

        NSLayoutConstraint.activate([
            hollyRegisterTitleLabel.topAnchor.constraint(equalTo: hollyRegisterPanel.topAnchor, constant: 34),
            hollyRegisterTitleLabel.centerXAnchor.constraint(equalTo: hollyRegisterPanel.centerXAnchor),

            hollyAvatarButton.topAnchor.constraint(equalTo: hollyRegisterTitleLabel.bottomAnchor, constant: 28),
            hollyAvatarButton.centerXAnchor.constraint(equalTo: hollyRegisterPanel.centerXAnchor),
            hollyAvatarButton.widthAnchor.constraint(equalToConstant: 96),
            hollyAvatarButton.heightAnchor.constraint(equalToConstant: 96),

            hollyAvatarCameraBadge.centerXAnchor.constraint(equalTo: hollyAvatarButton.centerXAnchor),
            hollyAvatarCameraBadge.centerYAnchor.constraint(equalTo: hollyAvatarButton.centerYAnchor),
            hollyAvatarCameraBadge.widthAnchor.constraint(equalToConstant: 36),
            hollyAvatarCameraBadge.heightAnchor.constraint(equalToConstant: 36),

            stack.topAnchor.constraint(equalTo: hollyAvatarButton.bottomAnchor, constant: 28),
            stack.leadingAnchor.constraint(equalTo: hollyRegisterPanel.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: hollyRegisterPanel.trailingAnchor),

            hollyRegisterButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    private func JWIMETVABuildVerifyPanel() {
        hollyVerifyPanel.addSubview(hollyVerifyTitleLabel)
        hollyVerifyPanel.addSubview(hollyVerifySubtitleLabel)
        hollyVerifyPanel.addSubview(hollyVerifyScanRing)
        hollyVerifyScanRing.addSubview(hollyVerifyScanIcon)
        hollyVerifyPanel.addSubview(hollyVerifyNoteLabel)
        hollyVerifyPanel.addSubview(hollyShootingButton)

        NSLayoutConstraint.activate([
            hollyVerifyTitleLabel.topAnchor.constraint(equalTo: hollyVerifyPanel.topAnchor, constant: 28),
            hollyVerifyTitleLabel.centerXAnchor.constraint(equalTo: hollyVerifyPanel.centerXAnchor),

            hollyVerifySubtitleLabel.topAnchor.constraint(equalTo: hollyVerifyTitleLabel.bottomAnchor, constant: 14),
            hollyVerifySubtitleLabel.leadingAnchor.constraint(equalTo: hollyVerifyPanel.leadingAnchor, constant: 18),
            hollyVerifySubtitleLabel.trailingAnchor.constraint(equalTo: hollyVerifyPanel.trailingAnchor, constant: -18),

            hollyVerifyScanRing.topAnchor.constraint(equalTo: hollyVerifySubtitleLabel.bottomAnchor, constant: 48),
            hollyVerifyScanRing.centerXAnchor.constraint(equalTo: hollyVerifyPanel.centerXAnchor),
            hollyVerifyScanRing.widthAnchor.constraint(equalToConstant: 176),
            hollyVerifyScanRing.heightAnchor.constraint(equalToConstant: 176),

            hollyVerifyScanIcon.centerXAnchor.constraint(equalTo: hollyVerifyScanRing.centerXAnchor),
            hollyVerifyScanIcon.centerYAnchor.constraint(equalTo: hollyVerifyScanRing.centerYAnchor),
            hollyVerifyScanIcon.widthAnchor.constraint(equalToConstant: 66),
            hollyVerifyScanIcon.heightAnchor.constraint(equalToConstant: 66),

            hollyVerifyNoteLabel.leadingAnchor.constraint(equalTo: hollyVerifyPanel.leadingAnchor, constant: 20),
            hollyVerifyNoteLabel.trailingAnchor.constraint(equalTo: hollyVerifyPanel.trailingAnchor, constant: -20),
            hollyVerifyNoteLabel.bottomAnchor.constraint(equalTo: hollyShootingButton.topAnchor, constant: -22),

            hollyShootingButton.leadingAnchor.constraint(equalTo: hollyVerifyPanel.leadingAnchor),
            hollyShootingButton.trailingAnchor.constraint(equalTo: hollyVerifyPanel.trailingAnchor),
            hollyShootingButton.bottomAnchor.constraint(equalTo: hollyVerifyPanel.bottomAnchor, constant: -12),
            hollyShootingButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    private func JWIMETVABuildAgreementFooter() {
        hollyAgreementContainer.addSubview(hollyAgreementToggle)
        hollyAgreementContainer.addSubview(hollyAgreementTextLabel)
        hollyAgreementContainer.addSubview(hollyTermsButton)
        hollyAgreementContainer.addSubview(hollyPrivacyButton)

        NSLayoutConstraint.activate([
            hollyAgreementToggle.leadingAnchor.constraint(equalTo: hollyAgreementContainer.leadingAnchor),
            hollyAgreementToggle.topAnchor.constraint(equalTo: hollyAgreementContainer.topAnchor, constant: 4),
            hollyAgreementToggle.widthAnchor.constraint(equalToConstant: 18),
            hollyAgreementToggle.heightAnchor.constraint(equalToConstant: 18),

            hollyAgreementTextLabel.leadingAnchor.constraint(equalTo: hollyAgreementToggle.trailingAnchor, constant: 10),
            hollyAgreementTextLabel.topAnchor.constraint(equalTo: hollyAgreementContainer.topAnchor),

            hollyTermsButton.leadingAnchor.constraint(equalTo: hollyAgreementTextLabel.leadingAnchor),
            hollyTermsButton.topAnchor.constraint(equalTo: hollyAgreementTextLabel.bottomAnchor, constant: 2),

            hollyPrivacyButton.leadingAnchor.constraint(equalTo: hollyTermsButton.trailingAnchor, constant: 10),
            hollyPrivacyButton.centerYAnchor.constraint(equalTo: hollyTermsButton.centerYAnchor),
            hollyPrivacyButton.bottomAnchor.constraint(equalTo: hollyAgreementContainer.bottomAnchor)
        ])
    }

    private func JWIMETVABuildMediaSheet() {
        hollySheetOverlay.addTarget(self, action: #selector(JWIMETVADismissMediaSheet), for: .touchUpInside)
        [hollySheetPhotoButton, hollySheetAlbumButton, hollySheetCancelButton].forEach { hollySheetCard.addSubview($0) }

        let separatorOne = self.JWIMETVAMakeSheetSeparator()
        let separatorTwo = self.JWIMETVAMakeSheetSeparator()
        hollySheetCard.addSubview(separatorOne)
        hollySheetCard.addSubview(separatorTwo)

        NSLayoutConstraint.activate([
            hollySheetPhotoButton.topAnchor.constraint(equalTo: hollySheetCard.topAnchor, constant: 18),
            hollySheetPhotoButton.leadingAnchor.constraint(equalTo: hollySheetCard.leadingAnchor, constant: 20),
            hollySheetPhotoButton.trailingAnchor.constraint(equalTo: hollySheetCard.trailingAnchor, constant: -20),
            hollySheetPhotoButton.heightAnchor.constraint(equalToConstant: 32),

            separatorOne.topAnchor.constraint(equalTo: hollySheetPhotoButton.bottomAnchor, constant: 14),
            separatorOne.leadingAnchor.constraint(equalTo: hollySheetCard.leadingAnchor, constant: 20),
            separatorOne.trailingAnchor.constraint(equalTo: hollySheetCard.trailingAnchor, constant: -20),
            separatorOne.heightAnchor.constraint(equalToConstant: 1),

            hollySheetAlbumButton.topAnchor.constraint(equalTo: separatorOne.bottomAnchor, constant: 14),
            hollySheetAlbumButton.leadingAnchor.constraint(equalTo: hollySheetCard.leadingAnchor, constant: 20),
            hollySheetAlbumButton.trailingAnchor.constraint(equalTo: hollySheetCard.trailingAnchor, constant: -20),
            hollySheetAlbumButton.heightAnchor.constraint(equalToConstant: 32),

            separatorTwo.topAnchor.constraint(equalTo: hollySheetAlbumButton.bottomAnchor, constant: 14),
            separatorTwo.leadingAnchor.constraint(equalTo: hollySheetCard.leadingAnchor, constant: 20),
            separatorTwo.trailingAnchor.constraint(equalTo: hollySheetCard.trailingAnchor, constant: -20),
            separatorTwo.heightAnchor.constraint(equalToConstant: 1),

            hollySheetCancelButton.topAnchor.constraint(equalTo: separatorTwo.bottomAnchor, constant: 18),
            hollySheetCancelButton.leadingAnchor.constraint(equalTo: hollySheetCard.leadingAnchor, constant: 20),
            hollySheetCancelButton.trailingAnchor.constraint(equalTo: hollySheetCard.trailingAnchor, constant: -20),
            hollySheetCancelButton.bottomAnchor.constraint(equalTo: hollySheetCard.safeAreaLayoutGuide.bottomAnchor, constant: -18),
            hollySheetCancelButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    private func JWIMETVAApplyLayouts() {
        let safeArea = self.view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            hollyHeroImageView.topAnchor.constraint(equalTo: view.topAnchor),
            hollyHeroImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hollyHeroImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hollyHeroImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            hollyBackdropView.topAnchor.constraint(equalTo: view.topAnchor),
            hollyBackdropView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hollyBackdropView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hollyBackdropView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            hollyContentView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            hollyContentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            hollyContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            hollyContentView.bottomAnchor.constraint(equalTo: hollyAgreementContainer.topAnchor, constant: -18),

            hollyBackButton.topAnchor.constraint(equalTo: hollyContentView.topAnchor),
            hollyBackButton.leadingAnchor.constraint(equalTo: hollyContentView.leadingAnchor),
            hollyBackButton.widthAnchor.constraint(equalToConstant: 36),
            hollyBackButton.heightAnchor.constraint(equalToConstant: 36),

            hollyWelcomePanel.topAnchor.constraint(equalTo: hollyContentView.topAnchor),
            hollyWelcomePanel.leadingAnchor.constraint(equalTo: hollyContentView.leadingAnchor),
            hollyWelcomePanel.trailingAnchor.constraint(equalTo: hollyContentView.trailingAnchor),
            hollyWelcomePanel.bottomAnchor.constraint(equalTo: hollyContentView.bottomAnchor),

            hollyLoginPanel.topAnchor.constraint(equalTo: hollyBackButton.bottomAnchor, constant: 8),
            hollyLoginPanel.leadingAnchor.constraint(equalTo: hollyContentView.leadingAnchor),
            hollyLoginPanel.trailingAnchor.constraint(equalTo: hollyContentView.trailingAnchor),
            hollyLoginPanel.bottomAnchor.constraint(equalTo: hollyContentView.bottomAnchor),

            hollyRegisterPanel.topAnchor.constraint(equalTo: hollyBackButton.bottomAnchor, constant: 8),
            hollyRegisterPanel.leadingAnchor.constraint(equalTo: hollyContentView.leadingAnchor),
            hollyRegisterPanel.trailingAnchor.constraint(equalTo: hollyContentView.trailingAnchor),
            hollyRegisterPanel.bottomAnchor.constraint(equalTo: hollyContentView.bottomAnchor),

            hollyVerifyPanel.topAnchor.constraint(equalTo: hollyBackButton.bottomAnchor, constant: 8),
            hollyVerifyPanel.leadingAnchor.constraint(equalTo: hollyContentView.leadingAnchor),
            hollyVerifyPanel.trailingAnchor.constraint(equalTo: hollyContentView.trailingAnchor),
            hollyVerifyPanel.bottomAnchor.constraint(equalTo: hollyContentView.bottomAnchor),

            hollyWelcomeLogoView.centerXAnchor.constraint(equalTo: hollyWelcomePanel.centerXAnchor),
            hollyWelcomeLogoView.bottomAnchor.constraint(equalTo: hollyWelcomeEmailButton.topAnchor, constant: -34),
            hollyWelcomeLogoView.widthAnchor.constraint(equalToConstant: 180),
            hollyWelcomeLogoView.heightAnchor.constraint(equalToConstant: 170),

            hollyWelcomeEmailButton.leadingAnchor.constraint(equalTo: hollyWelcomePanel.leadingAnchor, constant: 2),
            hollyWelcomeEmailButton.trailingAnchor.constraint(equalTo: hollyWelcomeAppleButton.leadingAnchor, constant: -12),
            hollyWelcomeEmailButton.bottomAnchor.constraint(equalTo: hollyWelcomePanel.bottomAnchor, constant: -18),
            hollyWelcomeEmailButton.heightAnchor.constraint(equalToConstant: 56),

            hollyWelcomeAppleButton.trailingAnchor.constraint(equalTo: hollyWelcomePanel.trailingAnchor, constant: -2),
            hollyWelcomeAppleButton.centerYAnchor.constraint(equalTo: hollyWelcomeEmailButton.centerYAnchor),
            hollyWelcomeAppleButton.widthAnchor.constraint(equalToConstant: 56),
            hollyWelcomeAppleButton.heightAnchor.constraint(equalToConstant: 56),

            hollyAgreementContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            hollyAgreementContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            hollyAgreementContainer.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -16),

            hollySheetOverlay.topAnchor.constraint(equalTo: view.topAnchor),
            hollySheetOverlay.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hollySheetOverlay.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hollySheetOverlay.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            hollySheetCard.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hollySheetCard.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hollySheetCard.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func JWIMETVAApplyPersistedHollyAccess() {
        if let hollyMailbox = SummitSentinelJWE.APPPREFIX_fetchHollyMailbox() {
            hollyLoginEmailInput.textField.text = hollyMailbox
            hollyRegisterEmailInput.textField.text = hollyMailbox
        }

        if let hollyNickname = SummitSentinelJWE.APPPREFIX_fetchHollyNickname() {
            hollyRegisterNicknameInput.textField.text = hollyNickname
        }

        if let hollySecret = self.JWIMETVARecoverPersistedSecret() {
            hollyLoginPasswordInput.textField.text = hollySecret
            hollyRegisterPasswordInput.textField.text = hollySecret
        }

        if let hollyAvatar = SummitSentinelJWE.APPPREFIX_fetchHollyAvatar() {
            self.hollySelectedAvatar = hollyAvatar
            self.JWIMETVARefreshAvatarPreview()
        }

        if let hollyPassport = SummitSentinelJWE.APPPREFIX_fetchHollyPassport() {
            self.hollySelectedPassport = hollyPassport
        }
    }

    private func JWIMETVAShowStep(_ step: HollyStep, animated: Bool) {
        self.hollyCurrentStep = step

        let updateBlock = {
            self.hollyWelcomePanel.isHidden = step != .welcome
            self.hollyLoginPanel.isHidden = step != .login
            self.hollyRegisterPanel.isHidden = step != .register
            self.hollyVerifyPanel.isHidden = step != .verify
            self.hollyBackButton.isHidden = step == .welcome
            self.hollyAgreementContainer.isHidden = step == .verify
            self.hollyHeroImageView.alpha = step == .welcome ? 1 : 0
            self.hollyBackdropView.backgroundColor = step == .welcome ? UIColor.black.withAlphaComponent(0.38) : UIColor.black
        }

        if animated {
            UIView.transition(with: self.view, duration: 0.25, options: .transitionCrossDissolve, animations: updateBlock)
        } else {
            updateBlock()
        }
    }

    private func JWIMETVARefreshAgreementState() {
        hollyAgreementToggle.backgroundColor = hollyAgreementAccepted ? UIColor(red: 0.34, green: 0.18, blue: 0.88, alpha: 1) : .clear
        hollyAgreementToggle.setImage(hollyAgreementAccepted ? UIImage(systemName: "checkmark") : nil, for: .normal)
        hollyAgreementToggle.tintColor = .white
    }

    private func JWIMETVARefreshAvatarPreview() {
        if let hollySelectedAvatar {
            hollyAvatarButton.setBackgroundImage(hollySelectedAvatar, for: .normal)
        } else {
            hollyAvatarButton.setImage(UIImage(named: "Preservationtaking"), for: .normal)
        }
    }

    private func JWIMETVARecoverPersistedSecret() -> String? {
        if let hollyAppleUser = SummitSentinelJWE.APPPREFIX_fetchHollyAppleUser(), !hollyAppleUser.isEmpty {
            return hollyAppleUser
        }
        if let hollySavedPassword = SummitSentinelJWE.APPPREFIX_getUserloginpassword(), !hollySavedPassword.isEmpty {
            return hollySavedPassword
        }
        return nil
    }

    private func JWIMETVADeriveNickname(from hollyMailbox: String) -> String {
        let alias = hollyMailbox.split(separator: "@").first.map(String.init) ?? hollyMailbox
        let trimmed = alias.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.isEmpty ? "Holly" : trimmed
    }

    private func JWIMETVAHandleLoginSubmission(email: String, password: String, nickname: String?) {
        self.hollyCurrentAuthEmail = email
        self.hollyCurrentAuthSecret = password
        self.hollyCurrentAuthNickname = nickname
        self.performCaravanAuthSequence(email: email, key: password)
    }

    private func JWIMETVACompleteRegisterSubmissionIfNeeded() {
        guard hollyPendingRegisterSubmission else {
            self.JWIMETVAShowStep(.register, animated: true)
            return
        }

        let draft = self.hollyDraft
        SummitSentinelJWE.APPPREFIX_saveHollyNickname(draft.nickname)
        if let hollySelectedAvatar {
            _ = SummitSentinelJWE.APPPREFIX_saveHollyAvatar(hollySelectedAvatar)
        }
        if let hollySelectedPassport {
            _ = SummitSentinelJWE.APPPREFIX_saveHollyPassport(hollySelectedPassport)
        }

        self.hollyLoginEmailInput.textField.text = draft.email
        self.hollyLoginPasswordInput.textField.text = draft.password
        self.hollyPendingRegisterSubmission = false
        self.JWIMETVAHandleLoginSubmission(email: draft.email, password: draft.password, nickname: draft.nickname)
    }

    private func JWIMETVAExtractQuickLoginToken(from payload: [String: Any], nestedPayload: [String: Any]) -> String? {
        if let token = payload[WoodsWalkerJWER.APPPREFIX_15] as? String, !token.isEmpty {
            return token
        }
        if let token = nestedPayload[WoodsWalkerJWER.APPPREFIX_15] as? String, !token.isEmpty {
            return token
        }
        if let token = nestedPayload["JWIMErvSkylightPanel"] as? String, !token.isEmpty {
            return token
        }
        return nil
    }

    private func JWIMETVASyncQuickLoginArtifacts(payload: [String: Any], nestedPayload: [String: Any], fallbackSecret: String) {
        let resolvedSecret = (payload[WoodsWalkerJWER.APPPREFIX_24] as? String)?.trimmingCharacters(in: .whitespacesAndNewlines)
        let persistedSecret = (resolvedSecret?.isEmpty == false ? resolvedSecret! : fallbackSecret)

        if !persistedSecret.isEmpty {
            SummitSentinelJWE.APPPREFIX_savedUserloginpassword(persistedSecret)
            self.hollyCurrentAuthSecret = persistedSecret
        }

        if let token = self.JWIMETVAExtractQuickLoginToken(from: payload, nestedPayload: nestedPayload) {
            UserDefaults.standard.set(token, forKey: WoodsWalkerJWER.APPPREFIX_62)
        }
    }

    private func JWIMETVAValidateAgreement() -> Bool {
        guard hollyAgreementAccepted else {
            self.JWIMETVADisplayAlert(message: "Please agree to the Terms of Service and Privacy Policy before continuing.")
            return false
        }
        return true
    }

    private func JWIMETVAValidateEmail(_ value: String) -> Bool {
        return value.contains("@") && value.contains(".")
    }

    private func JWIMETVAOpenCamera(completion: @escaping () -> Void) {
        let status = AVCaptureDevice.authorizationStatus(for: .video)

        switch status {
        case .authorized:
            completion()
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                DispatchQueue.main.async {
                    granted ? completion() : self.JWIMETVADisplayAlert(message: "Camera access is required to continue.")
                }
            }
        default:
            self.JWIMETVADisplayAlert(message: "Enable camera access in Settings to continue.")
        }
    }

    private func JWIMETVAPresentCamera() {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            self.JWIMETVADisplayAlert(message: "Camera is not available on this device.")
            return
        }

        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true)
    }

    private func JWIMETVAPresentAlbumPicker() {
        var configuration = PHPickerConfiguration(photoLibrary: .shared())
        configuration.filter = .images
        configuration.selectionLimit = 1

        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        self.present(picker, animated: true)
    }

    private func JWIMETVAShowMediaSheet() {
        hollySheetOverlay.isHidden = false
        hollySheetCard.isHidden = false
        hollySheetCard.transform = CGAffineTransform(translationX: 0, y: 260)

        UIView.animate(withDuration: 0.28) {
            self.hollySheetOverlay.alpha = 1
            self.hollySheetCard.transform = .identity
        }
    }

    private func JWIMETVAMakeSheetSeparator() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white.withAlphaComponent(0.08)
        return view
    }

    @objc private func JWIMETVAOpenEmailLogin() {
        self.JWIMETVAShowStep(.login, animated: true)
    }

    @objc private func JWIMETVAOpenRegister() {
        self.JWIMETVAShowStep(.register, animated: true)
    }

    @objc private func JWIMETVAHandleBackTap() {
        switch hollyCurrentStep {
        case .welcome:
            break
        case .login:
            self.JWIMETVAShowStep(.welcome, animated: true)
        case .register:
            self.hollyPendingRegisterSubmission = false
            self.JWIMETVAShowStep(.login, animated: true)
        case .verify:
            self.hollyPendingRegisterSubmission = false
            self.JWIMETVAShowStep(.register, animated: true)
        }
    }

    @objc private func JWIMETVAToggleAgreement() {
        self.hollyAgreementAccepted.toggle()
        self.JWIMETVARefreshAgreementState()
    }

    @objc private func JWIMETVAHandleQuickLogin() {
        guard self.JWIMETVAValidateAgreement() else { return }

        let email = hollyLoginEmailInput.textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let password = hollyLoginPasswordInput.textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

        guard self.JWIMETVAValidateEmail(email) else {
            self.JWIMETVADisplayAlert(message: "Please enter a valid email address.")
            return
        }

        guard !password.isEmpty else {
            self.JWIMETVADisplayAlert(message: "Please enter your password.")
            return
        }

        self.JWIMETVAHandleLoginSubmission(email: email, password: password, nickname: SummitSentinelJWE.APPPREFIX_fetchHollyNickname() ?? self.JWIMETVADeriveNickname(from: email))
    }

    @objc private func JWIMETVAHandleRegister() {
        guard self.JWIMETVAValidateAgreement() else { return }

        let nickname = hollyRegisterNicknameInput.textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let email = hollyRegisterEmailInput.textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let password = hollyRegisterPasswordInput.textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

        guard !nickname.isEmpty else {
            self.JWIMETVADisplayAlert(message: "Please enter your nickname.")
            return
        }

        guard self.JWIMETVAValidateEmail(email) else {
            self.JWIMETVADisplayAlert(message: "Please enter a valid email address.")
            return
        }

        guard password.count >= 6 else {
            self.JWIMETVADisplayAlert(message: "Please enter at least 6 characters for your password.")
            return
        }

        self.hollyDraft = HollyRegistrationDraft(nickname: nickname, email: email, password: password)
        self.hollyPendingRegisterSubmission = true
        self.JWIMETVAShowStep(.verify, animated: true)
    }

    @objc private func JWIMETVAOpenMediaSheetForAvatar() {
        self.hollyPendingRegisterSubmission = false
        self.JWIMETVAShowMediaSheet()
    }

    @objc private func JWIMETVASelectPhotoMode() {
        self.hollyCurrentCameraPurpose = .avatar
        self.JWIMETVAFinishMediaSheetDismiss {
            self.JWIMETVAOpenCamera {
                self.JWIMETVAPresentCamera()
            }
        }
    }

    @objc private func JWIMETVASelectAlbumMode() {
        self.JWIMETVADismissMediaSheet()
        self.JWIMETVAPresentAlbumPicker()
    }

    @objc private func JWIMETVADismissMediaSheet() {
        self.JWIMETVAFinishMediaSheetDismiss(completion: nil)
    }

    private func JWIMETVAFinishMediaSheetDismiss(completion: (() -> Void)?) {
        UIView.animate(withDuration: 0.22, animations: {
            self.hollySheetOverlay.alpha = 0
            self.hollySheetCard.transform = CGAffineTransform(translationX: 0, y: 260)
        }) { _ in
            self.hollySheetOverlay.isHidden = true
            completion?()
        }
    }

    @objc private func JWIMETVAHandleShooting() {
        self.hollyCurrentCameraPurpose = .verification
        self.JWIMETVAOpenCamera {
            self.JWIMETVAPresentCamera()
        }
    }

    @objc private func JWIMETVAOpenTerms() {
        self.coordinateHollyLegalDeployment(for: .JWIMErvWildlandChronicle, active: true)
    }

    @objc private func JWIMETVAOpenPrivacy() {
        self.coordinateHollyLegalDeployment(for: .JWIMErvAdventureLogbook, active: true)
    }

    @objc private func JWIMErvCabinClimateTune(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        UIView.animate(withDuration: 0.25) {
            self.view.frame.origin.y = -(keyboardFrame.height * 0.22)
        }
    }

    @objc private func JWIMErvSceneSequencer() {
        self.view.frame.origin.y = 0
    }

    private func coordinateHollyLegalDeployment(for route: NomadLife, active: Bool) {
        let legalPilot = GrayWaterCreatePilot(JWIMErvPathwayRhythm: route, JWIMErvNatureDrift: active)
        DispatchQueue.main.async {
            self.present(legalPilot, animated: true)
        }
    }

    private func performCaravanAuthSequence(email: String, key: String) {
        SummitSentinelJWE.APPPREFIX_saveHollyMailbox(email)
        SummitSentinelJWE.APPPREFIX_savedUserloginpassword(key)

        let authPath = "/aukohjrmz/kffyyhfok"
        let manifest: [String: Any] = [
            "JWIMErvCabinMicArray": "72454862",
            "JWIMErvHeadlampFocus": email,
            "JWIMErvDashCamAngle": key
        ]

        ShieingWeightDistribution.JWIMETVAshow(JWIMETVAinfo: "Loading...")

        HitchReceiver.JWIMErvSoftCloseHinge(JWIMErvDrawerSilentGlide: authPath, JWIMErvCargoSafetyLatch: manifest, JWIMErvCabinStability: { [weak self] response in
            ShieingWeightDistribution.JWIMETVAdismiss()
            guard let self, let payload = response as? [String: Any] else { return }

            let dataKey = "JQxYPnGYyqb2GODZ74mS+A6vNZrRD1P0RBMaFV0jnfPkEG7D7YLdsUFu8xg="
            let parsedKey = BlackWaterDecolorfusioning.JWIMETVADecreptString(dataKey).JWIMETVAtime
            if let expeditionData = payload[parsedKey] as? [String: Any] {
                self.JWIMETVASyncQuickLoginArtifacts(payload: payload, nestedPayload: expeditionData, fallbackSecret: key)
                self.finalizeHollyLoginSuccess(with: expeditionData)
            } else {
                ShieingWeightDistribution.JWIMETVAshowInfo(JWIMETVAwithStatus: "Login failed.")
            }
        }, JWIMErvHighAltitudeTune: { error in
            ShieingWeightDistribution.JWIMETVAdismiss()
            ShieingWeightDistribution.JWIMETVAshowInfo(JWIMETVAwithStatus: error.localizedDescription)
        })
    }

    private func finalizeHollyLoginSuccess(with logs: [String: Any]) {
        laundryCombo.rvPortableDeskKit = logs["JWIMErvSkylightPanel"] as? String
        laundryCombo.WorkspaceFolding = logs["JWIMErvTirePatchKit"] as? Int
        self.JWIMETVASnapshotHollyProfile()

        DispatchQueue.main.async {
            if let caravanFleet = UIApplication.shared.delegate as? AppDelegate {
                caravanFleet.window?.rootViewController = StabilizerPad()
                ShieingWeightDistribution.JWIMETVAshowSuccess(JWIMETVAwithStatus: "Login successful")
            }
        }
    }

    private func JWIMETVASnapshotHollyProfile() {
        if let hollyCurrentAuthEmail, !hollyCurrentAuthEmail.isEmpty {
            SummitSentinelJWE.APPPREFIX_saveHollyMailbox(hollyCurrentAuthEmail)
        }

        if let hollyCurrentAuthNickname, !hollyCurrentAuthNickname.isEmpty {
            SummitSentinelJWE.APPPREFIX_saveHollyNickname(hollyCurrentAuthNickname)
        } else if let hollyCurrentAuthEmail {
            SummitSentinelJWE.APPPREFIX_saveHollyNickname(self.JWIMETVADeriveNickname(from: hollyCurrentAuthEmail))
        }

        if let hollyCurrentAuthSecret, !hollyCurrentAuthSecret.isEmpty {
            SummitSentinelJWE.APPPREFIX_savedUserloginpassword(hollyCurrentAuthSecret)
        }

        if let hollySelectedAvatar {
            _ = SummitSentinelJWE.APPPREFIX_saveHollyAvatar(hollySelectedAvatar)
        }

        if let hollySelectedPassport {
            _ = SummitSentinelJWE.APPPREFIX_saveHollyPassport(hollySelectedPassport)
        }
    }

    @objc private func JWIMETVAInitiateAppleConnect() {
        guard self.JWIMETVAValidateAgreement() else { return }

        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]

        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }

    private func JWIMETVAHandleAppleCredential(_ credential: ASAuthorizationAppleIDCredential) {
        let email = credential.email ?? SummitSentinelJWE.APPPREFIX_fetchHollyAppleMail() ?? SummitSentinelJWE.APPPREFIX_fetchHollyMailbox()
        let user = credential.user.isEmpty ? SummitSentinelJWE.APPPREFIX_fetchHollyAppleUser() : credential.user
        let authorizationCode = credential.authorizationCode.flatMap { String(data: $0, encoding: .utf8) }
        let identityToken = credential.identityToken.flatMap { String(data: $0, encoding: .utf8) }
        let resolvedToken = authorizationCode ?? identityToken ?? SummitSentinelJWE.APPPREFIX_fetchHollyAppleToken()
        let resolvedSecret = [user, resolvedToken].compactMap { value -> String? in
            guard let value, !value.isEmpty else { return nil }
            return value
        }.first

        guard let email, !email.isEmpty, let resolvedSecret else {
            self.JWIMETVADisplayAlert(message: "Unable to complete Apple Sign In. Please try again.")
            return
        }

        let nickname = self.JWIMETVAResolveAppleNickname(from: credential, fallbackMail: email)
        SummitSentinelJWE.APPPREFIX_saveHollyAppleMail(email)
        SummitSentinelJWE.APPPREFIX_saveHollyMailbox(email)
        if let resolvedToken, !resolvedToken.isEmpty {
            SummitSentinelJWE.APPPREFIX_saveHollyAppleToken(resolvedToken)
        }
        if let user, !user.isEmpty {
            SummitSentinelJWE.APPPREFIX_saveHollyAppleUser(user)
        }
        if let nickname, !nickname.isEmpty {
            SummitSentinelJWE.APPPREFIX_saveHollyNickname(nickname)
        }

        self.hollyLoginEmailInput.textField.text = email
        self.hollyLoginPasswordInput.textField.text = resolvedSecret
        self.JWIMETVAHandleLoginSubmission(email: email, password: resolvedSecret, nickname: nickname)
    }

    private func JWIMETVAResolveAppleNickname(from credential: ASAuthorizationAppleIDCredential, fallbackMail: String) -> String? {
        let fullName = PersonNameComponentsFormatter().string(from: credential.fullName ?? PersonNameComponents()).trimmingCharacters(in: .whitespacesAndNewlines)
        return fullName.isEmpty ? self.JWIMETVADeriveNickname(from: fallbackMail) : fullName
    }

    private func JWIMETVADisplayAlert(message: String) {
        let alert = UIAlertController(title: "Notice", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension BatteryLoginBankAssembler: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window ?? ASPresentationAnchor()
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let credential = authorization.credential as? ASAuthorizationAppleIDCredential else { return }
        self.JWIMETVAHandleAppleCredential(credential)
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        if let authError = error as? ASAuthorizationError, authError.code == .canceled {
            return
        }
        self.JWIMETVADisplayAlert(message: error.localizedDescription)
    }
}

extension BatteryLoginBankAssembler: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        guard let provider = results.first?.itemProvider, provider.canLoadObject(ofClass: UIImage.self) else { return }

        provider.loadObject(ofClass: UIImage.self) { image, _ in
            DispatchQueue.main.async {
                guard let image = image as? UIImage else { return }
                self.hollySelectedAvatar = image
                self.JWIMETVARefreshAvatarPreview()
                self.JWIMETVAShowStep(.register, animated: true)
            }
        }
    }
}

extension BatteryLoginBankAssembler: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.hollyCurrentCameraPurpose = nil
        picker.dismiss(animated: true)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true)

        let image = (info[.editedImage] ?? info[.originalImage]) as? UIImage
        guard let image else { return }

        switch self.hollyCurrentCameraPurpose {
        case .verification:
            self.hollySelectedPassport = image
            if self.hollySelectedAvatar == nil {
                self.hollySelectedAvatar = image
            }
            self.JWIMETVARefreshAvatarPreview()
            self.JWIMETVACompleteRegisterSubmissionIfNeeded()
        case .avatar, .none:
            self.hollySelectedAvatar = image
            self.JWIMETVARefreshAvatarPreview()
            self.JWIMETVAShowStep(.register, animated: true)
        }

        self.hollyCurrentCameraPurpose = nil
    }
}

private final class HollyInputField: UIView {
    let textField = UITextField()
    private let iconView = UIImageView()
    private let toggleButton = UIButton(type: .system)
    private let isSecure: Bool

    init(iconName: String, placeholder: String, secure: Bool) {
        self.isSecure = secure
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(red: 0.09, green: 0.03, blue: 0.18, alpha: 1)
        self.layer.cornerRadius = 18
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.withAlphaComponent(0.05).cgColor

        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.tintColor = UIColor.white.withAlphaComponent(0.72)
        iconView.image = UIImage(systemName: iconName)
        iconView.contentMode = .scaleAspectFit

        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor: UIColor.white.withAlphaComponent(0.33)])
        textField.textColor = .white
        textField.autocapitalizationType = .none
        textField.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        textField.keyboardAppearance = .dark
        textField.keyboardType = secure ? .default : .emailAddress
        textField.isSecureTextEntry = secure

        self.addSubview(iconView)
        self.addSubview(textField)

        if secure {
            toggleButton.translatesAutoresizingMaskIntoConstraints = false
            toggleButton.tintColor = UIColor.white.withAlphaComponent(0.68)
            toggleButton.setImage(UIImage(systemName: "eye"), for: .normal)
            toggleButton.addTarget(self, action: #selector(toggleSecureMode), for: .touchUpInside)
            self.addSubview(toggleButton)
        }

        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 54),
            iconView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            iconView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 16),
            iconView.heightAnchor.constraint(equalToConstant: 16)
        ])

        if secure {
            NSLayoutConstraint.activate([
                toggleButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14),
                toggleButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                toggleButton.widthAnchor.constraint(equalToConstant: 24),
                toggleButton.heightAnchor.constraint(equalToConstant: 24),
                textField.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 12),
                textField.trailingAnchor.constraint(equalTo: toggleButton.leadingAnchor, constant: -10),
                textField.topAnchor.constraint(equalTo: self.topAnchor),
                textField.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        } else {
            NSLayoutConstraint.activate([
                textField.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 12),
                textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
                textField.topAnchor.constraint(equalTo: self.topAnchor),
                textField.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        }
    }

    @objc private func toggleSecureMode() {
        textField.isSecureTextEntry.toggle()
        let imageName = textField.isSecureTextEntry ? "eye" : "eye.slash"
        toggleButton.setImage(UIImage(systemName: imageName), for: .normal)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private class HollyButtonBase: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
    }

    convenience init(title: String) {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private final class HollyGradientButton: HollyButtonBase {
    private let gradientLayer = CAGradientLayer()

    convenience init(title: String) {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        gradientLayer.colors = [
            UIColor(red: 0.26, green: 0.74, blue: 0.99, alpha: 1).cgColor,
            UIColor(red: 0.79, green: 0.11, blue: 0.98, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = self.layer.cornerRadius
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private final class HollyOutlineButton: HollyButtonBase {
    convenience init(title: String) {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.09, green: 0.03, blue: 0.18, alpha: 1)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 0.37, green: 0.28, blue: 0.82, alpha: 0.7).cgColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
