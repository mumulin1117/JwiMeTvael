import UIKit

// MARK: - Data Structure

struct JWIMETVAStreamModel {
    let JWIMETVAUserName: String
    let JWIMETVASubTitle: String
    let JWIMETVAIsLiveCount: Int
    let JWIMETVAImage: String
    let JWIMETVAPilotImage: String
}

// MARK: - JWIMETVAHomeExplorerPilot Class
//home
final class JWIMETVAHomeExplorerPilot: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // MARK: - Constants and State
    
    private let JWIMETVACellIdentifier = "JWIMETVAStreamContentCell"
    private let JWIMETVAHeaderHeight: CGFloat = 48
    private let JWIMETVATopMargin: CGFloat = 16
    private let JWIMETVALandingPadding: CGFloat = 16
    private let JWIMETVAButtonHeight: CGFloat = 36
    
    private var JWIMETVACurrentSelection: JWIMETVASortCategory = .popular
    
    private var JWIMETVADisplayData: Array<[String: Any]> = Array<[String: Any]>()
    
    enum JWIMETVASortCategory: String {
        case popular = "Popular"
        case new = "New"
        case moment = "Moment"
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
    
    
    @objc func JWIMETVAOlivia()  {
        let vc = JWIMETVACreateStreamPilot.init(JWIMErvPathwayRhythm: .JWIMErvSkyTrailBound,JWIMErvNatureDrift:false)
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @objc func JWIMETVAOrepoer()  {
        let vc = JWIMETVACreateStreamPilot.init(JWIMErvPathwayRhythm: .JWIMErvTrailExperience,JWIMErvNatureDrift:false)
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        
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
        let JWIMETVALayout = UICollectionViewFlowLayout()
        JWIMETVALayout.scrollDirection = .vertical
        JWIMETVALayout.minimumLineSpacing = 20
        JWIMETVALayout.minimumInteritemSpacing = 12
        
        let JWIMETVAContentView = UICollectionView(frame: .zero, collectionViewLayout: JWIMETVALayout)
        JWIMETVAContentView.backgroundColor = .black
        JWIMETVAContentView.translatesAutoresizingMaskIntoConstraints = false
        JWIMETVAContentView.dataSource = self
        JWIMETVAContentView.delegate = self
        JWIMETVAContentView.register(JWIMETVAStreamContentCell.self, forCellWithReuseIdentifier: JWIMETVACellIdentifier)
        return JWIMETVAContentView
    }()

    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(jwimeTimingBelt)
        JWIMETVAPopularButton.isSelected = true
        self.JWIMETVAConfigureView()
        self.JWIMETVAPlaceComponents()
        self.JWIMETVAApplyLayouts()
        self.JWIMETVAInitializeData()
//        self.JWIMETVAUpdateSortVisuals(JWIMETVACurrentSelection)
    }

    // MARK: - Setup and Configuration

    private func JWIMETVAConfigureView() {
        self.view.backgroundColor = .black
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
    
    // MARK: - Data and State Management

    private func JWIMETVAInitializeData() {
        var seletype:Int = 0
        if JWIMETVACurrentSelection == .moment {
            seletype =  0
        }
        
        if JWIMETVACurrentSelection == .new {
            seletype =  1
        }
        
        if JWIMETVACurrentSelection == .popular {
            seletype =  2
        }
        JWIMETVAAppIndicatorMannager.JWIMETVAshow(JWIMETVAinfo: "Loading....")
        JWIMErvReadingNook.JWIMErvSoftCloseHinge(JWIMErvDrawerSilentGlide: "/zbirbz/dyodyjwwrsjyk", JWIMErvCargoSafetyLatch: ["JWIMErvTripSegment":"72454862","JWIMErvTravelJournal":10,"JWIMErvRouteDiary":seletype]) { JWIMETVAsresult in
            JWIMETVAAppIndicatorMannager.JWIMETVAdismiss()
            if let FMberRECglsss = JWIMETVAsresult as? [String: Any],
                              
                let FMberRECrns = FMberRECglsss["data"] as? Array<[String: Any]> {
                self.JWIMETVADisplayData = FMberRECrns
                self.JWIMETVAContentView.reloadData()
          
            }
        } JWIMErvHighAltitudeTune: { JWIMETVAerrorot in
            JWIMETVAAppIndicatorMannager.JWIMETVAdismiss()
           
        }

       
    }

   
    private func JWIMETVAUpdateSortVisuals(_ JWIMETVASelected: JWIMETVASortCategory) {
        if JWIMETVASelected == .popular {
            self.JWIMETVAPopularButton.isSelected = true
            self.JWIMETVANewButton.isSelected = false
            self.JWIMETVAMomentButton.isSelected = false
        }
        
        if JWIMETVASelected == .new {
            self.JWIMETVAPopularButton.isSelected = false
            self.JWIMETVANewButton.isSelected = true
            self.JWIMETVAMomentButton.isSelected = false
        }
        
        if JWIMETVASelected == .moment {
            self.JWIMETVAPopularButton.isSelected = false
            self.JWIMETVANewButton.isSelected = false
            self.JWIMETVAMomentButton.isSelected = true
        }
    }

    // MARK: - Action Handlers

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

    // MARK: - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.JWIMETVADisplayData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let JWIMETVACell = collectionView.dequeueReusableCell(withReuseIdentifier: JWIMETVACellIdentifier, for: indexPath) as? JWIMETVAStreamContentCell else {
            return UICollectionViewCell()
        }
        let JWIMETVAModel = self.JWIMETVADisplayData[indexPath.item]
        JWIMETVACell.JWIMETVASetupContent(JWIMETVAStream: JWIMETVAModel)
        return JWIMETVACell
    }

    // MARK: - UICollectionViewDelegateFlowLayout

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let JWIMETVACellWidth = (collectionView.bounds.width - JWIMETVALandingPadding) / 2
        let JWIMETVACellHeight = JWIMETVACellWidth * 1.5 // Aspect ratio based on image
        return CGSize(width: JWIMETVACellWidth, height: JWIMETVACellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if  let JWIMETVAidRoom  = self.JWIMETVADisplayData[indexPath.item]["JWIMErvMemoryCapture"] as? Int {
            if let JWIMErvShotComposition  = self.JWIMETVADisplayData[indexPath.item]["JWIMErvShotComposition"]  as? Int {
                if JWIMErvShotComposition == -1 {//
                    let vc = JWIMETVACreateStreamPilot.init(JWIMErvPathwayRhythm: .JWIMErvCabinAtmosphere,JWIMErvNomadFlow: "\(JWIMETVAidRoom)",JWIMErvNatureDrift:false)
                    vc.hidesBottomBarWhenPushed = true
                    self.navigationController?.pushViewController(vc, animated: true)
                    return
                }
                
                
            }
            
            if let JuiduidRoom  = self.JWIMETVADisplayData[indexPath.item]["JWIMErvSunsetFrame"] {
                let vc = JWIMETVACreateStreamPilot.init(JWIMErvPathwayRhythm: .JWIMErvCabinAtmosphere,JWIMErvNomadFlow: "\(JWIMETVAidRoom)&userId=\(JuiduidRoom)",JWIMErvNatureDrift:false)
                vc.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
           
        }
    }
}

