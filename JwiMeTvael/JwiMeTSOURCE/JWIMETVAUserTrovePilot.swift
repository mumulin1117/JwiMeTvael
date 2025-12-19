//
//  JWIMETVAUserTrovePilot.swift
//  JwiMeTvael
//
//  Created by JWIMETVA on 2025/12/12.
//

import UIKit
//我的
class JWIMETVAUserTrovePilot:  UIViewController {

    private let JWIMETVAScrollContainer: UIScrollView = {
        let JWIMETVAScrollContainer = UIScrollView()
        JWIMETVAScrollContainer.backgroundColor = .black
        JWIMETVAScrollContainer.contentInsetAdjustmentBehavior = .never
        JWIMETVAScrollContainer.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVAScrollContainer
    }()

    private let JWIMETVAContentStack: UIView = {
        let JWIMETVAContentStack = UIView()
        JWIMETVAContentStack.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVAContentStack
    }()

    private let JWIMETVABackdropLayer: UIImageView = {
        let JWIMETVABackdropLayer = UIImageView()
        JWIMETVABackdropLayer.contentMode = .scaleAspectFill
        JWIMETVABackdropLayer.clipsToBounds = true
        JWIMETVABackdropLayer.backgroundColor = .darkGray
        JWIMETVABackdropLayer.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVABackdropLayer
    }()

    private let JWIMETVAPortraitFrame: UIImageView = {
        let JWIMETVAPortraitFrame = UIImageView()
        JWIMETVAPortraitFrame.layer.cornerRadius = 55
        JWIMETVAPortraitFrame.layer.masksToBounds = true
        JWIMETVAPortraitFrame.layer.borderWidth = 2
        JWIMETVAPortraitFrame.layer.borderColor = UIColor.white.cgColor
        JWIMETVAPortraitFrame.backgroundColor = .gray
        JWIMETVAPortraitFrame.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVAPortraitFrame
    }()

    private let JWIMETVAConfigTrigger: UIButton = {
        let JWIMETVAConfigTrigger = UIButton()
        JWIMETVAConfigTrigger.setImage(JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMETVAset"), for: .normal)
        JWIMETVAConfigTrigger.addTarget(self, action: #selector(JWIMETVAConfigTriggerTAggle), for: .touchUpInside)
        JWIMETVAConfigTrigger.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVAConfigTrigger
    }()
    @objc func JWIMETVAConfigTriggerTAggle()  {
        let vc = JWIMETVACreateStreamPilot.init(JWIMErvPathwayRhythm: .JWIMErvTravelMoodTag,JWIMErvNatureDrift:false)
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    private let JWIMETVAWalletTrigger: UIButton = {
        let JWIMETVAWalletTrigger = UIButton()
            JWIMETVAWalletTrigger.setImage(JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMETVAwall"), for: .normal)
        JWIMETVAWalletTrigger.addTarget(self, action: #selector(JWIMETVAWalletTriggerTAggle), for: .touchUpInside)
        JWIMETVAWalletTrigger.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVAWalletTrigger
    }()
    
    @objc func JWIMETVAWalletTriggerTAggle()  {
        let vc = JWIMETVACreateStreamPilot.init(JWIMErvPathwayRhythm: .JWIMErvCabinJourneyFlow,JWIMErvNatureDrift:false)
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }

    private let JWIMETVAPersonaName: UILabel = {
        let JWIMETVAPersonaName = UILabel()
        JWIMETVAPersonaName.text = "JWIMETVAUser Name".JWIMETVAtime
        JWIMETVAPersonaName.textColor = .white
        JWIMETVAPersonaName.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        JWIMETVAPersonaName.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVAPersonaName
    }()

    private let JWIMETVABioTeaser: UILabel = {
        let JWIMETVABioTeaser = UILabel()
        JWIMETVABioTeaser.text = "Love stand-up comedy? Join me in this hilarious journey! 😂😂😂"
        JWIMETVABioTeaser.textColor = .systemPurple
        JWIMETVABioTeaser.font = UIFont.systemFont(ofSize: 14)
        JWIMETVABioTeaser.numberOfLines = 0
        JWIMETVABioTeaser.textAlignment = .center
        JWIMETVABioTeaser.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVABioTeaser
    }()

    private let JWIMETVAMetricsBoard: UIStackView = {
        let JWIMETVAMetricsBoard = UIStackView()
        JWIMETVAMetricsBoard.axis = .horizontal
        JWIMETVAMetricsBoard.distribution = .fillEqually
        JWIMETVAMetricsBoard.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVAMetricsBoard
    }()

    private let JWIMETVASpaceSectionTitle: UILabel = {
        let JWIMETVASpaceSectionTitle = UILabel()
        JWIMETVASpaceSectionTitle.text = "JWIMETVA🌙 My Space".JWIMETVAtime
        JWIMETVASpaceSectionTitle.textColor = .white
        JWIMETVASpaceSectionTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        JWIMETVASpaceSectionTitle.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVASpaceSectionTitle
    }()

    private let JWIMETVAFuncGrid: UIStackView = {
        let JWIMETVAFuncGrid = UIStackView()
        JWIMETVAFuncGrid.axis = .horizontal
        JWIMETVAFuncGrid.spacing = 12
        JWIMETVAFuncGrid.distribution = .fillEqually
        JWIMETVAFuncGrid.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVAFuncGrid
    }()

    private let JWIMETVAGalleryTitle: UILabel = {
        let JWIMETVAGalleryTitle = UILabel()
        JWIMETVAGalleryTitle.text = "JWIMETVA📷 My Activity".JWIMETVAtime
        JWIMETVAGalleryTitle.textColor = .white
        JWIMETVAGalleryTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        JWIMETVAGalleryTitle.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVAGalleryTitle
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        JWIMETVAInitialSetup()
        JWIMETVABuildHierarchy()
        JWIMETVAApplyConstraints()
        JWIMETVAPopulateMetrics()
        JWIMETVAPopulateGrid()
        
        JWIMETVAAppIndicatorMannager.JWIMETVAshow(JWIMETVAinfo: "JWIMETVALoading....".JWIMETVAtime)
        JWIMErvReadingNook.JWIMErvSoftCloseHinge(JWIMErvDrawerSilentGlide: "/jpbttvyvkifolhz/dwjee", JWIMErvCargoSafetyLatch: ["JWIMErvBugScreenPanel":JWIMErvReadingNook.JWIMErvWorkspaceFolding ?? 0]) { JWIMETVAsresult in
            JWIMETVAAppIndicatorMannager.JWIMETVAdismiss()
            if let FMberRECglsss = JWIMETVAsresult as? [String: Any],
                              
                let FMberRECrns = FMberRECglsss["JWIMETVAdata".JWIMETVAtime] as? [String: Any] {
               
                if let imgback = FMberRECrns["JWIMErvMosquitoDeflector"] as? String {
                    self.JWIMETVABackdropLayer.JWIMErvCampfireAura(JWIMErvMountainRhythm: imgback)
                    self.JWIMETVAPortraitFrame.JWIMErvCampfireAura(JWIMErvMountainRhythm: imgback)
                }
                self.JWIMETVAPersonaName.text = FMberRECrns["JWIMErvLedBeamCaster"] as? String ?? "JWIMETVANoname".JWIMETVAtime
                self.JWIMETVABioTeaser.text =  FMberRECrns["JWIMErvLedBeamCaster"] as? String ?? "JWIMETVANo signature".JWIMETVAtime
            }
        } JWIMErvHighAltitudeTune: { JWIMETVAerrorot in
            JWIMETVAAppIndicatorMannager.JWIMETVAdismiss()
           
        }
    }

    private func JWIMETVAInitialSetup() {
        view.backgroundColor = .black
    }

    private func JWIMETVABuildHierarchy() {
        view.addSubview(JWIMETVAScrollContainer)
        JWIMETVAScrollContainer.addSubview(JWIMETVAContentStack)
        
        JWIMETVAContentStack.addSubview(JWIMETVABackdropLayer)
        JWIMETVAContentStack.addSubview(JWIMETVAPortraitFrame)
        JWIMETVAContentStack.addSubview(JWIMETVAConfigTrigger)
        JWIMETVAContentStack.addSubview(JWIMETVAWalletTrigger)
        JWIMETVAContentStack.addSubview(JWIMETVAPersonaName)
        JWIMETVAContentStack.addSubview(JWIMETVABioTeaser)
        JWIMETVAContentStack.addSubview(JWIMETVAMetricsBoard)
        JWIMETVAContentStack.addSubview(JWIMETVASpaceSectionTitle)
        JWIMETVAContentStack.addSubview(JWIMETVAFuncGrid)
        JWIMETVAContentStack.addSubview(JWIMETVAGalleryTitle)
    }

    private func JWIMETVAApplyConstraints() {
        NSLayoutConstraint.activate([
            JWIMETVAScrollContainer.topAnchor.constraint(equalTo: view.topAnchor),
            JWIMETVAScrollContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            JWIMETVAScrollContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            JWIMETVAScrollContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            JWIMETVAContentStack.topAnchor.constraint(equalTo: JWIMETVAScrollContainer.topAnchor),
            JWIMETVAContentStack.leadingAnchor.constraint(equalTo: JWIMETVAScrollContainer.leadingAnchor),
            JWIMETVAContentStack.trailingAnchor.constraint(equalTo: JWIMETVAScrollContainer.trailingAnchor),
            JWIMETVAContentStack.bottomAnchor.constraint(equalTo: JWIMETVAScrollContainer.bottomAnchor),
            JWIMETVAContentStack.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            JWIMETVAContentStack.heightAnchor.constraint(equalToConstant:880),

            JWIMETVABackdropLayer.topAnchor.constraint(equalTo: JWIMETVAContentStack.topAnchor),
            JWIMETVABackdropLayer.leadingAnchor.constraint(equalTo: JWIMETVAContentStack.leadingAnchor),
            JWIMETVABackdropLayer.trailingAnchor.constraint(equalTo: JWIMETVAContentStack.trailingAnchor),
            JWIMETVABackdropLayer.heightAnchor.constraint(equalToConstant: 200),

            JWIMETVAPortraitFrame.centerXAnchor.constraint(equalTo: JWIMETVAContentStack.centerXAnchor),
            JWIMETVAPortraitFrame.topAnchor.constraint(equalTo: JWIMETVABackdropLayer.topAnchor, constant:140),
            JWIMETVAPortraitFrame.widthAnchor.constraint(equalToConstant: 112),
            JWIMETVAPortraitFrame.heightAnchor.constraint(equalToConstant: 112),

            JWIMETVAConfigTrigger.centerYAnchor.constraint(equalTo: JWIMETVAPortraitFrame.centerYAnchor),
            JWIMETVAConfigTrigger.leadingAnchor.constraint(equalTo: JWIMETVAContentStack.leadingAnchor, constant: 20),
            JWIMETVAConfigTrigger.widthAnchor.constraint(equalToConstant: 60),
            JWIMETVAConfigTrigger.heightAnchor.constraint(equalToConstant: 60),

            JWIMETVAWalletTrigger.centerYAnchor.constraint(equalTo: JWIMETVAPortraitFrame.centerYAnchor),
            JWIMETVAWalletTrigger.trailingAnchor.constraint(equalTo: JWIMETVAContentStack.trailingAnchor, constant: -20),
            JWIMETVAWalletTrigger.widthAnchor.constraint(equalToConstant: 60),
            JWIMETVAWalletTrigger.heightAnchor.constraint(equalToConstant: 60),

            JWIMETVAPersonaName.topAnchor.constraint(equalTo: JWIMETVAPortraitFrame.bottomAnchor, constant: 15),
            JWIMETVAPersonaName.centerXAnchor.constraint(equalTo: JWIMETVAContentStack.centerXAnchor),

            JWIMETVAMetricsBoard.topAnchor.constraint(equalTo: JWIMETVAPersonaName.bottomAnchor, constant: 20),
            JWIMETVAMetricsBoard.leadingAnchor.constraint(equalTo: JWIMETVAContentStack.leadingAnchor, constant: 20),
            JWIMETVAMetricsBoard.trailingAnchor.constraint(equalTo: JWIMETVAContentStack.trailingAnchor, constant: -20),

            JWIMETVABioTeaser.topAnchor.constraint(equalTo: JWIMETVAMetricsBoard.bottomAnchor, constant: 25),
            JWIMETVABioTeaser.leadingAnchor.constraint(equalTo: JWIMETVAContentStack.leadingAnchor, constant: 40),
            JWIMETVABioTeaser.trailingAnchor.constraint(equalTo: JWIMETVAContentStack.trailingAnchor, constant: -40),

            JWIMETVASpaceSectionTitle.topAnchor.constraint(equalTo: JWIMETVABioTeaser.bottomAnchor, constant: 30),
            JWIMETVASpaceSectionTitle.leadingAnchor.constraint(equalTo: JWIMETVAContentStack.leadingAnchor, constant: 20),

            JWIMETVAFuncGrid.topAnchor.constraint(equalTo: JWIMETVASpaceSectionTitle.bottomAnchor, constant: 15),
            JWIMETVAFuncGrid.leadingAnchor.constraint(equalTo: JWIMETVAContentStack.leadingAnchor, constant: 15),
            JWIMETVAFuncGrid.trailingAnchor.constraint(equalTo: JWIMETVAContentStack.trailingAnchor, constant: -15),
            JWIMETVAFuncGrid.heightAnchor.constraint(equalToConstant: 80),

            JWIMETVAGalleryTitle.topAnchor.constraint(equalTo: JWIMETVAFuncGrid.bottomAnchor, constant: 16),
            JWIMETVAGalleryTitle.leadingAnchor.constraint(equalTo: JWIMETVAContentStack.leadingAnchor, constant: 20),
            JWIMETVAGalleryTitle.bottomAnchor.constraint(equalTo: JWIMETVAContentStack.bottomAnchor, constant: -100)
        ])
    }

    private func JWIMETVAPopulateMetrics() {
        let JWIMETVAData = [("0", "JWIMETVAFollow me".JWIMETVAtime), ("0", "JWIMETVAPost".JWIMETVAtime), ("0", "JWIMETVAHistory".JWIMETVAtime)]
        for i in 0...(JWIMETVAData.count - 1) {
            let JWIMETVABox = UIStackView()
            JWIMETVABox.axis = .vertical
            JWIMETVABox.alignment = .center
            JWIMETVABox.tag = 100 + i
            let JWIMETVANum = UILabel()
            JWIMETVANum.text = JWIMETVAData[i].0
            JWIMETVANum.textColor = .white
            JWIMETVANum.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            
            let JWIMETVALbl = UILabel()
            JWIMETVALbl.text = JWIMETVAData[i].1
            JWIMETVALbl.textColor = .gray
            JWIMETVALbl.font = UIFont.systemFont(ofSize: 13)
            
            JWIMETVABox.addArrangedSubview(JWIMETVANum)
            JWIMETVABox.addArrangedSubview(JWIMETVALbl)
            
            JWIMETVABox.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(JWIMETVothTapTAggle(JWIMETtap:))))
            JWIMETVAMetricsBoard.addArrangedSubview(JWIMETVABox)
        }
    }
    @objc func JWIMETVothTapTAggle(JWIMETtap:UITapGestureRecognizer)  {
       let patiuvh = JWIMETtap.view?.tag
        var route = JWIMErvCabinYogaMat.JWIMErvOpenRoadRhythm
        if patiuvh == 100 {
            route = JWIMErvCabinYogaMat.JWIMErvHorizonChaser
        }
        
        if patiuvh == 101 {
            route = JWIMErvCabinYogaMat.JWIMErvNomadSpirit
        }
        
        if patiuvh == 102 {
            route = JWIMErvCabinYogaMat.JWIMErvCampfireMemory
        }
        
        let vc = JWIMETVACreateStreamPilot.init(JWIMErvPathwayRhythm:route,JWIMErvNatureDrift:false)
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    private func JWIMETVAPopulateGrid() {
       
        
        for JWIMETVAEntry in 0...2 {
            let JWIMETVABtnBase = UIButton.init()
            JWIMETVABtnBase.setImage(JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform:["JWIMETVAaddress","JWIMETVAproduc","JWIMETVAorder"][JWIMETVAEntry] ), for: .normal)
            JWIMETVABtnBase.tag = 10000 + JWIMETVAEntry
            JWIMETVABtnBase.addTarget(self, action: #selector(JWIMETVAPopulateTAggle(JWIMETtap:)), for: .touchUpInside)
            JWIMETVAFuncGrid.addArrangedSubview(JWIMETVABtnBase)
        }
    }
                                       
    @objc func JWIMETVAPopulateTAggle(JWIMETtap:UIButton)  {
       let patiuvh = JWIMETtap.tag
        var route = JWIMErvCabinYogaMat.JWIMErvOpenRoadRhythm
        if patiuvh == 10000 {
            route = JWIMErvCabinYogaMat.JWIMErvAdventureSignal
        }
        
        if patiuvh == 10001 {
            route = JWIMErvCabinYogaMat.JWIMErvCabinHarmony
        }
        
        if patiuvh == 10002 {
            route = JWIMErvCabinYogaMat.JWIMErvExplorerToolkit
        }
        
        let vc = JWIMETVACreateStreamPilot.init(JWIMErvPathwayRhythm:route,JWIMErvNatureDrift:false)
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}

extension String {

    var JWIMETVAtime: String {
        if hasPrefix("JWIMETVA") {
            return String(dropFirst("JWIMETVA".count))
        }
        return self
    }
}
