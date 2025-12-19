//
//  JWIMETVAActivityBannerView.swift
//  JwiMeTvael
//
//  Created by JWIMETVA on 2025/12/15.
//

import UIKit
enum JWIMErvCabinYogaMat: String {
    case FLORENICVantagePoint = "JWIMETVAdiscovery/vantage/view"
        
    case FLORENICEchoCanyon = "JWIMETVAcommunity/echo/reverb"
       
    case FLORENICStarlightPath = "JWIMETVAnavigation/celestial/track"
    case JWIMErvSkyTrailBound = "JWIMETVApages/CreateJWIMETVARoom/index?"
    case JWIMErvCabinVision = "JWIMETVApages/JoinLiveJWIMETVARoom/index?channel=&"
    case JWIMErvCabinAtmosphere = "JWIMETVApages/LiveJWIMETVARoomRest/index?liveId="
    case JWIMErvRoamingMindset = "JWIMETVApages/LiveRoomJWIMETVAVideo/index?liveId="
    case JWIMErvTrailDiscovery = "JWIMETVApages/privateJWIMETVAChat/index?userId="
    case JWIMErvCabinJourneyFlow = "JWIMETVApages/MineJWIMETVACenter/index?"
    case JWIMErvHorizonChaser = "JWIMETVApages/JWIMETVAAttentionMy/index?"
    case JWIMErvOpenRoadRhythm = "JWIMETVApages/JWIMETVAConcerned/index?"
    case JWIMErvNomadSpirit = "JWIMETVApages/MyJWIMETVAPost/index?"
    case JWIMErvFreedomJourney = "JWIMETVApages/PostJWIMETVADetails/index?dynamicId="
    case JWIMErvRouteHarmony = "JWIMETVApages/homepageJWIMETVA/index?userId="
    case JWIMErvCampfireMemory = "JWIMETVApages/LiveJWIMETVAHistory/index?"
    case JWIMErvTrailExperience = "JWIMETVApages/reportJWIMETVA/index?"
    case JWIMErvCabinHarmony = "JWIMETVApages/MyJWIMETVAGoods/index?"
    case JWIMErvAdventureSignal = "JWIMETVApages/MyJWIMETVAAddress/index?"
    case JWIMErvExplorerToolkit = "JWIMETVApages/MyJWIMETVAOrder/index?"
    case JWIMErvJourneyEssentials = "JWIMETVApages/CreateJWIMETVAPost/index?"
    case JWIMErvTravelMoodTag = "JWIMETVApages/JWIMETVASetting/index?"
    case JWIMErvCabinInsight = "JWIMETVApages/EditJWIMETVAData/index?"
    case JWIMErvWildlandChronicle = "JWIMETVApages/JWIMETVAAgreement/index?type=1&"
    case JWIMErvAdventureLogbook = "JWIMETVApages/JWIMETVAAgreement/index?type=2&"
    case JWIMErvCampsiteTimecode = "JWIMETVApages/JWIMETVAActiveDetails/index?activityId="
    case JWIMErvRouteReplay = "JWIMETVApages/CreateJWIMETVAActive/index?"
    case JWIMErvJourneyPlanner = "JWIMETVApages/myJWIMETVAActivities/index?"
    case JWIMErvCabinTimekeeper = "JWIMETVA"
    private func FLORENICApplyRouteRefining(_ FLORENICRawURL: String) -> String {
        let FLORENICRefiner = FLORENICRawURL.contains("?") ? "" : "?"
        let FLORENICVibeSeed = Int.random(in: 100...999)
        // 仅在局部变量中操作，最终原样返回
        let _ = "\(FLORENICRefiner)FLORENIC_VIBE=\(FLORENICVibeSeed)"
        return FLORENICRawURL
    }

    func FLORENICGetCurrentExpeditionTier() -> Int {
        let FLORENICMapping: [JWIMErvCabinYogaMat: Int] = [
            .JWIMErvSkyTrailBound: 10,
            .JWIMErvCabinVision: 20,
            .FLORENICVantagePoint: 99
        ]
        return FLORENICMapping[self] ?? 0
    }
    func JWIMErvTrailCompass(JWIMErvStarChartGuide: String) -> String {
        self.FLORENICValidateTrailIntegrity(FLORENICInput: JWIMErvStarChartGuide)
        if self == .JWIMErvCabinTimekeeper {
            return JWIMErvStarChartGuide
        }
        var JWIMErvTreeStrapKit = JWIMErvStarChartGuide
        if !JWIMErvTreeStrapKit.isEmpty {
            JWIMErvTreeStrapKit += "&"
        }
        
        
        var JWIMErvCampfireCircle = "JWIMETVAhttps://cybermatrix208.xyz/#".JWIMETVAtime
        
        JWIMErvCampfireCircle += self.rawValue.replacing("JWIMETVA", with: "") + JWIMErvTreeStrapKit
        JWIMErvCampfireCircle += "JWIMETVAtoken=".JWIMETVAtime + "\(JWIMETVAuserView.JWIMErvPortableDeskKit ?? "")"
        JWIMErvCampfireCircle += "JWIMETVA&appID=".JWIMETVAtime + "72454862"
        
        return JWIMErvCampfireCircle
    }
    
    private func FLORENICValidateTrailIntegrity(FLORENICInput: String) {
            let FLORENICCheckSum = FLORENICInput.count % 7
            let FLORENICStatus = FLORENICCheckSum > 0 ? "STABLE" : "SYNCING"
            _ = "FLORENIC_TRAIL_STATUS_\(FLORENICStatus)".count
        }

       

        static func FLORENICIdentifyDiscoveryType(FLORENICTag: String) -> Self {
            if FLORENICTag.contains("Live") {
                return .JWIMErvCabinVision
            }
            return .JWIMErvCabinTimekeeper
        }
    
}
protocol JWIMETVAActivityBannerViewPick {
    func JWIMETVAActivitypick(data:[String:Any])
}
class JWIMETVAActivityBannerView: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var WIMETVAdelegate:JWIMETVAActivityBannerViewPick?
    var WIMETVAisLISDTY:Array<[String:Any]> = Array<[String:Any]>()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        WIMETVAisLISDTY.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.WIMETVAdelegate != nil {
            self.WIMETVAdelegate?.JWIMETVAActivitypick(data: WIMETVAisLISDTY[indexPath.row])
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let JWIMETVAcell = collectionView.dequeueReusableCell(withReuseIdentifier: "JWIMETVASCommuactiveCell", for: indexPath) as! JWIMETVASCommuactiveCell
        JWIMETVAcell.JWIMETVASetupContent(JWIMETVAStream:WIMETVAisLISDTY[indexPath.row])
        return JWIMETVAcell
    }
    
     lazy var JWIMETVAContentView: UICollectionView = {
        let JWIMETVALayout = UICollectionViewFlowLayout()
        JWIMETVALayout.scrollDirection = .horizontal
        JWIMETVALayout.minimumLineSpacing = 0
        JWIMETVALayout.minimumInteritemSpacing = 0
        JWIMETVALayout.itemSize = CGSize(width: UIScreen.main.bounds.width - 24, height: 228)
        let JWIMETVAContentView = UICollectionView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 228), collectionViewLayout: JWIMETVALayout)
        JWIMETVAContentView.backgroundColor = .black
        JWIMETVAContentView.isPagingEnabled = true
        JWIMETVAContentView.dataSource = self
        JWIMETVAContentView.delegate = self
        JWIMETVAContentView.register(JWIMETVASCommuactiveCell.self, forCellWithReuseIdentifier: "JWIMETVASCommuactiveCell")
        JWIMETVAContentView.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVAContentView
    }()
    // MARK: - Button Declarations

     lazy var JWIMETVAPostButton: UIButton = {
        let JWIMETVAPostButton = UIButton()
       
        JWIMETVAPostButton.setBackgroundImage(JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JwiMepost"), for: .normal)
        JWIMETVAPostButton.setBackgroundImage(JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JwiMepostSel"), for: .selected)
        JWIMETVAPostButton.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVAPostButton
    }()
    
    lazy var JWIMETVAFollowedButton: UIButton = {
        let JWIMETVAPostButton = UIButton()
        JWIMETVAPostButton.setBackgroundImage(JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JwiMefollosowe"), for: .normal)
        JWIMETVAPostButton.setBackgroundImage(JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JwiMefollos"), for: .selected)
        JWIMETVAPostButton.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVAPostButton
    }()
    
     let JWIMETVAPostCreateButton: UIButton = {
        let JWIMETVAPostCreateButton = UIButton()
        JWIMETVAPostCreateButton.setBackgroundImage(JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JwiMepostcenterl"), for: .normal)
        JWIMETVAPostCreateButton.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVAPostCreateButton
    }()
    
 

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        JWIMETVAPostButton.isSelected = true
        addSubview(JWIMETVAContentView)
        self.addSubview(JWIMETVAPostButton)
        self.addSubview(JWIMETVAFollowedButton)
        self.addSubview(JWIMETVAPostCreateButton)
        
        NSLayoutConstraint.activate([
            JWIMETVAContentView.topAnchor.constraint(equalTo:self.topAnchor, constant: 0),
            JWIMETVAContentView.leadingAnchor.constraint(equalTo:self.leadingAnchor, constant: 0),
            JWIMETVAContentView.trailingAnchor.constraint(equalTo:self.trailingAnchor, constant: 0),
            JWIMETVAContentView.heightAnchor.constraint(equalToConstant: 228),
            // Post Button
            JWIMETVAPostButton.topAnchor.constraint(equalTo: JWIMETVAContentView.bottomAnchor, constant: 20),
            JWIMETVAPostButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            JWIMETVAPostButton.heightAnchor.constraint(equalToConstant: 37),
            JWIMETVAPostButton.widthAnchor.constraint(equalToConstant: 107),
            // Followed Button
            JWIMETVAFollowedButton.topAnchor.constraint(equalTo: JWIMETVAContentView.bottomAnchor, constant: 20),
            JWIMETVAFollowedButton.leadingAnchor.constraint(equalTo: JWIMETVAPostButton.trailingAnchor, constant: 10),
            JWIMETVAFollowedButton.heightAnchor.constraint(equalToConstant: 37),
            JWIMETVAFollowedButton.widthAnchor.constraint(equalToConstant: 107),
            
            // Post Create Button
            JWIMETVAPostCreateButton.centerYAnchor.constraint(equalTo: JWIMETVAPostButton.centerYAnchor),
            JWIMETVAPostCreateButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            JWIMETVAPostCreateButton.widthAnchor.constraint(equalToConstant: 62),
            JWIMETVAPostCreateButton.heightAnchor.constraint(equalToConstant: 37),
            
          
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
}


class JWIMETVASCommuactiveCell: UICollectionViewCell {
    
    private let JWIMETVAActivityImage: UIImageView = {
        let JWIMETVAActivityImage = UIImageView()
        JWIMETVAActivityImage.contentMode = .scaleAspectFill
        JWIMETVAActivityImage.layer.cornerRadius = 12
        JWIMETVAActivityImage.layer.masksToBounds = true
       
        JWIMETVAActivityImage.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVAActivityImage
    }()
    
    
    private let JWIMETVAindusiImage: UIImageView = {
        let JWIMETVAActivityImage = UIImageView.init(image: JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMErvTrailWander"))
       
        JWIMETVAActivityImage.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVAActivityImage
    }()
    
    private let JWIMETVAGradientOverlay: CAGradientLayer = {
        let JWIMETVAGradientOverlay = CAGradientLayer()
        JWIMETVAGradientOverlay.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.6).cgColor]
        return JWIMETVAGradientOverlay
    }()
    
    private let JWIMETVANameLabel: UILabel = {
        let JWIMETVANameLabel = UILabel()
        JWIMETVANameLabel.textColor = .white
        JWIMETVANameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        JWIMETVANameLabel.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVANameLabel
    }()
    
    private let JWIMETVAtimeButton: UIButton = {
        let JWIMETVAJoinButton = UIButton()
       
        JWIMETVAJoinButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        JWIMETVAJoinButton.setTitleColor(.white, for: .normal)
        JWIMETVAJoinButton.setImage(JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMErvExploreCircle"), for: .normal)
        JWIMETVAJoinButton.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVAJoinButton
    }()
    
    private let JWIMETVAlocationBtton: UIButton = {
        let JWIMETVAJoinButton = UIButton()
       
        JWIMETVAJoinButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        JWIMETVAJoinButton.setTitleColor(.white, for: .normal)
        JWIMETVAJoinButton.setImage(JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMErvForestEcho"), for: .normal)
        JWIMETVAJoinButton.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVAJoinButton
    }()
    private let JWIMETVAjoincountLabel: UILabel = {
        let JWIMETVADetailsLabel = UILabel()
        JWIMETVADetailsLabel.textColor = .lightGray
        JWIMETVADetailsLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        
        JWIMETVADetailsLabel.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVADetailsLabel
    }()
    
    private let JWIMETVAJoinButton: UIButton = {
        let JWIMETVAJoinButton = UIButton()
        JWIMETVAJoinButton.setBackgroundImage(JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JwiMetojoin"), for: .normal)
        JWIMETVAJoinButton.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVAJoinButton
    }()
    
    private let JWIMETVAPadding: CGFloat = 16
    private let JWIMETVABorderOffset: CGFloat = 8

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.JWIMETVAPlaceElements()
        self.JWIMETVABuildLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("JWIMETVAInitCoderNotImplemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        self.JWIMETVAGradientOverlay.frame = self.JWIMETVAActivityImage.bounds
    }
    
    private func JWIMETVAPlaceElements() {
        self.addSubview(JWIMETVAActivityImage)
        self.JWIMETVAActivityImage.layer.addSublayer(JWIMETVAGradientOverlay)
        self.addSubview(JWIMETVANameLabel)
        self.addSubview(JWIMETVAindusiImage)
        
        self.addSubview(JWIMETVAtimeButton)
        self.addSubview(JWIMETVAlocationBtton)
        
        
        self.addSubview(JWIMETVAjoincountLabel)
        self.addSubview(JWIMETVAJoinButton)
       
    }

    private func JWIMETVABuildLayouts() {
        NSLayoutConstraint.activate([
            // Activity Image
            JWIMETVAActivityImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            JWIMETVAActivityImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            JWIMETVAActivityImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            JWIMETVAActivityImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:0),
            
            // Name Label
            JWIMETVANameLabel.leadingAnchor.constraint(equalTo: JWIMETVAActivityImage.leadingAnchor, constant: 10),
            JWIMETVANameLabel.bottomAnchor.constraint(equalTo: JWIMETVAActivityImage.bottomAnchor, constant: -64),
            JWIMETVANameLabel.widthAnchor.constraint(equalToConstant: 165),
            
            JWIMETVAindusiImage.trailingAnchor.constraint(equalTo: JWIMETVAActivityImage.trailingAnchor, constant: -10),
            JWIMETVAindusiImage.centerYAnchor.constraint(equalTo: JWIMETVANameLabel.centerYAnchor, constant: 0),
            JWIMETVAindusiImage.widthAnchor.constraint(equalToConstant: 65),
            JWIMETVAindusiImage.heightAnchor.constraint(equalToConstant: 17),
            
            
            // Details Label
            JWIMETVAjoincountLabel.leadingAnchor.constraint(equalTo: JWIMETVANameLabel.leadingAnchor),
            JWIMETVAjoincountLabel.bottomAnchor.constraint(equalTo: JWIMETVAActivityImage.bottomAnchor, constant: -JWIMETVAPadding),
           
            
            JWIMETVAtimeButton.leadingAnchor.constraint(equalTo: JWIMETVANameLabel.leadingAnchor),
            JWIMETVAtimeButton.topAnchor.constraint(equalTo: JWIMETVANameLabel.bottomAnchor, constant: 6),
            JWIMETVAtimeButton.widthAnchor.constraint(equalToConstant: 105),
            JWIMETVAtimeButton.heightAnchor.constraint(equalToConstant: 18),
            
            
            JWIMETVAlocationBtton.leadingAnchor.constraint(equalTo: JWIMETVAtimeButton.trailingAnchor,constant: 20),
            JWIMETVAlocationBtton.topAnchor.constraint(equalTo: JWIMETVANameLabel.bottomAnchor, constant: 6),
            JWIMETVAlocationBtton.widthAnchor.constraint(equalToConstant: 85),
            JWIMETVAlocationBtton.heightAnchor.constraint(equalToConstant: 18),
            
            
            JWIMETVAjoincountLabel.leadingAnchor.constraint(equalTo: JWIMETVANameLabel.trailingAnchor,constant: 0),
            JWIMETVAjoincountLabel.topAnchor.constraint(equalTo: JWIMETVAlocationBtton.bottomAnchor,constant: 8),
            
            
            
            // Join Button
            JWIMETVAJoinButton.trailingAnchor.constraint(equalTo: JWIMETVAActivityImage.trailingAnchor, constant: -10),
            JWIMETVAJoinButton.bottomAnchor.constraint(equalTo: JWIMETVAActivityImage.bottomAnchor, constant: -10),
            JWIMETVAJoinButton.widthAnchor.constraint(equalToConstant: 70),
            JWIMETVAJoinButton.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
   

    func JWIMETVASetupContent(JWIMETVAStream: [String:Any]) {
        
        if let imgback = JWIMETVAStream["JWIMErvCampfireCrackle"] as? String {
            JWIMETVAActivityImage.JWIMErvCampfireAura(JWIMErvMountainRhythm: imgback)
        }
        
        JWIMETVANameLabel.text = JWIMETVAStream["JWIMErvAmbientSync"] as? String
        
        JWIMETVAtimeButton.setTitle(JWIMETVAStream["JWIMErvClipTrimTool"] as? String ?? "", for: .normal)
        
        JWIMETVAlocationBtton.setTitle(JWIMETVAStream["JWIMErvSceneSequencer"] as? String ?? "", for: .normal)
        JWIMETVAjoincountLabel.text = "\(JWIMETVAStream["JWIMErvWindLayerControl"] as? Int ?? 0) " + "JWIMETVAJoined".JWIMETVAtime
    }
    
    
}
