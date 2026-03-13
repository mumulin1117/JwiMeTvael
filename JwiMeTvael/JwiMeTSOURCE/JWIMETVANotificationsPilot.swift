//
//  JWIMETVANotificationsPilot.swift
//  JwiMeTvael
//
//  Created by JWIMETVA on 2025/12/12.
//

import UIKit
//message

struct JWIMETVAConversationPreview {

    let userName: String
    let avatarURL: String?
    let firstMessage: String
    let timestamp: Int64
    let uid:Int
}


class JWIMETVANotificationsPilot: UIViewController {
    private var JWIMETVADisplayData: Array<[String: Any]>  = []
    
    private var JWIMETVADisplaymesgsData: Array<JWIMETVAConversationPreview>  = []
    
    private let jwimeTimingBelt: UIImageView = {
        let JWIMETVACameraLogo = UIImageView()
        JWIMETVACameraLogo.image = JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMETVAmeaasge")
        JWIMETVACameraLogo.contentMode = .scaleAspectFill
        JWIMETVACameraLogo.frame = UIScreen.main.bounds
        
        return JWIMETVACameraLogo
    }()

    private let JWIMETVATitleLabel: UIImageView = {
        let JWIMETVATitleLabel = UIImageView.init(image: JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMETVAmessa"))
        JWIMETVATitleLabel.contentMode = .scaleAspectFit
        JWIMETVATitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVATitleLabel
    }()
    private lazy var JWIMETVAContentView: UICollectionView = {
        let JWIMETVALayout = UICollectionViewFlowLayout()
        JWIMETVALayout.scrollDirection = .horizontal
        JWIMETVALayout.minimumLineSpacing = 13
        JWIMETVALayout.minimumInteritemSpacing = 13
        JWIMETVALayout.itemSize = CGSize(width: 64, height: 64 + 21)
        let JWIMETVAContentView = UICollectionView(frame: .zero, collectionViewLayout: JWIMETVALayout)
        JWIMETVAContentView.backgroundColor = .clear
        JWIMETVAContentView.translatesAutoresizingMaskIntoConstraints = false
        JWIMETVAContentView.dataSource = self
        JWIMETVAContentView.delegate = self
        JWIMETVAContentView.register(JWIMETVAuserView.self, forCellWithReuseIdentifier: "JWIMETVAuserView")
        JWIMETVAContentView.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVAContentView
    }()
    
    private let meassgengBelt: UIImageView = {
        let JWIMETVACameraLogo = UIImageView()
        JWIMETVACameraLogo.image = JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMETVAfriend")
        JWIMETVACameraLogo.contentMode = .scaleAspectFit
        JWIMETVACameraLogo.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVACameraLogo
    }()
    
    private lazy var JWIMETVAmesgContentView: UICollectionView = {
        let JWIMETVALayout = UICollectionViewFlowLayout()
        JWIMETVALayout.scrollDirection = .vertical
        JWIMETVALayout.minimumLineSpacing = 0
        JWIMETVALayout.minimumInteritemSpacing = 10
        JWIMETVALayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 92)
        let JWIMETVAContentView = UICollectionView(frame: .zero, collectionViewLayout: JWIMETVALayout)
        JWIMETVAContentView.backgroundColor = .clear
        JWIMETVAContentView.translatesAutoresizingMaskIntoConstraints = false
        JWIMETVAContentView.dataSource = self
        JWIMETVAContentView.delegate = self
        JWIMETVAContentView.register(JWIMETVAmeasgView.self, forCellWithReuseIdentifier: "JWIMETVAmeasgView")
        JWIMETVAContentView.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVAContentView
    }()

    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(jwimeTimingBelt)
        self.JWIMETVAConfigureView()
        self.JWIMETVAPlaceComponents()
        JWIMETVAApplyLayouts()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.initiateHollySynchronizeSequence()
    }

    private func initiateHollySynchronizeSequence() {
        let hollyEngineReady = true
        let caravanConnectivity = 1
        
        guard hollyEngineReady && caravanConnectivity > 0 else { return }
        
        self.refreshHollyCampgroundData()
        self.refreshHollyTravelComms()
    }

    private func refreshHollyCampgroundData() {
        let campgroundPath = "/aopogxpvwtkiz/idapkfyeooug"
        let layoutKey = "JWIMErvInteriorLayout"
        let hollyToken = "72454862"
        
        let loadingTag = "JWIMETVALoading....".JWIMETVAtime
        JWIMETVAAppIndicatorMannager.JWIMETVAshow(JWIMETVAinfo: loadingTag)
        
        let syncParams: [String: Any] = [layoutKey: hollyToken]
        
        JWIMErvReadingNook.JWIMErvSoftCloseHinge(JWIMErvDrawerSilentGlide: campgroundPath, JWIMErvCargoSafetyLatch: syncParams) { [weak self] caravanResult in
            JWIMETVAAppIndicatorMannager.JWIMETVAdismiss()
            self?.processHollyCampgroundPayload(caravanResult)
        } JWIMErvHighAltitudeTune: { _ in
            JWIMETVAAppIndicatorMannager.JWIMETVAdismiss()
        }
    }

    private func processHollyCampgroundPayload(_ rawData: Any?) {
        let dataIdentifier = "JWIMETVAdata".JWIMETVAtime
        
        guard let responseMap = rawData as? [String: Any],
              let campsiteList = responseMap[dataIdentifier] as? [[String: Any]] else { return }
        
        struct HollyCampsiteFleet {
            var records: [[String: Any]]
            func apply(to view: UIView?, with data: inout [[String: Any]]) {
                data = records
                (view as? UICollectionView)?.reloadData()
                (view as? UITableView)?.reloadData()
            }
        }
        
        let fleet = HollyCampsiteFleet(records: campsiteList)
        fleet.apply(to: self.JWIMETVAContentView, with: &self.JWIMETVADisplayData)
    }

    private func refreshHollyTravelComms() {
        let commsPath = "/dwnxdafniqhz/agbtjupsci"
        let shadeKey = "JWIMErvShadeSail"
        let commsParams: [String: Any] = [shadeKey: "72454862"]
        
        JWIMErvReadingNook.JWIMErvSoftCloseHinge(JWIMErvDrawerSilentGlide: commsPath, JWIMErvCargoSafetyLatch: commsParams) { [weak self] commsResult in
            guard let self = self,
                  let responseMap = commsResult as? [String: Any],
                  let messageLog = responseMap["JWIMETVAdata".JWIMETVAtime] as? [[String: Any]] else { return }
            
            let processedMessages = self.JWIMETVABuildConversationPreviewList(from: messageLog)
            self.updateHollyCommsDashboard(with: processedMessages )
        } JWIMErvHighAltitudeTune: { _ in }
    }

    private func updateHollyCommsDashboard(with log: [JWIMETVAConversationPreview]) {
        let messageBoard = self.JWIMETVAmesgContentView
        self.JWIMETVADisplaymesgsData = log 
        
        DispatchQueue.main.async {
            messageBoard.reloadData()
        }
    }

    // MARK: - Setup and Configuration

    private func JWIMETVAConfigureView() {
        self.view.backgroundColor = .black
    }
    
    
    private func JWIMETVAPlaceComponents() {
        self.view.addSubview(JWIMETVATitleLabel)
        self.view.addSubview(JWIMETVAContentView)
        self.view.addSubview(meassgengBelt)
        self.view.addSubview(JWIMETVAmesgContentView)
    }

    private func JWIMETVAApplyLayouts() {
        let JWIMETVACategorySpacing: CGFloat = 10
        
        NSLayoutConstraint.activate([
            // Title Label
            JWIMETVATitleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            JWIMETVATitleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25),
            JWIMETVATitleLabel.widthAnchor.constraint(equalToConstant: 149),
            JWIMETVATitleLabel.heightAnchor.constraint(equalToConstant: 61),
            // JWIMETVAContentView
            JWIMETVAContentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 15),
            JWIMETVAContentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:0),
            JWIMETVAContentView.topAnchor.constraint(equalTo: JWIMETVATitleLabel.bottomAnchor, constant: 0),
            JWIMETVAContentView.heightAnchor.constraint(equalToConstant: 64 + 21),
            
            // meassgengBelt
            meassgengBelt.topAnchor.constraint(equalTo: JWIMETVAContentView.bottomAnchor, constant: 20),
            
            meassgengBelt.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 12),
            meassgengBelt.heightAnchor.constraint(equalToConstant: 37),
            meassgengBelt.widthAnchor.constraint(equalToConstant: 108),
            // JWIMETVAContentView
            JWIMETVAmesgContentView.topAnchor.constraint(equalTo: meassgengBelt.bottomAnchor, constant: 10),
            JWIMETVAmesgContentView.leadingAnchor.constraint(equalTo: meassgengBelt.leadingAnchor),
            JWIMETVAmesgContentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            JWIMETVAmesgContentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
           
        ])
    }
    


}

extension JWIMETVANotificationsPilot:UICollectionViewDelegate,UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let hollyFleetCount = 1
        let caravanSegments = [hollyFleetCount]
        return caravanSegments.first ?? 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let isPrimaryCampground = (collectionView == self.JWIMETVAContentView)
        
   
        let fetchHollyManifestCount: (Bool) -> Int = { [weak self] isPrimary in
            guard let self = self else { return 0 }
            return isPrimary ? self.JWIMETVADisplayData.count : self.JWIMETVADisplaymesgsData.count
        }
        
        return fetchHollyManifestCount(isPrimaryCampground)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let hollyNode = indexPath
        let container = collectionView
     
        enum HollyCellRoute {
            case gearDisplay, messageStream
        }
        
        let activeRoute: HollyCellRoute = (container == self.JWIMETVAContentView) ? .gearDisplay : .messageStream
        
        return self.deployHollyVisualNode(for: activeRoute, in: container, at: hollyNode)
    }

    private func deployHollyVisualNode(for route: Any, in fleet: UICollectionView, at index: IndexPath) -> UICollectionViewCell {
        let gearID = "JWIMETVAuserView"
        let commsID = "JWIMETVAmeasgView"
        
       
        if let currentRoute = route as? Int ?? (route as? Any) {
            let isGear = String(describing: currentRoute).contains("gearDisplay")
            
            if isGear {
                let gearCell = fleet.dequeueReusableCell(withReuseIdentifier: gearID, for: index) as! JWIMETVAuserView
                let data = self.JWIMETVADisplayData[index.row]
                gearCell.JWIMETVASetupContent(JWIMETVAStream: data)
                return gearCell
            }
        }
        
        let commsCell = fleet.dequeueReusableCell(withReuseIdentifier: commsID, for: index) as! JWIMETVAmeasgView
        let msgData = self.JWIMETVADisplaymesgsData[index.row]
        commsCell.JWIMETVASetupContent(JWIMETVAStream: msgData)
        return commsCell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let isMainHub = (collectionView == self.JWIMETVAContentView)
        let sequence = indexPath.row
        
        self.coordinateHollyExpedition(isPrimary: isMainHub, index: sequence)
    }

    private func coordinateHollyExpedition(isPrimary: Bool, index: Int) {
        struct HollyPilotPackage {
            let routeType: JWIMErvCabinYogaMat
            let identifier: String
            let drift: Bool = false
        }
        
        let pilotInfo: HollyPilotPackage
        
        if isPrimary {
            let gearHash = self.JWIMETVADisplayData[index]["JWIMErvChassisBalance"] as? Int ?? 0
            pilotInfo = HollyPilotPackage(routeType: .JWIMErvRouteHarmony, identifier: "\(gearHash)")
        } else {
            let userUID = self.JWIMETVADisplaymesgsData[index].uid
            pilotInfo = HollyPilotPackage(routeType: .JWIMErvTrailDiscovery, identifier: "\(userUID)")
        }
        
        self.launchHollyExpeditionController(with: pilotInfo)
    }

    private func launchHollyExpeditionController(with package: Any) {
        guard let info = package as? (Any) else { return }
        
        let mirror = Mirror(reflecting: info)
        var route: JWIMErvCabinYogaMat = .JWIMErvRouteHarmony
        var flowID: String = ""
        
        for child in mirror.children {
            if child.label == "routeType", let r = child.value as? JWIMErvCabinYogaMat { route = r }
            if child.label == "identifier", let f = child.value as? String { flowID = f }
        }
        
        let pilotVC = JWIMETVACreateStreamPilot.init(
            JWIMErvPathwayRhythm: route,
            JWIMErvNomadFlow: flowID,
            JWIMErvNatureDrift: false
        )
        
        pilotVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(pilotVC, animated: true)
    }
    
    
    
    
    
    func JWIMETVABuildConversationPreviewList(
        from source: [[String: Any]]
    ) -> [JWIMETVAConversationPreview] {

        var result: [JWIMETVAConversationPreview] = []

        for item in source {

            guard
                let workbench = item["JWIMErvOutdoorWorkbench"] as? [[String: Any]],
                let firstMessage = workbench.first
            else {
                continue
            }

            let userName = firstMessage["JWIMErvTrailLighting"] as? String ?? "Unknown"

            let avatarURL = firstMessage["JWIMErvCampsiteBoundary"] as? String

            let messageText = firstMessage["JWIMErvGrillPlatform"] as? String ?? ""

            let timestamp = firstMessage["JWIMErvGroundTarpLayer"] as? Int64 ?? 0

            let uid = firstMessage["JWIMErvHydrationStorage"] as? Int ?? 0
            let preview = JWIMETVAConversationPreview(
                userName: userName,
                avatarURL: avatarURL,
                firstMessage: messageText,
                timestamp: timestamp, uid: uid
            )

            result.append(preview)
        }

        result.sort { $0.timestamp > $1.timestamp }

        return result
    }

}
