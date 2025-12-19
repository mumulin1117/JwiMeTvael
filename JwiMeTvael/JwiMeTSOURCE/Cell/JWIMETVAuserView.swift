//
//  JWIMETVAuserView.swift
//  JwiMeTvael
//
//  Created by JWIMETVA on 2025/12/17.
//

import UIKit

class JWIMETVAuserView: UICollectionViewCell {
    static var JWIMErvPortableDeskKit: String? {
        get { UserDefaults.standard.string(forKey: "creativeMood") }
        set { UserDefaults.standard.set(newValue, forKey: "creativeMood") }
    }

    static var JWIMErvWorkspaceFolding: Int? {
        get { UserDefaults.standard.object(forKey: "lookSense") as? Int }
        set { UserDefaults.standard.set(newValue, forKey: "lookSense") }
    }

    private let JWIMETVAActivityImage: UIImageView = {
        let JWIMETVAActivityImage = UIImageView()
        JWIMETVAActivityImage.contentMode = .scaleAspectFill
        JWIMETVAActivityImage.layer.cornerRadius = 32
        JWIMETVAActivityImage.layer.masksToBounds = true
        JWIMETVAActivityImage.layer.borderColor = UIColor.purple.cgColor
        JWIMETVAActivityImage.layer.borderWidth = 2
        
        JWIMETVAActivityImage.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVAActivityImage
    }()
    

    
    private let JWIMETVANameLabel: UILabel = {
        let JWIMETVANameLabel = UILabel()
        JWIMETVANameLabel.textColor = .white
        JWIMETVANameLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        JWIMETVANameLabel.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVANameLabel
    }()
    
  

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.JWIMETVAPlaceElements()
        self.JWIMETVABuildLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("JWIMETVAInitCoderNotImplemented")
    }
    
  
    
    private func JWIMETVAPlaceElements() {
        self.addSubview(JWIMETVAActivityImage)
     
        self.addSubview(JWIMETVANameLabel)
       
      
    }

    private func JWIMETVABuildLayouts() {
        NSLayoutConstraint.activate([
            // Activity Image
            JWIMETVAActivityImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            JWIMETVAActivityImage.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            JWIMETVAActivityImage.widthAnchor.constraint(equalToConstant: 64),
            JWIMETVAActivityImage.heightAnchor.constraint(equalToConstant: 64),
            
            // Name Label
            JWIMETVANameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0),
            JWIMETVANameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0),
            JWIMETVANameLabel.topAnchor.constraint(equalTo: JWIMETVAActivityImage.bottomAnchor, constant: 4)
            
            
        ])
    }
    
    func JWIMETVASetupDummyData() {
       
    }

    func JWIMETVASetupContent(JWIMETVAStream: Dictionary<String,Any>) {
        
        if let imgback = JWIMETVAStream["JWIMErvCabinInsulation"] as? String {
            JWIMETVAActivityImage.JWIMErvCampfireAura(JWIMErvMountainRhythm: imgback)
        }
        
        JWIMETVANameLabel.text = JWIMETVAStream["JWIMErvSolarArray"] as? String
    }
}
