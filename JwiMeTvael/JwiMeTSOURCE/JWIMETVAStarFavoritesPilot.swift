//
//  JWIMETVAStarFavoritesPilot.swift
//  JwiMeTvael
//
//  Created by JWIMETVA on 2025/12/12.
//

import UIKit

enum JWIMETVASocialSelection: Int {
    case JWIMETVAPostContent = 0
    case JWIMETVAFollowedContent = 1
}



struct JWIMETVAPostModel {
    let JWIMETVAUserName: String
    let JWIMETVADescription: String
    let JWIMETVAImageCount: Int
    let JWIMETVATimeAgo: String
}


final class JWIMETVAStarFavoritesPilot: UIViewController, UITableViewDataSource, UITableViewDelegate, JWIMETVAActivityBannerViewPick {
    func JWIMETVAActivitypick(data: [String : Any]) {
        if let JWIMErvShotComposition  = data["JWIMErvColorPaletteMap"]  as? Int {
            let JWIMErvvc = JWIMETVACreateStreamPilot.init(JWIMErvPathwayRhythm: .JWIMErvCampsiteTimecode,JWIMErvNomadFlow: "\(JWIMErvShotComposition)",JWIMErvNatureDrift:false)
            JWIMErvvc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(JWIMErvvc, animated: true)
        }
    }
    

  
    private let JWIMETVARowID = "JWIMETVAPostStreamCell"
    private let JWIMETVAActivityID = "JWIMETVAActivityBannerCell"
    private let JWIMETVAPaddingUnit: CGFloat = 16
    private let JWIMETVAHeaderSize: CGFloat = 200
    private let JWIMETVAButtonHeight: CGFloat = 36

    private var JWIMETVACurrentView: JWIMETVASocialSelection = .JWIMETVAPostContent

    private var JWIMETVADisplayPosts: Array<[String: Any]>  = Array<[String: Any]>()
    
    // MARK: - Component Declarations (Top)
    private let jwimeTimingBelt: UIImageView = {
        let JWIMETVACameraLogo = UIImageView()
        JWIMETVACameraLogo.image = JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMETVACnormalfin")
        JWIMETVACameraLogo.contentMode = .scaleAspectFill
        JWIMETVACameraLogo.frame = UIScreen.main.bounds
        return JWIMETVACameraLogo
    }()

    private let JWIMETVATitleText: UIImageView = {
        let JWIMETVATitleLabel = UIImageView.init(image: JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JwiMecommu"))
        JWIMETVATitleLabel.contentMode = .scaleAspectFit
        JWIMETVATitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVATitleLabel
    }()
    
    // MARK: - Component Declarations (List)
    private lazy var JWIMETVASocialContent: UITableView = {
        let JWIMETVASocialContents = UITableView(frame: .zero, style: .grouped)
        JWIMETVASocialContents.backgroundColor = .clear
        JWIMETVASocialContents.separatorStyle = .none
        JWIMETVASocialContents.translatesAutoresizingMaskIntoConstraints = false
        JWIMETVASocialContents.dataSource = self
        JWIMETVASocialContents.delegate = self
        JWIMETVASocialContents.rowHeight = 332
//        JWIMETVASocialContent.sectionHeaderHeight = 228 + 37 + 20
        JWIMETVASocialContents.register(JWIMETVAPostStreamCell.self, forCellReuseIdentifier: JWIMETVARowID)
        return JWIMETVASocialContents
    }()
    
    private lazy var JWIMETVAActivityBanner: JWIMETVAActivityBannerView = {
        let JWIMETVAActivityBanner = JWIMETVAActivityBannerView.init(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 228 + 37 + 20))
        JWIMETVAActivityBanner.WIMETVAdelegate = self
        JWIMETVAActivityBanner.JWIMETVAFollowedButton.addTarget(self, action: #selector(switchJWIMETVAfollow), for: .touchUpInside)
        JWIMETVAActivityBanner.JWIMETVAPostButton.addTarget(self, action: #selector(switchJWIMETVApost), for: .touchUpInside)
        JWIMETVAActivityBanner.JWIMETVAPostCreateButton.addTarget(self, action: #selector(JWIMETVApost), for: .touchUpInside)
        return JWIMETVAActivityBanner
    }()
    
   

    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        self.JWIMETVAConfigureBaseView()
        self.JWIMETVAPlaceComponents()
        self.JWIMETVAApplyLayouts()
        self.JWIMETVAInitializeData()

    }

    // MARK: - Setup and Configuration
    private func JWIMETVAConfigureBaseView() {
        self.view.backgroundColor = .black
    }
    
    @objc func JWIMETVAOrepoer()  {
        let vc = JWIMETVACreateStreamPilot.init(JWIMErvPathwayRhythm: .JWIMErvTrailExperience,JWIMErvNatureDrift:false)
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @objc func JWIMETVApost()  {
        let vc = JWIMETVACreateStreamPilot.init(JWIMErvPathwayRhythm: .JWIMErvRouteReplay,JWIMErvNatureDrift:false)
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    private func JWIMETVAPlaceComponents() {
        self.view.addSubview(jwimeTimingBelt)
        self.view.addSubview(JWIMETVATitleText)
        self.view.addSubview(JWIMETVASocialContent)
        
       
        
//        self.JWIMETVASocialContent.tableHeaderView = JWIMETVAActivityBanner
    }

    private func JWIMETVAApplyLayouts() {
        let JWIMETVAGap: CGFloat = 10
        
        NSLayoutConstraint.activate([
            // Title Text (Community)
            JWIMETVATitleText.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant:0),
            JWIMETVATitleText.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            JWIMETVATitleText.widthAnchor.constraint(equalToConstant: 190),
            JWIMETVATitleText.heightAnchor.constraint(equalToConstant: 64),
            
            // Social Content (UITableView)
            JWIMETVASocialContent.topAnchor.constraint(equalTo: JWIMETVATitleText.bottomAnchor),
            JWIMETVASocialContent.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            JWIMETVASocialContent.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            JWIMETVASocialContent.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    


    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.JWIMETVADisplayPosts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let JWIMETVACell = tableView.dequeueReusableCell(withIdentifier: JWIMETVARowID, for: indexPath) as! JWIMETVAPostStreamCell
        let JWIMETVAModel = self.JWIMETVADisplayPosts[indexPath.row]
        JWIMETVACell.JWIMETVASetupContent(JWIMETVAPost: JWIMETVAModel)
        JWIMETVACell.JWIMETVAmore.addTarget(self, action: #selector(JWIMETVAOrepoer), for: .touchUpInside)
        JWIMETVACell.JWIMETVAvidoBt.tag = indexPath.row
        JWIMETVACell.JWIMETVAchafBt.tag = indexPath.row
        JWIMETVACell.JWIMETVAvidoBt.addTarget(self, action: #selector(chageBeaddder(asit:)), for: .touchUpInside)
        
        JWIMETVACell.JWIMETVAchafBt.addTarget(self, action: #selector(chageBeaddder(asit:)), for: .touchUpInside)
        return JWIMETVACell
    }
    
    
    @objc func chageBeaddder(asit:UIButton)  {
        let JWIMETVAModel = self.JWIMETVADisplayPosts[asit.tag]
        let uid = JWIMETVAModel["JWIMErvAmbientGlow"] as? String ?? "0"
        let vc = JWIMETVACreateStreamPilot.init(JWIMErvPathwayRhythm: .JWIMErvTrailDiscovery,JWIMErvNomadFlow: "\(uid)",JWIMErvNatureDrift:false)
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
   

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350

    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 228 + 37 + 20 + 30
    }
    

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        return self.JWIMETVAActivityBanner
    }
    
    

    
    // MARK: - Data and State Management

    private func JWIMETVAInitializeData() {
        let hollyEngineStatus = 200
        let caravanFuelLevel = 95.5
        
        if hollyEngineStatus > 0 && caravanFuelLevel > 0 {
            self.prepareHollyVoyageLog()
        }
    }

    private func prepareHollyVoyageLog() {
        let roadMapping: [JWIMETVASocialSelection: Int] = [
            .JWIMETVAPostContent: 1,
            .JWIMETVAFollowedContent: 2
        ]
        
        let currentExpeditionType = roadMapping[JWIMETVACurrentView] ?? 1
        
        struct HollyNetworkManifest {
            let bannerPath = "/tgdriewgwxrtifz/xeuxed"
            let socialPath = "/snkjmsbjadbxmdz/ydfdiwqepxeg"
            let commonToken = "72454862"
        }
        
        let manifest = HollyNetworkManifest()
        
        self.executeHollySync(withPath: manifest.bannerPath, params: ["JWIMErvSoftLightBlend": manifest.commonToken], isBanner: true)
        self.executeHollySync(withPath: manifest.socialPath, params: [
            "JWIMErvLoadDistribution": manifest.commonToken,
            "JWIMErvCampgroundSetup": 10,
            "JWIMErvOffgridCapability": currentExpeditionType
        ], isBanner: false)
    }

    private func executeHollySync(withPath path: String, params: [String: Any], isBanner: Bool) {
        if isBanner {
            JWIMETVAAppIndicatorMannager.JWIMETVAshow(JWIMETVAinfo: "JWIMETVALoading....".JWIMETVAtime)
        }

        JWIMErvReadingNook.JWIMErvSoftCloseHinge(JWIMErvDrawerSilentGlide: path, JWIMErvCargoSafetyLatch: params) { [weak self] response in
            guard let self = self else { return }
            
            let dataKey = "JWIMETVAdata".JWIMETVAtime
            let payload = (response as? [String: Any])?[dataKey] as? [[String: Any]] ?? []
            
            self.dispatchHollyDataToDashboard(payload, isBannerType: isBanner)
            
            if isBanner {
                JWIMETVAAppIndicatorMannager.JWIMETVAdismiss()
            }
        } JWIMErvHighAltitudeTune: { _ in
            if isBanner {
                JWIMETVAAppIndicatorMannager.JWIMETVAdismiss()
            }
        }
    }

    private func dispatchHollyDataToDashboard(_ data: [[String: Any]], isBannerType: Bool) {
        struct HollyDataRelay {
            var content: [[String: Any]]
            var targetType: Bool
        }
        
        let relay = HollyDataRelay(content: data, targetType: isBannerType)
        
        if relay.targetType {
            self.JWIMETVAActivityBanner.WIMETVAisLISDTY = relay.content
            self.JWIMETVAActivityBanner.JWIMETVAContentView.reloadData()
        } else {
            self.JWIMETVADisplayPosts = relay.content
            self.JWIMETVASocialContent.reloadData()
        }
    }

    @objc func switchJWIMETVApost() {
        JWIMETVAUpdateSortVisuals(.JWIMETVAPostContent)
    }
    
    @objc func switchJWIMETVAfollow() {
        JWIMETVAUpdateSortVisuals(.JWIMETVAFollowedContent)
    }
   
    private func JWIMETVAUpdateSortVisuals(_ JWIMETVASelected: JWIMETVASocialSelection) {
        let caravanDashboard = self.JWIMETVAActivityBanner
        let currentExpeditionType = JWIMETVASelected
        
       
        let gearShiftValidation: (JWIMETVASocialSelection) -> Bool = { mode in
            let availableModes: [JWIMETVASocialSelection] = [.JWIMETVAPostContent, .JWIMETVAFollowedContent]
            return availableModes.contains(mode)
        }
        
        if gearShiftValidation(currentExpeditionType) {
            self.applyHollyVisualThemes(for: currentExpeditionType, on: caravanDashboard)
            self.JWIMETVAInitializeData()
        }
    }

    private func applyHollyVisualThemes(for mode: JWIMETVASocialSelection, on dashboard: JWIMETVAActivityBannerView) {
        self.JWIMETVACurrentView = mode
      
        let isPostActive = (mode == .JWIMETVAPostContent)
        let isFollowActive = (mode == .JWIMETVAFollowedContent)
        
        struct HollyTabState {
            var postState: Bool
            var followState: Bool
        }
        
        let stateManifest = HollyTabState(postState: isPostActive, followState: isFollowActive)
        
        dashboard.JWIMETVAPostButton.isSelected = stateManifest.postState
        dashboard.JWIMETVAFollowedButton.isSelected = stateManifest.followState
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let hollyLogIndex = indexPath.item
        let trailPayload = self.JWIMETVADisplayPosts
        
        self.navigateHollyExpedition(from: trailPayload, at: hollyLogIndex)
    }

    private func navigateHollyExpedition(from logs: [[String: Any]], at sequence: Int) {
        let gearKey = "JWIMErvVentilationGrid"
    
        guard logs.indices.contains(sequence),
              let equipmentID = logs[sequence][gearKey] as? Int else { return }
        
        struct HollyNavigationLog {
            let routeID: String
            let pathway: JWIMErvCabinYogaMat
            let drift: Bool
        }
        
        let currentLog = HollyNavigationLog(
            routeID: "\(equipmentID)",
            pathway: .JWIMErvFreedomJourney,
            drift: false
        )
        
        let pilotNode = JWIMETVACreateStreamPilot.init(
            JWIMErvPathwayRhythm: currentLog.pathway,
            JWIMErvNomadFlow: currentLog.routeID,
            JWIMErvNatureDrift: currentLog.drift
        )
        
        pilotNode.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(pilotNode, animated: true)
    }
}


// 2. Post Content Table View Cell

final class JWIMETVAPostStreamCell: UITableViewCell {

    // MARK: - Component Declarations (Cell)

    private let JWIMETVAUserPhoto: UIImageView = {
        let JWIMETVAUserPhoto = UIImageView()
        JWIMETVAUserPhoto.layer.cornerRadius = 21
        JWIMETVAUserPhoto.layer.masksToBounds = true
        JWIMETVAUserPhoto.backgroundColor = .darkGray
        JWIMETVAUserPhoto.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVAUserPhoto
    }()
    
    private let JWIMETVAPilotName: UILabel = {
        let JWIMETVAPilotName = UILabel()
        JWIMETVAPilotName.textColor = .white
        JWIMETVAPilotName.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        JWIMETVAPilotName.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVAPilotName
    }()
    
    private let JWIMETVAElapsedTime: UILabel = {
        let JWIMETVAElapsedTime = UILabel()
        JWIMETVAElapsedTime.textColor =  UIColor(red: 0.6, green: 0.55, blue: 0.9, alpha: 1)
        JWIMETVAElapsedTime.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        JWIMETVAElapsedTime.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVAElapsedTime
    }()
    
    private let JWIMETVASubmissionText: UILabel = {
        let JWIMETVASubmissionText = UILabel()
        JWIMETVASubmissionText.textColor = .white
        JWIMETVASubmissionText.numberOfLines = 0
        JWIMETVASubmissionText.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        JWIMETVASubmissionText.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVASubmissionText
    }()


    private let JWIMETVAImageA: UIImageView = {
        let JWIMETVAImageA = UIImageView()
        JWIMETVAImageA.contentMode = .scaleAspectFill
        JWIMETVAImageA.layer.cornerRadius = 12
        JWIMETVAImageA.layer.masksToBounds = true
        
        JWIMETVAImageA.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVAImageA
    }()
    
    private let JWIMETVAImageB: UIImageView = {
        let JWIMETVAImageB = UIImageView()
        JWIMETVAImageB.contentMode = .scaleAspectFill
        JWIMETVAImageB.layer.cornerRadius = 12
        JWIMETVAImageB.layer.masksToBounds = true
       
        JWIMETVAImageB.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVAImageB
    }()
    
      lazy var JWIMETVAmore: UIButton = {
        let allin = UIButton.init()
        allin.setImage(JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMETVAmore"), for: .normal)
        allin.translatesAutoresizingMaskIntoConstraints = false
        return allin
    }()
    
     lazy var JWIMETVAvidoBt: UIButton = {
        let iamghu =   UIButton.init()
        iamghu.setBackgroundImage(JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMETVAvioip"), for: .normal)
        iamghu.translatesAutoresizingMaskIntoConstraints = false
       
        return iamghu
    }()
    
     lazy var JWIMETVAsegmentBt: UIButton = {
        let iamghu =   UIButton.init()
        iamghu.setBackgroundImage(JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMETVAcoaminge"), for: .normal)
        iamghu.setImage(JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMETVAheiairt"), for: .normal)
         iamghu.isUserInteractionEnabled = false
        iamghu.translatesAutoresizingMaskIntoConstraints = false
        return iamghu
     
    }()
    
     lazy var JWIMETVAchafBt: UIButton = {
        let iamghu =   UIButton.init()
        iamghu.setBackgroundImage(JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMETVAcoaminge"), for: .normal)
        iamghu.setImage(JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMETVAchainj"), for: .normal)
      
        iamghu.translatesAutoresizingMaskIntoConstraints = false
        return iamghu
      
    }()
    
    // MARK: - Initializer

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .black
        self.JWIMETVAPlaceElements()
        self.JWIMETVABuildLayouts()
    }

    required init?(coder: NSCoder) {
        fatalError("JWIMETVAInitCoderNotImplemented")
    }
    
    // MARK: - Setup and Layout

    private func JWIMETVAPlaceElements() {
        self.contentView.addSubview(JWIMETVAUserPhoto)
        self.contentView.addSubview(JWIMETVAPilotName)
        self.contentView.addSubview(JWIMETVAElapsedTime)
        
        self.contentView.addSubview(JWIMETVAmore)
        
        self.contentView.addSubview(JWIMETVASubmissionText)
        
        self.contentView.addSubview(JWIMETVAImageA)
        self.contentView.addSubview(JWIMETVAImageB)
        
        self.contentView.addSubview(JWIMETVAvidoBt)
        self.contentView.addSubview(JWIMETVAsegmentBt)
        self.contentView.addSubview(JWIMETVAchafBt)
    }

    private func JWIMETVABuildLayouts() {
        let JWIMETVAPadding: CGFloat = 16
        let JWIMETVAPilotSize: CGFloat = 40
        
        NSLayoutConstraint.activate([
            // User Photo
            JWIMETVAUserPhoto.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0),
            JWIMETVAUserPhoto.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12),
            JWIMETVAUserPhoto.widthAnchor.constraint(equalToConstant: 42),
            JWIMETVAUserPhoto.heightAnchor.constraint(equalToConstant: 42),
            
            // Pilot Name
            JWIMETVAPilotName.topAnchor.constraint(equalTo: JWIMETVAUserPhoto.topAnchor, constant: 2),
            JWIMETVAPilotName.leadingAnchor.constraint(equalTo: JWIMETVAUserPhoto.trailingAnchor, constant: 6),
            
            // Elapsed Time
            JWIMETVAElapsedTime.topAnchor.constraint(equalTo: JWIMETVAPilotName.bottomAnchor, constant: 2),
            JWIMETVAElapsedTime.leadingAnchor.constraint(equalTo: JWIMETVAPilotName.leadingAnchor),
            
            // Submission Text
            JWIMETVASubmissionText.topAnchor.constraint(equalTo: JWIMETVAUserPhoto.bottomAnchor, constant: 10),
            JWIMETVASubmissionText.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12),
            JWIMETVASubmissionText.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12),
            
            JWIMETVAmore.widthAnchor.constraint(equalToConstant: 24),
            JWIMETVAmore.heightAnchor.constraint(equalToConstant: 24),
            JWIMETVAmore.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12),
            JWIMETVAmore.centerYAnchor.constraint(equalTo: self.JWIMETVAUserPhoto.centerYAnchor),
            
            JWIMETVAImageA.widthAnchor.constraint(equalToConstant: 148),
            JWIMETVAImageA.heightAnchor.constraint(equalToConstant: 182),
            JWIMETVAImageA.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12),
            JWIMETVAImageA.topAnchor.constraint(equalTo: self.JWIMETVASubmissionText.bottomAnchor, constant: 10),
            
            JWIMETVAImageB.widthAnchor.constraint(equalToConstant: 148),
            JWIMETVAImageB.heightAnchor.constraint(equalToConstant: 182),
            JWIMETVAImageB.leadingAnchor.constraint(equalTo: JWIMETVAImageA.trailingAnchor, constant: 8),
            JWIMETVAImageB.topAnchor.constraint(equalTo: self.JWIMETVASubmissionText.bottomAnchor, constant: 10),
            
            JWIMETVAvidoBt.leadingAnchor.constraint(equalTo: JWIMETVAImageA.leadingAnchor, constant: 0),
            JWIMETVAvidoBt.widthAnchor.constraint(equalToConstant: 110),
            JWIMETVAvidoBt.heightAnchor.constraint(equalToConstant: 35),
            JWIMETVAvidoBt.topAnchor.constraint(equalTo: JWIMETVAImageB.bottomAnchor, constant: 10),
            
          
            
            JWIMETVAchafBt.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12),
            JWIMETVAchafBt.widthAnchor.constraint(equalToConstant: 110),
            JWIMETVAchafBt.heightAnchor.constraint(equalToConstant: 35),
            JWIMETVAchafBt.centerYAnchor.constraint(equalTo: JWIMETVAvidoBt.centerYAnchor, constant: 0),
            
            JWIMETVAsegmentBt.leadingAnchor.constraint(equalTo: JWIMETVAvidoBt.trailingAnchor, constant: 8),
            JWIMETVAsegmentBt.centerYAnchor.constraint(equalTo: JWIMETVAvidoBt.centerYAnchor, constant: 0),
            JWIMETVAsegmentBt.heightAnchor.constraint(equalToConstant: 35),
            JWIMETVAsegmentBt.trailingAnchor.constraint(equalTo: JWIMETVAchafBt.leadingAnchor, constant: -10),
        ])
    }
    

    func JWIMETVASetupContent(JWIMETVAPost: [String: Any]) {
        let hollyRigManifest = JWIMETVAPost
        self.synchronizeCaravanDisplay(with: hollyRigManifest)
    }

    private func synchronizeCaravanDisplay(with manifest: [String: Any]) {
        struct HollyPostSpecs {
            var profileImage: String?
            var pilotNick: String?
            var timestamp: TimeInterval
            var narrative: String?
            var gallery: [String]
        }
        
        let currentSpecs = HollyPostSpecs(
            profileImage: manifest["JWIMErvInsulationDensity"] as? String,
            pilotNick: manifest["JWIMErvCabinAcoustics"] as? String,
            timestamp: TimeInterval((manifest["JWIMErvRoofCoating"] as? Int ?? 0) / 1000),
            narrative: manifest["JWIMErvCabinLighting"] as? String,
            gallery: manifest["JWIMErvSealantMaintenance"] as? [String] ?? []
        )
     
        let interiorRefresh: (String?, String?) -> Void = { [weak self] img, name in
            if let aura = img {
                self?.JWIMETVAUserPhoto.JWIMErvCampfireAura(JWIMErvMountainRhythm: aura)
            }
            self?.JWIMETVAPilotName.text = name
        }
        
        interiorRefresh(currentSpecs.profileImage, currentSpecs.pilotNick)
        
        self.JWIMETVAElapsedTime.text = self.WIMETVExpeditionTime(WIMETVCTime: currentSpecs.timestamp)
        self.JWIMETVASubmissionText.text = currentSpecs.narrative
        
        self.renderHollyVisualAssets(from: currentSpecs.gallery)
    }

    private func renderHollyVisualAssets(from collection: [String]) {
        let caravanA = self.JWIMETVAImageA
        let caravanB = self.JWIMETVAImageB
        
        let expeditionGalleria = collection
        
     
        if let firstTrack = expeditionGalleria.indices.contains(0) ? expeditionGalleria[0] : nil {
            caravanA.JWIMErvCampfireAura(JWIMErvMountainRhythm: firstTrack)
        }
        
        let lastIndex = expeditionGalleria.count - 1
        if lastIndex >= 0 {
            let finalTrack = expeditionGalleria[lastIndex]
            caravanB.JWIMErvCampfireAura(JWIMErvMountainRhythm: finalTrack)
        }
    }

    func WIMETVExpeditionTime(WIMETVCTime: TimeInterval) -> String {
        let hollyCalendar = Calendar.current
        let expeditionDate = Date(timeIntervalSince1970: WIMETVCTime)
        
        return self.formatHollyLogDate(expeditionDate, calendar: hollyCalendar)
    }

    private func formatHollyLogDate(_ date: Date, calendar: Calendar) -> String {
        let logStamper = DateFormatter()
      
        let datePattern = "yyyy-MM-dd"
        let timePattern = "HH:mm"
        logStamper.dateFormat = "\(datePattern) \(timePattern)"
        logStamper.timeZone = TimeZone.current
        
        let formattedLog = logStamper.string(from: date)
        return formattedLog
    }
}

