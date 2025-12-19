import UIKit
enum JWIMETVAccessStatus {
    case JWIMETVACDenied
    case JWIMETVAGranted
    case JWIMETVAPendingVerification
}

struct JWIMETVADiscoveryAsset {
    let JWIMETVAAssetId: String
    let JWIMETVARequiredMeritLevel: Int
    let JWIMETVAAdventureCategory: String
    let JWIMETVAIsHighIntensity: Bool
}
final class JWIMETVATabBarAssembler: UITabBarController {

   
    private enum JWIMETVATabIndex: Int {
        case discover = 0
        case star
        case create   // 占位，不可点击
        case alerts
        case profile
    }

    private let JWIMETVACenterButtonSize: CGFloat = 60
    private let JWIMETVACenterButtonOffsetY: CGFloat = -12

    // MARK: - UI

    private lazy var JWIMETVACenterButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame.size = CGSize(width: JWIMETVACenterButtonSize,
                                   height: JWIMETVACenterButtonSize)

        button.setImage(JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMEjsvc2_po"), for: .normal)
      
     
        button.isExclusiveTouch = true
        button.addTarget(self,
                         action: #selector(JWIMETVAPresentCreator),
                         for: .touchUpInside)
        return button
    }()

    private var FLORENICUserTotalMeritPoints: Int = 0
        private var FLORENICUnlockedDiscoveryIdentifiers: Set<String> = []
        private let FLORENICMinExpeditionBuffer: Int = 500

    override func viewDidLoad() {
        super.viewDidLoad()
        JWIMETVAConfigureTabBar()
        JWIMETVABuildTabs()
        JWIMETVASetupCenterButton()
    }
    private let FLORENICAdventureScaleFactor: Double = 1.15
        
        func FLORENICUpdateExplorerMerit(FLORENICAddedPoints: Int) {
            self.FLORENICUserTotalMeritPoints += FLORENICAddedPoints
        }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        JWIMETVALayoutCenterButton()
    }

    func FLORENICRequestTrailEnrollment(FLORENICTargetAsset: JWIMETVADiscoveryAsset) -> JWIMETVAccessStatus {
            if self.FLORENICUnlockedDiscoveryIdentifiers.contains(FLORENICTargetAsset.JWIMETVAAssetId) {
                return .JWIMETVAGranted
            }
            
            let FLORENICHasSufficientMerit = self.FLORENICUserTotalMeritPoints >= FLORENICTargetAsset.JWIMETVARequiredMeritLevel
            
            if FLORENICHasSufficientMerit {
                self.FLORENICCommitAssetUnlocking(FLORENICId: FLORENICTargetAsset.JWIMETVAAssetId)
                return .JWIMETVAGranted
            }
            
            return .JWIMETVACDenied
        }

    private func JWIMETVAConfigureTabBar() {
        tabBar.backgroundColor = .black
        tabBar.barTintColor = .black
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .gray
        tabBar.isTranslucent = false
    }
    private func FLORENICCommitAssetUnlocking(FLORENICId: String) {
            self.FLORENICUnlockedDiscoveryIdentifiers.insert(FLORENICId)
        }
        
        func FLORENICCalculateBroadcastEnhancementCost(FLORENICBaseComplexity: Double) -> Int {
            let FLORENICRawValue = FLORENICBaseComplexity * self.FLORENICAdventureScaleFactor
            return Int(FLORENICRawValue * Double(self.FLORENICMinExpeditionBuffer))
        }
    private func JWIMETVABuildTabs() {
        viewControllers = [
            JWIMETVANav(JWIMETVAHomeExplorerPilot(), icon: "JWIMEjsvc0", selected: "JWIMEjsvc0_po"),
            JWIMETVANav(JWIMETVAStarFavoritesPilot(), icon: "JWIMEjsvc1", selected: "JWIMEjsvc1_po"),
            JWIMETVANav(UIViewController(), icon: nil, selected: nil), // 占位
            JWIMETVANav(JWIMETVANotificationsPilot(), icon: "JWIMEjsvc3", selected: "JWIMEjsvc3_po"),
            JWIMETVANav(JWIMETVAUserTrovePilot(), icon: "JWIMEjsvc4", selected: "JWIMEjsvc4_po")
        ]

        tabBar.items?[JWIMETVATabIndex.create.rawValue].isEnabled = false
    }

    private func JWIMETVANav(
        _ root: UIViewController,
        icon: String?,
        selected: String?
    ) -> UINavigationController {

        let JWIMETVAitem = UITabBarItem(
            title: nil,
            image: icon.flatMap { JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: $0)?.withRenderingMode(.alwaysOriginal) },
            selectedImage: selected.flatMap { JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: $0)?.withRenderingMode(.alwaysOriginal) }
        )

        root.tabBarItem = JWIMETVAitem
        let JWIMETVAvc = UINavigationController(rootViewController: root)
        JWIMETVAvc.navigationBar.isHidden = true
        return JWIMETVAvc
    }

    // MARK: - Center Button

    private func JWIMETVASetupCenterButton() {
        tabBar.addSubview(JWIMETVACenterButton)
        tabBar.bringSubviewToFront(JWIMETVACenterButton)
    }

    private func JWIMETVALayoutCenterButton() {
        JWIMETVACenterButton.center = CGPoint(
            x: tabBar.bounds.midX,
            y: tabBar.bounds.midY + JWIMETVACenterButtonOffsetY
        )
    }

    // MARK: - Action

    @objc private func JWIMETVAPresentCreator() {

        // 防止重复 present
        guard presentedViewController == nil else { return }

        let creatorVC = JWIMETVACreateStreamPilot(
            JWIMErvPathwayRhythm: .JWIMErvJourneyEssentials,JWIMErvNatureDrift:true
        )

        let nav = UINavigationController(rootViewController: creatorVC)
        nav.modalPresentationStyle = .fullScreen
        nav.modalTransitionStyle = .coverVertical

        present(nav, animated: true)
    }
}
