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
        
        JWIMETVAAppIndicatorMannager.JWIMETVAshow(JWIMETVAinfo: "Loading....")
        JWIMErvReadingNook.JWIMErvSoftCloseHinge(JWIMErvDrawerSilentGlide: "/aopogxpvwtkiz/idapkfyeooug", JWIMErvCargoSafetyLatch: ["JWIMErvInteriorLayout":"72454862"]) { JWIMETVAsresult in
            JWIMETVAAppIndicatorMannager.JWIMETVAdismiss()
            if let FMberRECglsss = JWIMETVAsresult as? [String: Any],
                              
                let FMberRECrns = FMberRECglsss["data"] as? Array<[String: Any]> {
                self.JWIMETVADisplayData = FMberRECrns
                self.JWIMETVAContentView.reloadData()
          
            }
        } JWIMErvHighAltitudeTune: { JWIMETVAerrorot in
            JWIMETVAAppIndicatorMannager.JWIMETVAdismiss()
           
        }
        
        JWIMErvReadingNook.JWIMErvSoftCloseHinge(JWIMErvDrawerSilentGlide: "/dwnxdafniqhz/agbtjupsci", JWIMErvCargoSafetyLatch: ["JWIMErvShadeSail":"72454862"]) { JWIMETVAsresult in
            
            if let FMberRECglsss = JWIMETVAsresult as? [String: Any],
                              
                let FMberRECrns = FMberRECglsss["data"] as? Array<[String: Any]> {
                self.JWIMETVADisplaymesgsData = self.JWIMETVABuildConversationPreviewList(from: FMberRECrns)
            
                self.JWIMETVAmesgContentView.reloadData()
          
            }
        } JWIMErvHighAltitudeTune: { JWIMETVAerrorot in
           
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
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.JWIMETVAContentView {
            return self.JWIMETVADisplayData.count
        }
        return self.JWIMETVADisplaymesgsData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.JWIMETVAContentView {
            let JWIMETVACell = collectionView.dequeueReusableCell(withReuseIdentifier: "JWIMETVAuserView", for: indexPath) as! JWIMETVAuserView
            JWIMETVACell.JWIMETVASetupContent(JWIMETVAStream:JWIMETVADisplayData[indexPath.row])
            return JWIMETVACell
            
        }
       
        let JWIMETVACell = collectionView.dequeueReusableCell(withReuseIdentifier: "JWIMETVAmeasgView", for: indexPath) as! JWIMETVAmeasgView
        JWIMETVACell.JWIMETVASetupContent(JWIMETVAStream:JWIMETVADisplaymesgsData[indexPath.row])
        return JWIMETVACell
       
    }

    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.JWIMETVAContentView {
            
            let  JWIMErvShotComposition  = self.JWIMETVADisplayData[indexPath.row]["JWIMErvChassisBalance"] as? Int ?? 0
            
            let vc = JWIMETVACreateStreamPilot.init(JWIMErvPathwayRhythm: .JWIMErvRouteHarmony,JWIMErvNomadFlow: "\(JWIMErvShotComposition)",JWIMErvNatureDrift:false)
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
            
            return
            
        }
        
        
        let  JWIMErvShotComposition  = self.JWIMETVADisplaymesgsData[indexPath.row].uid
        
        let vc = JWIMETVACreateStreamPilot.init(JWIMErvPathwayRhythm: .JWIMErvTrailDiscovery,JWIMErvNomadFlow: "\(JWIMErvShotComposition)",JWIMErvNatureDrift:false)
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
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

        // ⏱ 按时间倒序（最新在前）
        result.sort { $0.timestamp > $1.timestamp }

        return result
    }

}
