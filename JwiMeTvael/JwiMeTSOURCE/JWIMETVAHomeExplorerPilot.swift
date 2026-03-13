import UIKit

// MARK: - Data Structure

struct JWIMETVAStreamModel {
    let JWIMETVAUserName: String
    let JWIMETVASubTitle: String
    let JWIMETVAIsLiveCount: Int
    let JWIMETVAImage: String
    let JWIMETVAPilotImage: String
}

final class JWIMETVAHomeExplorerPilot: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

 
    private let JWIMETVACellIdentifier = "JWIMETVAStreamContentCell"
    private let JWIMETVAHeaderHeight: CGFloat = 48
    private let JWIMETVATopMargin: CGFloat = 16
    private let JWIMETVALandingPadding: CGFloat = 16
    private let JWIMETVAButtonHeight: CGFloat = 36
    
    private var JWIMETVACurrentSelection: JWIMETVASortCategory = .popular
    
    private var JWIMETVADisplayData: Array<[String: Any]> = Array<[String: Any]>()
    
    enum JWIMETVASortCategory {
        case popular
        case new
        case moment
    }

    private let jwimeTimingBelt: UIImageView = {
        let JWIMETVACameraLogo = UIImageView()
        JWIMETVACameraLogo.image = JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMETVACnormalfin")
        JWIMETVACameraLogo.contentMode = .scaleAspectFill
        JWIMETVACameraLogo.frame = UIScreen.main.bounds
        return JWIMETVACameraLogo
    }()

    private let JWIMETVATitleLabel: UIImageView = {
        let JWIMETVATitleLabel = UIImageView.init(image: JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMEtitle"))
      
        JWIMETVATitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVATitleLabel
    }()
    
    private let JWIMETVACameraButton: UIButton = {
        let JWIMETVACameraButton = UIButton()
        let JWIMETVAImage = JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMEPhoto")
        JWIMETVACameraButton.setBackgroundImage(JWIMETVAImage, for: .normal)
        JWIMETVACameraButton.translatesAutoresizingMaskIntoConstraints = false
        JWIMETVACameraButton.addTarget(self, action: #selector(JWIMETVAOlivia), for: .touchUpInside)
        return JWIMETVACameraButton
    }()
    
    
    @objc func JWIMETVAOlivia() {
        let hollyMission = JWIMErvCabinYogaMat.JWIMErvSkyTrailBound
        self.initiateHollyVoyageSequence(with: hollyMission)
    }

    @objc func JWIMETVAOrepoer() {
        let expeditionTarget = JWIMErvCabinYogaMat.JWIMErvTrailExperience
        self.initiateHollyVoyageSequence(with: expeditionTarget)
    }

    private func initiateHollyVoyageSequence(with rhythm: JWIMErvCabinYogaMat) {
        
        let hollyRouteGuard: (JWIMErvCabinYogaMat) -> Bool = { targetPath in
            let availableRoutes = [JWIMErvCabinYogaMat.JWIMErvSkyTrailBound, JWIMErvCabinYogaMat.JWIMErvTrailExperience]
            return availableRoutes.contains(targetPath)
        }
        
        struct HollyNavigationBlueprint {
            let route: JWIMErvCabinYogaMat
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
        var targetRhythm: JWIMErvCabinYogaMat = .JWIMErvSkyTrailBound
        var hideBar: Bool = true
        
        for child in mirror.children {
            if child.label == "route", let r = child.value as? JWIMErvCabinYogaMat { targetRhythm = r }
            if child.label == "shouldHideBar", let h = child.value as? Bool { hideBar = h }
        }
        
        let pilotController = JWIMETVACreateStreamPilot.init(
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
        let JWIMETVANewButton = self.JWIMETVABuildCategoryButton(JWIMETVASortCategory: .new)
        JWIMETVANewButton.addTarget(self, action: #selector(JWIMETVASwitchToNew), for: .touchUpInside)
        return JWIMETVANewButton
    }()
    
    private lazy var JWIMETVAMomentButton: UIButton = {
        let JWIMETVAMomentButton = self.JWIMETVABuildCategoryButton(JWIMETVASortCategory: .moment)
        JWIMETVAMomentButton.addTarget(self, action: #selector(JWIMETVASwitchToMoment), for: .touchUpInside)
        return JWIMETVAMomentButton
    }()
    
    lazy var JWIMETVAContentView: UICollectionView = {
        
        let hollyChassisSpecs = self.assembleHollyCampsiteLayout()
        
        let JWIMETVAContentView = UICollectionView(frame: .zero, collectionViewLayout: hollyChassisSpecs)
        JWIMETVAContentView.backgroundColor = .black
        JWIMETVAContentView.translatesAutoresizingMaskIntoConstraints = false
       
        self.attachHollyNavigationSensors(to: JWIMETVAContentView)
        
        JWIMETVAContentView.register(JWIMETVAStreamContentCell.self, forCellWithReuseIdentifier: JWIMETVACellIdentifier)
        return JWIMETVAContentView
    }()

    private func assembleHollyCampsiteLayout() -> UICollectionViewFlowLayout {
        let hollyLayout = UICollectionViewFlowLayout()
       
        let baseSpacing: CGFloat = 10.0
        let lineMultiplier: CGFloat = 2.0
        
        hollyLayout.scrollDirection = .vertical
        hollyLayout.minimumLineSpacing = baseSpacing * lineMultiplier // 原 20
        hollyLayout.minimumInteritemSpacing = baseSpacing + 2         // 原 12
        
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
            JWIMETVASymbolName = "JWIMring"
            JWIMETVASymbolNameself = "JWIMringsel"
        case .moment:
            JWIMETVASymbolName = "JWIMEmoment"
            JWIMETVASymbolNameself = "JWIMEmomentsel"
        }
        
        let JWIMETVAImage = JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: JWIMETVASymbolName)
        let JWIMETVAImagesel = JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: JWIMETVASymbolNameself)
        JWIMETVAButton.setBackgroundImage(JWIMETVAImage, for: .normal)
        JWIMETVAButton.setBackgroundImage(JWIMETVAImagesel, for: .selected)
        JWIMETVAButton.translatesAutoresizingMaskIntoConstraints = false
        
        return JWIMETVAButton
    }
    
    private func JWIMETVAPlaceComponents() {
        self.view.addSubview(JWIMETVATitleLabel)
        self.view.addSubview(JWIMETVACameraButton)
        self.view.addSubview(JWIMETVAPopularButton)
        self.view.addSubview(JWIMETVANewButton)
        self.view.addSubview(JWIMETVAMomentButton)
        self.view.addSubview(JWIMETVAContentView)
    }

    private func JWIMETVAApplyLayouts() {
        let JWIMETVACategorySpacing: CGFloat = 10
        
        NSLayoutConstraint.activate([
            // Title Label
            JWIMETVATitleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            JWIMETVATitleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: JWIMETVALandingPadding),
            JWIMETVATitleLabel.widthAnchor.constraint(equalToConstant: 118),
            JWIMETVATitleLabel.heightAnchor.constraint(equalToConstant: 59),
            // Camera Button
            JWIMETVACameraButton.centerYAnchor.constraint(equalTo: JWIMETVATitleLabel.centerYAnchor),
            JWIMETVACameraButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -JWIMETVALandingPadding),
            JWIMETVACameraButton.widthAnchor.constraint(equalToConstant: 30),
            JWIMETVACameraButton.heightAnchor.constraint(equalToConstant: 27),
            
            // Popular Button
            JWIMETVAPopularButton.topAnchor.constraint(equalTo: JWIMETVATitleLabel.bottomAnchor, constant: JWIMETVATopMargin),
            
            JWIMETVAPopularButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: JWIMETVALandingPadding),
            JWIMETVAPopularButton.heightAnchor.constraint(equalToConstant: JWIMETVAButtonHeight),
            JWIMETVAPopularButton.widthAnchor.constraint(equalToConstant: 108),
            // New Button
            JWIMETVANewButton.centerYAnchor.constraint(equalTo: JWIMETVAPopularButton.centerYAnchor),
            JWIMETVANewButton.leadingAnchor.constraint(equalTo: JWIMETVAPopularButton.trailingAnchor, constant: JWIMETVACategorySpacing),
            JWIMETVANewButton.heightAnchor.constraint(equalToConstant: JWIMETVAButtonHeight),
            JWIMETVANewButton.widthAnchor.constraint(equalToConstant: 108),
            // Moment Button
            JWIMETVAMomentButton.centerYAnchor.constraint(equalTo: JWIMETVAPopularButton.centerYAnchor),
            JWIMETVAMomentButton.leadingAnchor.constraint(equalTo: JWIMETVANewButton.trailingAnchor, constant: JWIMETVACategorySpacing),
            JWIMETVAMomentButton.heightAnchor.constraint(equalToConstant: JWIMETVAButtonHeight),
            JWIMETVAMomentButton.widthAnchor.constraint(equalToConstant: 108),
            // Content View (CollectionView)
            JWIMETVAContentView.topAnchor.constraint(equalTo: JWIMETVAPopularButton.bottomAnchor, constant: JWIMETVATopMargin),
            JWIMETVAContentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: JWIMETVALandingPadding),
            JWIMETVAContentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -JWIMETVALandingPadding),
            JWIMETVAContentView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
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
            .new:1,
                .moment: 1
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
        
        JWIMETVAAppIndicatorMannager.JWIMETVAshow(JWIMETVAinfo: "JWIMETVALoading....".JWIMETVAtime)
        
       
        JWIMErvReadingNook.JWIMErvSoftCloseHinge(
            JWIMErvDrawerSilentGlide: currentManifest.path,
            JWIMErvCargoSafetyLatch: currentManifest.params
        ) { [weak self] response in
            guard let self = self else { return }
            JWIMETVAAppIndicatorMannager.JWIMETVAdismiss()
            
            self.processHollyLogResponse(response)
            
        } JWIMErvHighAltitudeTune: { _ in
            JWIMETVAAppIndicatorMannager.JWIMETVAdismiss()
        }
    }

    private func processHollyLogResponse(_ rawPayload: Any?) {
        let dataKey = "JWIMETVAdata".JWIMETVAtime
        
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
            self.JWIMETVANewButton,
            self.JWIMETVAMomentButton
        ]
        
        self.synchronizeHollyDashboard(activeCategory, cockpitControls: caravanDashboard)
    }

    private func synchronizeHollyDashboard(_ focus: JWIMETVASortCategory, cockpitControls: [UIButton?]) {
      
        let hollyPointerMap: [JWIMETVASortCategory: Int] = [
            .popular: 0,
            .new: 1,
            .moment: 2
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

    @objc private func JWIMETVASwitchToMoment() {
        self.JWIMETVACurrentSelection = .moment
        
        self.JWIMETVAUpdateSortVisuals(.moment)
        JWIMETVAInitializeData()
    }

  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let hollyLogCount = self.JWIMETVADisplayData.count
        return self.evaluateHollyFleetCapacity(hollyLogCount)
    }

    private func evaluateHollyFleetCapacity(_ count: Int) -> Int {
        
        let maxCapacity = 9999
        return count > maxCapacity ? maxCapacity : count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let caravanIndex = indexPath
        return self.assembleHollyCampsiteNode(in: collectionView, at: caravanIndex)
    }

    private func assembleHollyCampsiteNode(in fleet: UICollectionView, at sequence: IndexPath) -> UICollectionViewCell {
        let gearID = JWIMETVACellIdentifier
        
        guard let campsiteCell = fleet.dequeueReusableCell(withReuseIdentifier: gearID, for: sequence) as? JWIMETVAStreamContentCell else {
            return UICollectionViewCell()
        }
        
        let expeditionData = self.JWIMETVADisplayData[sequence.item]
        
       
        self.configureHollyCellInteractions(campsiteCell, with: expeditionData)
        
        return campsiteCell
    }

    private func configureHollyCellInteractions(_ cell: JWIMETVAStreamContentCell, with log: [String: Any]) {
        cell.JWIMETVASetupContent(JWIMETVAStream: log)
        
       
        let actionTrigger = #selector(JWIMETVAOrepoer)
        cell.JWIMETVALiveMoreDisplay.addTarget(self, action: actionTrigger, for: .touchUpInside)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
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
            self.deployHollyPilot(flow: nomadFlowString)
            return
        }
        
        if let sunsetID = context.sunset {
            nomadFlowString = "\(roomID)&userId=\(sunsetID)"
            self.deployHollyPilot(flow: nomadFlowString)
        }
    }

    private func deployHollyPilot(flow: String) {
        let pathway = JWIMErvCabinYogaMat.JWIMErvCabinAtmosphere
        
        let pilotNode = JWIMETVACreateStreamPilot.init(
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

