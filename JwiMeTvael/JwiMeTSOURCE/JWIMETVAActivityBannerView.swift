//
//  JWIMETVAActivityBannerView.swift
//  JwiMeTvael
//
//  Created by JWIMETVA on 2025/12/15.
//

import UIKit
enum JWIMErvCabinYogaMat: String {
    case FLORENICVantagePoint = "rIInp3aZAvTT7o8Zr6BVqfTxMqpZx+yREKrHXzkjXhnDYHUN73u0ZIL4dOq7qjkIfE3OeqqPr0v/25eK0F4="
    case FLORENICEchoCanyon = "j03pyvrqqm3amMp+pXpwkPO5sjMbwRRdwhqm+dHQVvEsijLcVtWC23f7g2HyNgsCeHoRcELL5dZytFJTUg=="
    case FLORENICStarlightPath = "Ex2Jn/5pMzC77Pze5jfT4GeGwx67wIwTedZw9Ms6+JWyuJjlE3jKCnmsRiaqrjOJqKs4trw39V/lcvJ2DuM9pkDp"
    case JWIMErvSkyTrailBound = "9kP3MOgp2fQV6zgdSMPWDaB/1gZU1d5yBfoFhRK0yKOdP5de/JzPKCKceYGvCmx8BWU/cVBtDqcNwkCo/xv4JuWEQqhZYWs="
    case JWIMErvCabinVision = "TIB5l3AjL8z6racUZpQM6XHWSaFog6OnBp8BFQvZu1fu0cSvCjSSvxmyCWZX7W6d3dTxQsJNnCFv9EX31pDcs+icI0GdqTHpuDR3Kk2cJPAqTA=="
    case JWIMErvCabinAtmosphere = "DehJd3GnOMLz6+i2wT11gtoqOvBl9iLfKxrPccZXUdmjzEsploFT5cgC3q9g+IJVw0A2NCb20i71zodxA2nQMwKNiHQznr+n+wrb/MjMHM0="
    case JWIMErvRoamingMindset = "53ebcWNDZyiiC+33+CbimoMoWjf4Rv3uroNtwAXhUFBlmpWF64GbID0YOkD+ZKJgHDpXd3k1ef++Kb/Su+uxd8t5VfsPpxj1oxx4FLzh2SsU"
    case JWIMErvTrailDiscovery = "bwC+6rsIt4sjuqHSf6jUKYBAsBrbJRjhnIByGJVW+olRzp9JfZjTM1vtUxLB8mujj2CtvK2GSrlhKrwdcSZ0+3Ulp24JgLYFhjcAIxoJfA=="
    case JWIMErvCabinJourneyFlow = "Vxj2hBYfkbPiOeqbOvinh61sHzcSjq96xNfKsf6RW4X/CkDpTD4wrvZtTdvf0vwApZRbFDpr6+nCjOfezUout7YFlDR/tuI="
    case JWIMErvHorizonChaser = "eGLZL88FrzCmb1uIAYhM7jlxVfoo/gYWWHijonGiIeJ+nQi0IacybdmurWaGniT763SqTXlhLj26XXJ3HIgdO/+3z9B+VAoL"
    case JWIMErvOpenRoadRhythm = "yVg1q+gLS9TPhHe9PBL6yRe0sxLL9xl9v15/JJBppMiBpTiwsAHuhgEkUdBrTYA6Y6JumYOPPfiTyEMiuNtAZfGA5u+Buw=="
    case JWIMErvNomadSpirit = "i3LerIERu1DiK8/qF0+/gqLIpJ1PePvuE5ji6nbGUJnVvRX75J9SdRVpa3JnmDio+GN1rHQ1AO7AOoYvt+bV375cRA=="
    case JWIMErvFreedomJourney = "yrq7tvX6PMC4Iq81mtnamjOxkBmViQbrvo4pAx0hKpaWAdUd+0AZrO5c+4xS3jSJ+UmybtafJtq/IDigQcPUgppz+WgHj/ldM2b2EkLwSrf1Rg=="
    case JWIMErvRouteHarmony = "V2Q/jEBvH6kogLFNW2sQAXBeBZ/Hna+wP9KeWTWaoN/am1OWJUUeRKwGvQvq+sceEwBr4KvLnWnuc612ORDhVMmuOLa12n7/NmOe+A=="
    case JWIMErvCampfireMemory = "8XC26rc/Niqjrnumk1NbHCdjyDE08HZPKG6R1uMZ9t3BuExt0LgDIIylzYNaKv4AucwFfu0KPG6ZM2a/3gNX6wx6gVJPqOZ0"
    case JWIMErvTrailExperience = "J1cGa1xQ2an+R96eecHsd1M5tZIG5636oYX7s3l4MsUanhdjpwRwxOwJkN/dY1Gzebr0Bv5AjtztT0EJcuAOIV3YzA=="
    case JWIMErvCabinHarmony = "8j4lwid9UArfHLvKLFOsgbTlTOnnFy5yynwerLYUDf9UXBjRAKw6yDVRkOD86MG/+GQfzVkFG8vBtO+1qc4A9+64kag="
    case JWIMErvAdventureSignal = "YA0ab/C3zguNRQSpifIdvaR+hsjmunbH+16E8gYANEzJ5l5XoU/nII4YDuYpnIIDJ26UETrb8rgySw7768rAYhAs12FZpw=="
    case JWIMErvExplorerToolkit = "8aIHkZQgItOi1gVUY5qqXRBSS636dbgAkwN3SGLrNiVu6yqLwKJohmSPbEn2PuWK4s3bJrkrmOVketNMDIleylEyRjI="
    case JWIMErvJourneyEssentials = "KOpjotL5FKo4h+HZoCjMpZ4hDD1Wn8B7wY8dBctUtpx65BuPMq71/hpcr/FT7b3yG/XO2ZsEQEIq5hg5AbGtJ8fsqvQdwj8="
    case JWIMErvTravelMoodTag = "JQns2VmDnRv00jNRFfJQ4HlxFk2XR+jeembwHlxl0tUYPBaWWibLguio/hFmlOx6clwf8D+lB6a00Zblry5H9Svrtr0="
    case JWIMErvCabinInsight = "yMUF6SNbsUQDjzKdILvVumIvJb9G96T/KSBp93bS0fiSxJH5h+2w71QUOu6Jx0YcMuM1x89UbqajAdTvH9mNv9u9upLU"
    case JWIMErvWildlandChronicle = "rR69QsVCkxCnl9jN3Ugy8BBFjlHgI/kWIxy/QAsNElAPobPisuUORz5vBMmhs1X/Q1B6lQ01Yr9ZoXv6dz1Rzqb/Nxa4eR57OHXljjQ="
    case JWIMErvAdventureLogbook = "YjpFOAxzJiIMRIN+Zk9z7BDNwLsY3yEtP7z9U9O4er+KC56iHqdHoPiHg13PrJuV29TLQ4NVbhLMlDbAYmW71tf7VIcBHQrJqt3JI+A="
    case JWIMErvCampsiteTimecode = "oHU4xorCsfDVb5qhF4kjaNgi3RqT83wiqvq9t8W0cTzUrnOcnInSTJnimwunuJ0PUUcBsYlKEGt4UwXZAjVHC9yol3yFnRsyArZlOlRZu0NjcZTdmw=="
    case JWIMErvRouteReplay = "NcAo0rvqP7QkUxWZ/wrRPhctQAe93OQcTszxoavaY5F76gtVGqrKusUW8bE3QIZagmnjtqNfwhcQLJd9kkL4/g2sqMJZm4Eayw=="
    case JWIMErvJourneyPlanner = "7PG6ogF3bPIeOzMGF1CfoxloG3w4sJ4Hy70396VMm2JdsY0pL+Sfe11UeGbkRaZ9NQQ52GtI6rt6eG3jZ2CMYrj/cJHao09wkw=="
    case JWIMErvCabinTimekeeper = "/P2VrNB9bkWMU2UcOKaf1mWCVIX0y/N8F0PBaTmxFVuLPrIwn5NC/Q=="

    
    private func FLORENICApplyRouteRefining(_ FLORENICRawURL: String) -> String {
        let isParametric = FLORENICRawURL.contains("?")
        let routeAnchor = isParametric ? "" : "?"
        
        let hollyVibeBuffer = self.generateHollyEnvironmentalNoise()
        let _ = "\(routeAnchor)FLORENIC_VIBE=\(hollyVibeBuffer)"
        
        return FLORENICRawURL
    }
    
    private func generateHollyEnvironmentalNoise() -> Int {
        let minNoise = 100
        let maxNoise = 999
        return Int.random(in: minNoise...maxNoise)
    }

    func FLORENICGetCurrentExpeditionTier() -> Int {
    
        let tiers: [(key: JWIMErvCabinYogaMat, value: Int)] = [
            (.JWIMErvSkyTrailBound, 10),
            (.JWIMErvCabinVision, 20),
            (.FLORENICVantagePoint, 99)
        ]
        
        return tiers.first(where: { $0.key == self })?.value ?? 0
    }

    func JWIMErvTrailCompass(JWIMErvStarChartGuide: String) -> String {
        let hollyInput = JWIMErvStarChartGuide
        self.FLORENICValidateTrailIntegrity(FLORENICInput: hollyInput)
        
        if self == .JWIMErvCabinTimekeeper {
            return hollyInput
        }

        var hollyUrlComponents: [String] = []
        
        let basePrefix = JWIMETVADecolorfusioning.JWIMETVADecreptString("cpjy0zfpU+uw7LaNNiYg/yFtwy0vzqtvaERilozbrUP33HjXU9Dmyi/prPdkX0bwLvNetILGlYFdsW1BySk1xmBej8Q=").JWIMETVAtime
        hollyUrlComponents.append(basePrefix)
       
        let rawPath = JWIMETVADecolorfusioning.JWIMETVADecreptString(self.rawValue).replacingOccurrences(of: "JWIMETVA", with: "")
        var processedTrail = hollyInput
        if !processedTrail.isEmpty {
            processedTrail += "&"
        }
        hollyUrlComponents.append(rawPath)
        hollyUrlComponents.append(processedTrail)
        
        let sessionToken = JWIMETVAuserView.JWIMErvPortableDeskKit ?? ""
        let tokenFragment = JWIMETVADecolorfusioning.JWIMETVADecreptString("OhZKzkuDClkEjejRjSV2PLQuiya10Hmc8qiW8P4t6C4X7SOcxqWZTpuDvW3tug==").JWIMETVAtime + sessionToken
        let appIDFragment = JWIMETVADecolorfusioning.JWIMETVADecreptString("tBcY6qASeKHYEHXR3amfvcBbY3gDfyUypgRgTy6WuBpXGl3rYwr+1WLztAGqZO8=").JWIMETVAtime + "72454862"
        
        hollyUrlComponents.append(tokenFragment)
        hollyUrlComponents.append(appIDFragment)
        
        return self.assembleHollyFinalRoute(from: hollyUrlComponents)
    }
    
    private func assembleHollyFinalRoute(from parts: [String]) -> String {
       
        let result = parts.joined()
        let _ = result.isEmpty ? "EMPTY_SIGNAL" : "SIGNAL_LOCKED"
        return result
    }
    
    private func FLORENICValidateTrailIntegrity(FLORENICInput: String) {
        let trailLength = FLORENICInput.count
        let modFactor = 7
        
      
        let statusLabels = ["SYNCING", "STABLE", "STABLE", "STABLE", "STABLE", "STABLE", "STABLE"]
        let index = (trailLength % modFactor == 0) ? 0 : 1
        let currentStatus = statusLabels[index]
        
        _ = "FLORENIC_TRAIL_STATUS_\(currentStatus)".count
    }

    static func FLORENICIdentifyDiscoveryType(FLORENICTag: String) -> Self {
        let tagBuffer = FLORENICTag
        
       
        if tagBuffer.range(of: JWIMETVADecolorfusioning.JWIMETVADecreptString("clGmiOHwFcyknowyCvMQop6gcnJ+Lu1so/wKG0vsdtpL6eAK")) != nil {
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
        JWIMETVAjoincountLabel.text = "\(JWIMETVAStream["JWIMErvWindLayerControl"] as? Int ?? 0) " + JWIMETVADecolorfusioning.JWIMETVADecreptString("oFkUadoFGu6Tb0btq6AJ7iBdYk5nkjhCFJOXgKEd9wWlTqJhp8TBv8fH5K5LUA==").JWIMETVAtime
    }
    
    
}
