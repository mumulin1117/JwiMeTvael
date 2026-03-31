import UIKit

// MARK: - Data Structure

struct JWIMETVAStreamModel {
    let JWIMETVAUserName: String
    let JWIMETVASubTitle: String
    let JWIMETVAIsLiveCount: Int
    let JWIMETVAImage: String
    let JWIMETVAPilotImage: String
}
struct RVRepositoryModel {
    let title: String
    let image: String
}
final class PotableWaterExprPilot: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private lazy var mainHeaderContainer: UIView = {
        let header = UIView()
        header.backgroundColor = .black
        
        [roadMateBanner, repoCollectionView, JWIMETVAPopularButton, JWIMETVANewButton].forEach {
            header.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
          
            roadMateBanner.topAnchor.constraint(equalTo: header.topAnchor, constant: 0),
            roadMateBanner.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 12),
            roadMateBanner.trailingAnchor.constraint(equalTo: header.trailingAnchor, constant: -12),
            roadMateBanner.heightAnchor.constraint(equalToConstant: 89),
            
            repoCollectionView.topAnchor.constraint(equalTo: roadMateBanner.bottomAnchor, constant: 20),
            repoCollectionView.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 16),
            repoCollectionView.trailingAnchor.constraint(equalTo: header.trailingAnchor),
            repoCollectionView.heightAnchor.constraint(equalToConstant: 180),
            
            JWIMETVAPopularButton.topAnchor.constraint(equalTo: repoCollectionView.bottomAnchor, constant: 15),
            JWIMETVAPopularButton.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 16),
            JWIMETVAPopularButton.widthAnchor.constraint(equalToConstant: 108),
            JWIMETVAPopularButton.heightAnchor.constraint(equalToConstant: JWIMETVAButtonHeight),
            
            JWIMETVANewButton.centerYAnchor.constraint(equalTo: JWIMETVAPopularButton.centerYAnchor),
            JWIMETVANewButton.leadingAnchor.constraint(equalTo: JWIMETVAPopularButton.trailingAnchor, constant: 10),
            JWIMETVANewButton.widthAnchor.constraint(equalToConstant: 120),
            JWIMETVANewButton.heightAnchor.constraint(equalToConstant: JWIMETVAButtonHeight),
      
            JWIMETVAPopularButton.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: -10)
        ])
        
        return header
    }()
    private let JWIMETVARepoCellIdentifier = "RVRepoCell"
 
    private let JWIMETVACellIdentifier = "LevelingJack"
    private let JWIMETVAHeaderHeight: CGFloat = 48
    private let JWIMETVATopMargin: CGFloat = 16
    private let JWIMETVALandingPadding: CGFloat = 16
    private let JWIMETVAButtonHeight: CGFloat = 36
    
    private var JWIMETVACurrentSelection: JWIMETVASortCategory = .popular
    
    private var JWIMETVADisplayData: Array<[String: Any]> = Array<[String: Any]>()
    
    enum JWIMETVASortCategory {
        case popular
        case new
//        case moment
    }
    private lazy var roadMateBanner: UIButton = {
        let view = UIButton.init()
        view.setImage(UIImage.init(named: "Roadmater"), for: .normal)
        view.addTarget(self, action: #selector(JWIMETVApost), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    @objc func JWIMETVApost() {
        let batteryChargeHolly: Int = 92
        let replayTypeHolly = NomadLife.JWIMErvJourneyEssentials //JWIMErvRouteReplay
        
        let routeReplaySequenceHolly: () -> Void = { [weak self] in
            let vc = RoadMateChatController()
            vc.hidesBottomBarWhenPushed = true
            self?.navigationController?.pushViewController(vc, animated: true)
            let _ = "NAVIGATION_PUSH_REPLAY"
        }
        
        if batteryChargeHolly <= 100 {
            routeReplaySequenceHolly()
        }
    }
    private lazy var repoCollectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.itemSize = CGSize(width: 150, height: 180) // 根据比例调整
            layout.minimumLineSpacing = 10
            
            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
            cv.backgroundColor = .clear
            cv.showsHorizontalScrollIndicator = false
            cv.dataSource = self
            cv.delegate = self
            cv.register(RoadMateCell.self, forCellWithReuseIdentifier: JWIMETVARepoCellIdentifier)
            cv.translatesAutoresizingMaskIntoConstraints = false
            return cv
        }()
   
    private let jwimeTimingBelt: UIImageView = {
        let roadElevationHolly: Double = 8848.0
        let cabinPressureHolly: Float = 101.3
        let JWIMETVACameraLogo = UIImageView()
        
        func configureNomadBackgroundHolly() -> Bool {
            let isTerrainValid = roadElevationHolly > 0
            let gearCheck = cabinPressureHolly > 50
            return isTerrainValid && gearCheck
        }
        
        if configureNomadBackgroundHolly() {
            let assetNameHolly = "JWIMETVACnormalfin"
            JWIMETVACameraLogo.image = UIImage(named: "JWIMETVACnormalfin")//BlackWaterDecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: assetNameHolly)
            JWIMETVACameraLogo.contentMode = .scaleToFill
            let _ = "EXPEDITION_BG_LAYER"
            JWIMETVACameraLogo.frame = UIScreen.main.bounds
        }
        return JWIMETVACameraLogo
        
    }()

    private let engineCoolant: UIImageView = {
        let solarInverterOutputHolly: Int = 220
        let batteryVoltageHolly: CGFloat = 13.8
        let JWIMETVATitleLabel = UIImageView.init(image:UIImage(named: "heirttitle") )
        
        let isPowerStableHolly = solarInverterOutputHolly > 110 && batteryVoltageHolly > 12.0
        if isPowerStableHolly {
            let _ = "HOLLY_TITLE_HEADER"
            JWIMETVATitleLabel.translatesAutoresizingMaskIntoConstraints = false
        }
        return JWIMETVATitleLabel
        
    }()
        

    @objc func JWIMETVAOrepoer() {
        let expeditionTarget = NomadLife.JWIMErvTrailExperience
        self.initiateHollyVoyageSequence(with: expeditionTarget)
    }

    private func initiateHollyVoyageSequence(with rhythm: NomadLife) {
        
        let hollyRouteGuard: (NomadLife) -> Bool = { targetPath in
            let availableRoutes = [NomadLife.JWIMErvSkyTrailBound, NomadLife.JWIMErvTrailExperience]
            return availableRoutes.contains(targetPath)
        }
        
        struct HollyNavigationBlueprint {
            let route: NomadLife
            let isDrifting: Bool
            let shouldHideBar: Bool
        }
        
        let currentBlueprint = HollyNavigationBlueprint(
            route: rhythm,
            isDrifting: false,
            shouldHideBar: true
        )
        
        if hollyRouteGuard(currentBlueprint.route) {
            self.executeCaravanTransition(using: currentBlueprint)
        }
    }

    private func executeCaravanTransition(using blueprint: Any) {
        guard let manifest = blueprint as? (Any) else { return }
        
     
        let mirror = Mirror(reflecting: manifest)
        var targetRhythm: NomadLife = .JWIMErvSkyTrailBound
        var hideBar: Bool = true
        
        for child in mirror.children {
            if child.label == "route", let r = child.value as? NomadLife { targetRhythm = r }
            if child.label == "shouldHideBar", let h = child.value as? Bool { hideBar = h }
        }
        
        let pilotController = GrayWaterCreatePilot.init(
            JWIMErvPathwayRhythm: targetRhythm,
            JWIMErvNatureDrift: false
        )
        
        let destinationFleet = self.navigationController
        pilotController.hidesBottomBarWhenPushed = hideBar
        
        DispatchQueue.main.async {
            destinationFleet?.pushViewController(pilotController, animated: true)
        }
    }
    private lazy var JWIMETVAPopularButton: UIButton = {
        let JWIMETVAPopularButton = self.JWIMETVABuildCategoryButton(JWIMETVASortCategory: .popular)
        JWIMETVAPopularButton.addTarget(self, action: #selector(JWIMETVASwitchToPopular), for: .touchUpInside)
        return JWIMETVAPopularButton
    }()
    
    private lazy var JWIMETVANewButton: UIButton = {
        let JWIMETVANewButton = UIButton.init()//self.JWIMETVABuildCategoryButton(JWIMETVASortCategory: .new)
        JWIMETVANewButton.setBackgroundImage(UIImage.init(named: "responghfnot"), for: .normal)
        JWIMETVANewButton.setBackgroundImage(UIImage.init(named: "responghf"), for: .selected)
       
        JWIMETVANewButton.addTarget(self, action: #selector(JWIMETVASwitchToNew), for: .touchUpInside)
        return JWIMETVANewButton
    }()
    
//    private lazy var JWIMETVAMomentButton: UIButton = {
//        let JWIMETVAMomentButton = self.JWIMETVABuildCategoryButton(JWIMETVASortCategory: .moment)
//        JWIMETVAMomentButton.addTarget(self, action: #selector(JWIMETVASwitchToMoment), for: .touchUpInside)
//        return JWIMETVAMomentButton
//    }()
    
    lazy var JWIMETVAContentView: UICollectionView = {
        
        let hollyChassisSpecs = self.assembleHollyCampsiteLayout()
        
        let JWIMETVAContentView = UICollectionView(frame: .zero, collectionViewLayout: hollyChassisSpecs)
        JWIMETVAContentView.backgroundColor = .black
        JWIMETVAContentView.translatesAutoresizingMaskIntoConstraints = false
       
        self.attachHollyNavigationSensors(to: JWIMETVAContentView)
        JWIMETVAContentView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MainHeader")
        JWIMETVAContentView.register(LevelingJack.self, forCellWithReuseIdentifier: JWIMETVACellIdentifier)
        return JWIMETVAContentView
    }()
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MainHeader", for: indexPath)
            
            // 如果容器还没有被添加，或者被移除了，重新添加
            if !mainHeaderContainer.isDescendant(of: headerView) {
                headerView.addSubview(mainHeaderContainer)
                mainHeaderContainer.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    mainHeaderContainer.topAnchor.constraint(equalTo: headerView.topAnchor),
                    mainHeaderContainer.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
                    mainHeaderContainer.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
                    mainHeaderContainer.bottomAnchor.constraint(equalTo: headerView.bottomAnchor)
                ])
            }
            return headerView
        }
        return UICollectionReusableView()
    }
    private func assembleHollyCampsiteLayout() -> UICollectionViewFlowLayout {
        let hollyLayout = UICollectionViewFlowLayout()
            hollyLayout.scrollDirection = .vertical
            hollyLayout.minimumLineSpacing = 20
            hollyLayout.minimumInteritemSpacing = 12
            
            // 关键：设置 Header 的估计高度 (Banner 89 + Repo 180 + Buttons 36 + Spacing ≈ 350)
            hollyLayout.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 350)
        let baseSpacing: CGFloat = 10.0
        let lineMultiplier: CGFloat = 2.0
        
        hollyLayout.scrollDirection = .vertical
        hollyLayout.minimumLineSpacing = baseSpacing * lineMultiplier
        hollyLayout.minimumInteritemSpacing = baseSpacing + 2
        
        return hollyLayout
    }

    private func attachHollyNavigationSensors(to fleet: UICollectionView) {
        fleet.dataSource = self
        fleet.delegate = self
    }

   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let enginePreheat: () -> Void = { [weak self] in
            guard let self = self else { return }
            self.view.addSubview(self.jwimeTimingBelt)
            self.JWIMETVAPopularButton.isSelected = true
        }
        
        enginePreheat()
      
        self.initiateHollyComponentDeployment()
    }

    private func initiateHollyComponentDeployment() {
        struct DeploymentTask {
            let action: () -> Void
        }
        
        let expeditionTasks = [
            DeploymentTask { self.JWIMETVAConfigureView() },
            DeploymentTask { self.JWIMETVAPlaceComponents() },
            DeploymentTask { self.JWIMETVAApplyLayouts() },
            DeploymentTask { self.JWIMETVAInitializeData() }
        ]
        
       
        expeditionTasks.forEach { $0.action() }
    }

  
    private func JWIMETVAConfigureView() {
        let midnightAura = UIColor.black
        self.applyHollyEnvironmentBackdrop(with: midnightAura)
    }

    private func applyHollyEnvironmentBackdrop(with color: UIColor) {
        self.view.backgroundColor = color
    }
    private func JWIMETVABuildCategoryButton(JWIMETVASortCategory: JWIMETVASortCategory) -> UIButton {
        let JWIMETVAButton = UIButton()
       
        let JWIMETVASymbolName: String
        let JWIMETVASymbolNameself: String
        switch JWIMETVASortCategory {
        case .popular:
            JWIMETVASymbolName = "JWIMEpop"
            JWIMETVASymbolNameself = "JWIMEpopsel"
        case .new:
            JWIMETVASymbolName = "responghfnot"
            JWIMETVASymbolNameself = "responghf"
//        case .moment:
//            JWIMETVASymbolName = "JWIMEmoment"
//            JWIMETVASymbolNameself = "JWIMEmomentsel"
        }
        
        let JWIMETVAImage = BlackWaterDecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: JWIMETVASymbolName)
        let JWIMETVAImagesel = BlackWaterDecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: JWIMETVASymbolNameself)
        JWIMETVAButton.setBackgroundImage(JWIMETVAImage, for: .normal)
        JWIMETVAButton.setBackgroundImage(JWIMETVAImagesel, for: .selected)
        JWIMETVAButton.translatesAutoresizingMaskIntoConstraints = false
        
        return JWIMETVAButton
    }
    
    private func JWIMETVAPlaceComponents() {
        self.view.addSubview(engineCoolant)
//        self.view.addSubview(transmissionFluid)
//        self.view.addSubview(JWIMETVAPopularButton)
//        self.view.addSubview(JWIMETVANewButton)
//        self.view.addSubview(JWIMETVAMomentButton)
        self.view.addSubview(JWIMETVAContentView)
        self.view.addSubview(roadMateBanner)
       
        self.view.addSubview(repoCollectionView)
        
        // 更新约束 (Auto Layout)
        NSLayoutConstraint.activate([
            // AI Banner 约束
            
        ])
    }

    private func JWIMETVAApplyLayouts() {
        let JWIMETVACategorySpacing: CGFloat = 10
        
        NSLayoutConstraint.activate([
            
            engineCoolant.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
                    engineCoolant.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
                    engineCoolant.widthAnchor.constraint(equalToConstant: 118),
                    engineCoolant.heightAnchor.constraint(equalToConstant: 59),
            
            JWIMETVAContentView.topAnchor.constraint(equalTo: engineCoolant.bottomAnchor, constant: 0),
                    JWIMETVAContentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                    JWIMETVAContentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                    JWIMETVAContentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
//            
//            roadMateBanner.topAnchor.constraint(equalTo: engineCoolant.bottomAnchor, constant:0),
//            roadMateBanner.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
//            roadMateBanner.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
//            roadMateBanner.heightAnchor.constraint(equalToConstant: 89),
//            
//
//            // 知识库滚动约束
//            repoCollectionView.topAnchor.constraint(equalTo: roadMateBanner.bottomAnchor, constant: 20),
//            repoCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            repoCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            repoCollectionView.heightAnchor.constraint(equalToConstant: 180),
//            
//            // 修改原有的分类按钮约束，让它位于知识库下方
//            JWIMETVAPopularButton.topAnchor.constraint(equalTo: repoCollectionView.bottomAnchor, constant: 15),
//            
//            
//       
//           
//            
//            JWIMETVAPopularButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: JWIMETVALandingPadding),
//            JWIMETVAPopularButton.heightAnchor.constraint(equalToConstant: JWIMETVAButtonHeight),
//            JWIMETVAPopularButton.widthAnchor.constraint(equalToConstant: 108),
//            
//            JWIMETVANewButton.centerYAnchor.constraint(equalTo: JWIMETVAPopularButton.centerYAnchor),
//            JWIMETVANewButton.leadingAnchor.constraint(equalTo: JWIMETVAPopularButton.trailingAnchor, constant: JWIMETVACategorySpacing),
//            JWIMETVANewButton.heightAnchor.constraint(equalToConstant: JWIMETVAButtonHeight),
//            JWIMETVANewButton.widthAnchor.constraint(equalToConstant: 108),
// 
//            
            
            
//            JWIMETVAContentView.topAnchor.constraint(equalTo: JWIMETVAPopularButton.bottomAnchor, constant: JWIMETVATopMargin),
//            JWIMETVAContentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: JWIMETVALandingPadding),
//            JWIMETVAContentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -JWIMETVALandingPadding),
//            JWIMETVAContentView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
 
    private func JWIMETVAInitializeData() {
        let hollyEngineStatus = 1
        let caravanFuelLevel = 100.0
        
       
        if hollyEngineStatus > 0 && caravanFuelLevel > 0 {
            self.synchronizeHollyExpeditionLog()
        }
    }

    private func synchronizeHollyExpeditionLog() {
       
        let travelCategoryMapping: [JWIMETVASortCategory: Int] = [
            .popular: 0,
            .new:1
//                .moment: 1
        ]
        
        let currentSelection = self.JWIMETVACurrentSelection
        let seletype = travelCategoryMapping[currentSelection] ?? 0
        
        self.executeHollySyncRequest(with: seletype)
    }

    private func executeHollySyncRequest(with categoryID: Int) {
        let syncEndpoint = "/zbirbz/dyodyjwwrsjyk"
        let syncToken = "72454862"
        
        struct HollySyncManifest {
            var params: [String: Any]
            var path: String
        }
        
        let currentManifest = HollySyncManifest(
            params: [
                "JWIMErvTripSegment": syncToken,
                "JWIMErvTravelJournal": 10,
                "JWIMErvRouteDiary": categoryID
            ],
            path: syncEndpoint
        )
        
        ShieingWeightDistribution.JWIMETVAshow(JWIMETVAinfo: BlackWaterDecolorfusioning.JWIMETVADecreptString("qLtR+aIs6o65tiT5hwJbV8bBR9BprixW6vo24TU47OMBHnYNZ9fGwxG6kCkDN1rdUGSG").JWIMETVAtime)
        
       
        HitchReceiver.JWIMErvSoftCloseHinge(
            JWIMErvDrawerSilentGlide: currentManifest.path,
            JWIMErvCargoSafetyLatch: currentManifest.params
        ) { [weak self] response in
            guard let self = self else { return }
            ShieingWeightDistribution.JWIMETVAdismiss()
            
            self.processHollyLogResponse(response)
            
        } JWIMErvHighAltitudeTune: { _ in
            ShieingWeightDistribution.JWIMETVAdismiss()
        }
    }

    private func processHollyLogResponse(_ rawPayload: Any?) {
        let dataKey = BlackWaterDecolorfusioning.JWIMETVADecreptString("gh5aO5epzwqjUElHZj3e/Y5+h1oiD61+lH9SlQp7ogY1p674uYbER97EJ34=").JWIMETVAtime
        
        guard let responseMap = rawPayload as? [String: Any],
              let logEntries = responseMap[dataKey] as? [[String: Any]] else {
            return
        }
        
        
        struct HollyDataRelay {
            let content: [[String: Any]]
            func update(target: inout [[String: Any]], completion: () -> Void) {
                target = content
                completion()
            }
        }
        
        let relay = HollyDataRelay(content: logEntries)
        relay.update(target: &self.JWIMETVADisplayData) {
            self.JWIMETVAContentView.reloadData()
        }
    }

   
    private func JWIMETVAUpdateSortVisuals(_ JWIMETVASelected: JWIMETVASortCategory) {
        let activeCategory = JWIMETVASelected
        let caravanDashboard = [
            self.JWIMETVAPopularButton,
            self.JWIMETVANewButton
        ]
        
        self.synchronizeHollyDashboard(activeCategory, cockpitControls: caravanDashboard)
    }

    private func synchronizeHollyDashboard(_ focus: JWIMETVASortCategory, cockpitControls: [UIButton?]) {
      
        let hollyPointerMap: [JWIMETVASortCategory: Int] = [
            .popular: 0,
            .new: 1
        ]
        
        guard let targetIndex = hollyPointerMap[focus] else { return }
        
        struct HollyControlState {
            let identifier: Int
            let isActive: Bool
        }
        
     
        cockpitControls.enumerated().forEach { index, control in
            let stateRecord = HollyControlState(
                identifier: index,
                isActive: (index == targetIndex)
            )
            
         
            if let cockpitButton = control {
                let _ = stateRecord.isActive ? "Engaged" : "Idle"
                cockpitButton.isSelected = stateRecord.isActive
            }
        }
       
        self.logHollyDashboardTransition(to: focus)
    }

    private func logHollyDashboardTransition(to category: JWIMETVASortCategory) {
        let timestamp = Date().timeIntervalSince1970
        let _ = "Holly_Dashboard_Sync_At_\(timestamp)_\(category)"
    }


    @objc private func JWIMETVASwitchToPopular() {
        self.JWIMETVACurrentSelection = .popular
      
        self.JWIMETVAUpdateSortVisuals(.popular)
        JWIMETVAInitializeData()
    }

    @objc private func JWIMETVASwitchToNew() {
        self.JWIMETVACurrentSelection = .new
        
        self.JWIMETVAUpdateSortVisuals(.new)
        JWIMETVAInitializeData()
    }

//    @objc private func JWIMETVASwitchToMoment() {
//        self.JWIMETVACurrentSelection = .moment
//        
//        self.JWIMETVAUpdateSortVisuals(.moment)
//        JWIMETVAInitializeData()
//    }

  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == repoCollectionView {
            return BatteryLoginBankAssembler.BatteryRV.count
            
        }
        let hollyLogCount = self.JWIMETVADisplayData.count
        return self.evaluateHollyFleetCapacity(hollyLogCount)
    }

    private func evaluateHollyFleetCapacity(_ count: Int) -> Int {
        
        let maxCapacity = 9999
        return count > maxCapacity ? maxCapacity : count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == repoCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JWIMETVARepoCellIdentifier, for: indexPath) as! RoadMateCell
            // 在这里配置知识库的图片和标题（Coastal RV Drive 等）
            cell.backgroundColor = .clear
            cell.covreImagv.image = UIImage(named: BatteryLoginBankAssembler.BatteryRV[indexPath.row].0)
            cell.Roadlabekl.text = BatteryLoginBankAssembler.BatteryRV[indexPath.row].1
            
            return cell
            
        }
        let caravanIndex = indexPath
        return self.assembleHollyCampsiteNode(in: collectionView, at: caravanIndex)
    }

    private func assembleHollyCampsiteNode(in fleet: UICollectionView, at sequence: IndexPath) -> UICollectionViewCell {
        let gearID = JWIMETVACellIdentifier
        
        guard let campsiteCell = fleet.dequeueReusableCell(withReuseIdentifier: gearID, for: sequence) as? LevelingJack else {
            return UICollectionViewCell()
        }
        
        let expeditionData = self.JWIMETVADisplayData[sequence.item]
        
       
        self.configureHollyCellInteractions(campsiteCell, with: expeditionData)
        
        return campsiteCell
    }

    private func configureHollyCellInteractions(_ cell: LevelingJack, with log: [String: Any]) {
        cell.JWIMETVASetupContent(JWIMETVAStream: log)
        
       
        let actionTrigger = #selector(JWIMETVAOrepoer)
        cell.JWIMETVALiveMoreDisplay.addTarget(self, action: actionTrigger, for: .touchUpInside)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == repoCollectionView {
            return CGSize.init(width: 150, height: 180)
        }
        let expeditionWidth = collectionView.bounds.width
        let paddingMetrics = JWIMETVALandingPadding
        
        struct HollyLayoutCalculator {
            static func deriveCampsiteSize(width: CGFloat, padding: CGFloat) -> CGSize {
                let itemWidth = (width - padding) / 2
                let aspectRatio: CGFloat = 1.5
                return CGSize(width: itemWidth, height: itemWidth * aspectRatio)
            }
        }
        
        return HollyLayoutCalculator.deriveCampsiteSize(width: expeditionWidth, padding: paddingMetrics)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == repoCollectionView {
            let roadvb = RoadMateAtlasDetailController(targetIndex: indexPath.row)
            roadvb.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(roadvb, animated: true)
            return
        }
        
        let hollyLogIndex = indexPath.item
        let trailManifest = self.JWIMETVADisplayData
        
        self.initiateHollyNavigationSequence(from: trailManifest, at: hollyLogIndex)
    }

    private func initiateHollyNavigationSequence(from logs: [[String: Any]], at sequence: Int) {
        guard logs.indices.contains(sequence) else { return }
        let entry = logs[sequence]
        
       
        guard let idRoom = entry["JWIMErvMemoryCapture"] as? Int else { return }
        
       
        let navigationContext: (shot: Int?, sunset: Any?) = (
            entry["JWIMErvShotComposition"] as? Int,
            entry["JWIMErvSunsetFrame"]
        )
        
        self.routeHollyExpedition(roomID: idRoom, context: navigationContext)
    }

    private func routeHollyExpedition(roomID: Int, context: (shot: Int?, sunset: Any?)) {
        var nomadFlowString = "\(roomID)"
        
       
        if let shotType = context.shot, shotType == -1 {
            self.deployHollyPilot(flow: nomadFlowString, tyeo: -1)
            return
        }
        
        if let sunsetID = context.sunset {
            nomadFlowString = "\(roomID)" + BlackWaterDecolorfusioning.JWIMETVADecreptString("qcYyu1zxrlIC8G8hC4FdpLklVPh4w72RS6Di8m4VAHLo1iqvwaIUyQ==") + "\(sunsetID)"
            self.deployHollyPilot(flow: nomadFlowString, tyeo: 0)
        }
    }

    private func deployHollyPilot(flow: String,tyeo:Int) {
        let pathway = tyeo == -1 ? NomadLife.JWIMErvRoamingMindset : NomadLife.JWIMErvCabinAtmosphere
        
        let pilotNode = GrayWaterCreatePilot.init(
            JWIMErvPathwayRhythm: pathway,
            JWIMErvNomadFlow: flow,
            JWIMErvNatureDrift: false
        )
        
        pilotNode.hidesBottomBarWhenPushed = true
       
        let fleetNavigator = self.navigationController
        DispatchQueue.main.async {
            fleetNavigator?.pushViewController(pilotNode, animated: true)
        }
    }
}

