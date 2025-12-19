//
//  JWIMETVAStarFavoritesPilot.swift
//  JwiMeTvael
//
//  Created by JWIMETVA on 2025/12/12.
//

import UIKit
//star
import UIKit

// MARK: - Data Structures

enum JWIMETVASocialSelection: Int {
    case JWIMETVAPostContent = 0
    case JWIMETVAFollowedContent = 1
}

struct JWIMETVAActivityModel {
    let JWIMETVAName: String
    let JWIMETVADate: String
    let JWIMETVALocation: String
    let JWIMETVAMembers: Int
}

struct JWIMETVAPostModel {
    let JWIMETVAUserName: String
    let JWIMETVADescription: String
    let JWIMETVAImageCount: Int
    let JWIMETVATimeAgo: String
}

// MARK: - JWIMETVAStarFavoritesPilot Class (Main Controller)

final class JWIMETVAStarFavoritesPilot: UIViewController, UITableViewDataSource, UITableViewDelegate, JWIMETVAActivityBannerViewPick {
    func JWIMETVAActivitypick(data: [String : Any]) {
        if let JWIMErvShotComposition  = data["JWIMErvColorPaletteMap"]  as? Int {
            let JWIMErvvc = JWIMETVACreateStreamPilot.init(JWIMErvPathwayRhythm: .JWIMErvCampsiteTimecode,JWIMErvNomadFlow: "\(JWIMErvShotComposition)",JWIMErvNatureDrift:false)
            JWIMErvvc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(JWIMErvvc, animated: true)
        }
    }
    

    // MARK: - Constants and State

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
        print(JWIMETVAModel)
        return JWIMETVACell
    }
    
    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
//        let JWIMETVAModel = self.JWIMETVADisplayPosts[indexPath.row]
//        // Dynamic height calculation based on content (approximate)
//        let JWIMETVAShellHeight: CGFloat = 130 // User info + bottom actions + padding
//        let JWIMETVAMultimediaRatio: CGFloat = (JWIMETVAModel.JWIMETVAImageCount > 0) ? 300 : 0 // Height for images
//        return JWIMETVAShellHeight + JWIMETVAMultimediaRatio
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 228 + 37 + 20 + 30
    }
    
    
//
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        return self.JWIMETVAActivityBanner
    }
    
    
    // MARK: - Data and State Management

    private func JWIMETVAInitializeData() {
        var seletype:Int = 1
        if JWIMETVACurrentView == .JWIMETVAPostContent {
            seletype =  1
        }
        
        if JWIMETVACurrentView == .JWIMETVAFollowedContent {
            seletype =  2
        }
        
     
        
        JWIMETVAAppIndicatorMannager.JWIMETVAshow(JWIMETVAinfo: "JWIMETVALoading....".JWIMETVAtime)
        JWIMErvReadingNook.JWIMErvSoftCloseHinge(JWIMErvDrawerSilentGlide: "/tgdriewgwxrtifz/xeuxed", JWIMErvCargoSafetyLatch: ["JWIMErvSoftLightBlend":"72454862"]) { JWIMETVAsresult in
            JWIMETVAAppIndicatorMannager.JWIMETVAdismiss()
            if let FMberRECglsss = JWIMETVAsresult as? [String: Any],
                              
                let FMberRECrns = FMberRECglsss["JWIMETVAdata".JWIMETVAtime] as? Array<[String: Any]> {
                
                self.JWIMETVAActivityBanner.WIMETVAisLISDTY = FMberRECrns
                self.JWIMETVAActivityBanner.JWIMETVAContentView.reloadData()
            }
      
        } JWIMErvHighAltitudeTune: { JWIMETVAerrorot in
            JWIMETVAAppIndicatorMannager.JWIMETVAdismiss()
           
        }

        JWIMErvReadingNook.JWIMErvSoftCloseHinge(JWIMErvDrawerSilentGlide: "/snkjmsbjadbxmdz/ydfdiwqepxeg", JWIMErvCargoSafetyLatch: ["JWIMErvLoadDistribution":"72454862","JWIMErvCampgroundSetup":10,"JWIMErvOffgridCapability":seletype]) { JWIMETVAsresult in
            
            if let FMberRECglsss = JWIMETVAsresult as? [String: Any],
                              
                let FMberRECrns = FMberRECglsss["JWIMETVAdata".JWIMETVAtime] as? Array<[String: Any]> {

                    self.JWIMETVADisplayPosts = FMberRECrns

                self.JWIMETVASocialContent.reloadData()
            }
   
        } JWIMErvHighAltitudeTune: { JWIMETVAerrorot in
            
           
        }
        
    }

    @objc func switchJWIMETVApost() {
        JWIMETVAUpdateSortVisuals(.JWIMETVAPostContent)
    }
    
    @objc func switchJWIMETVAfollow() {
        JWIMETVAUpdateSortVisuals(.JWIMETVAFollowedContent)
    }
   
    private func JWIMETVAUpdateSortVisuals(_ JWIMETVASelected: JWIMETVASocialSelection) {
        if JWIMETVASelected == .JWIMETVAPostContent {
            self.JWIMETVACurrentView = .JWIMETVAPostContent
            self.JWIMETVAActivityBanner.JWIMETVAPostButton.isSelected = true
            self.JWIMETVAActivityBanner.JWIMETVAFollowedButton.isSelected = false
            
        }
        
        if JWIMETVASelected == .JWIMETVAFollowedContent {
            self.JWIMETVACurrentView = .JWIMETVAFollowedContent
            self.JWIMETVAActivityBanner.JWIMETVAPostButton.isSelected = false
            self.JWIMETVAActivityBanner.JWIMETVAFollowedButton.isSelected = true
        }
        
        JWIMETVAInitializeData()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let JWIMErvShotComposition  = self.JWIMETVADisplayPosts[indexPath.item]["JWIMErvMudGuardShield"]  as? Int {
            let vc = JWIMETVACreateStreamPilot.init(JWIMErvPathwayRhythm: .JWIMErvFreedomJourney,JWIMErvNomadFlow: "\(JWIMErvShotComposition)",JWIMErvNatureDrift:false)
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
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
//    
//    private let JWIMETVAMultimediaContainer: UIView = {
//        let JWIMETVAMultimediaContainer = UIView()
//        JWIMETVAMultimediaContainer.backgroundColor = .clear
//        JWIMETVAMultimediaContainer.translatesAutoresizingMaskIntoConstraints = false
//        return JWIMETVAMultimediaContainer
//    }()

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
    
    private  lazy var JWIMETVAmore: UIButton = {
        let allin = UIButton.init()
        allin.setImage(JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMETVAmore"), for: .normal)
        allin.translatesAutoresizingMaskIntoConstraints = false
        return allin
    }()
    
    private lazy var JWIMETVAvidoBt: UIButton = {
        let iamghu =   UIButton.init()
        iamghu.setBackgroundImage(JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMETVAvioip"), for: .normal)
        iamghu.translatesAutoresizingMaskIntoConstraints = false
        iamghu.isUserInteractionEnabled = false
        return iamghu
    }()
    
    private lazy var JWIMETVAsegmentBt: UIButton = {
        let iamghu =   UIButton.init()
        iamghu.setBackgroundImage(JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMETVAcoaminge"), for: .normal)
        iamghu.setImage(JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMETVAheiairt"), for: .normal)
        iamghu.isUserInteractionEnabled = false
        iamghu.translatesAutoresizingMaskIntoConstraints = false
        return iamghu
     
    }()
    
    private lazy var JWIMETVAchafBt: UIButton = {
        let iamghu =   UIButton.init()
        iamghu.setBackgroundImage(JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMETVAcoaminge"), for: .normal)
        iamghu.setImage(JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMETVAchainj"), for: .normal)
        iamghu.isUserInteractionEnabled = false
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
    
    // MARK: - Content Assignment
    func JWIMETVASetupContent(JWIMETVAPost: [String: Any] ) {
        print(JWIMETVAPost)
        if let imgback = JWIMETVAPost["JWIMErvInsulationDensity"] as? String {
            JWIMETVAUserPhoto.JWIMErvCampfireAura(JWIMErvMountainRhythm: imgback)
        }
        
        JWIMETVAPilotName.text = JWIMETVAPost["JWIMErvCabinAcoustics"] as? String
        
        JWIMETVAElapsedTime.text =  FLORENICFormatExpeditionTime(FLORENICTime: TimeInterval((JWIMETVAPost["JWIMErvRoofCoating"] as? Int ?? 0)/1000))
        
        JWIMETVASubmissionText.text = JWIMETVAPost["JWIMErvCabinLighting"] as? String
        
        if let imgback = (JWIMETVAPost["JWIMErvSealantMaintenance"] as? Array<String>)?.first {
            JWIMETVAImageA.JWIMErvCampfireAura(JWIMErvMountainRhythm: imgback)
        }
        
        if let imgback2 = (JWIMETVAPost["JWIMErvSealantMaintenance"] as? Array<String>)?.last {
            JWIMETVAImageB.JWIMErvCampfireAura(JWIMErvMountainRhythm: imgback2)
        }
        
       
    }
    
     func FLORENICFormatExpeditionTime(FLORENICTime: TimeInterval) -> String {
        let FLORENICDate = Date(timeIntervalSince1970: FLORENICTime)
        let FLORENICFormatter = DateFormatter()
        
        // 设置你需要的格式
        FLORENICFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        // 建议固定时区，避免不同地区用户看到的时间不一致
        FLORENICFormatter.timeZone = TimeZone.current
        
        return FLORENICFormatter.string(from: FLORENICDate)
    }
}

