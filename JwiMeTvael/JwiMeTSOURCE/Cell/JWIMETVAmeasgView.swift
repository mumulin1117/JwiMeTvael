//
//  JWIMETVAmeasgView.swift
//  JwiMeTvael
//
//  Created by JWIMETVA on 2025/12/17.
//

import UIKit

class JWIMETVAmeasgView:  UICollectionViewCell {
    
    private let JWIMETVAActivityImage: UIImageView = {
        let JWIMETVAActivityImage = UIImageView()
        JWIMETVAActivityImage.contentMode = .scaleAspectFill
        JWIMETVAActivityImage.layer.cornerRadius = 31
        JWIMETVAActivityImage.layer.masksToBounds = true
       
        JWIMETVAActivityImage.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVAActivityImage
    }()
    
  
    private let JWIMETVANameLabel: UILabel = {
        let JWIMETVANameLabel = UILabel()
        JWIMETVANameLabel.textColor = .white
        JWIMETVANameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        JWIMETVANameLabel.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVANameLabel
    }()
    

    private let JWIMETVAjoincountLabel: UILabel = {
        let JWIMETVADetailsLabel = UILabel()
        JWIMETVADetailsLabel.textColor = UIColor(red: 0.6, green: 0.55, blue: 0.9, alpha: 1)
        JWIMETVADetailsLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        JWIMETVADetailsLabel.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVADetailsLabel
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
        self.addSubview(JWIMETVAjoincountLabel)
      
      
    }

    private func JWIMETVABuildLayouts() {
        NSLayoutConstraint.activate([
            // Activity Image
            JWIMETVAActivityImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            JWIMETVAActivityImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            JWIMETVAActivityImage.widthAnchor.constraint(equalToConstant: 62),
            JWIMETVAActivityImage.heightAnchor.constraint(equalToConstant: 62),
            
            // Name Label
            JWIMETVANameLabel.topAnchor.constraint(equalTo: self.JWIMETVAActivityImage.topAnchor, constant: 6),
            JWIMETVANameLabel.leadingAnchor.constraint(equalTo: JWIMETVAActivityImage.trailingAnchor, constant: 16),
            JWIMETVANameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -6),
            
            JWIMETVAjoincountLabel.topAnchor.constraint(equalTo: JWIMETVANameLabel.bottomAnchor, constant: 9),
            JWIMETVAjoincountLabel.leadingAnchor.constraint(equalTo: JWIMETVAActivityImage.trailingAnchor, constant: 16),
            JWIMETVANameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -6)
        ])
    }
    
    func JWIMETVASetupDummyData() {
       
    }

    func JWIMETVASetupContent(JWIMETVAStream: JWIMETVAConversationPreview) {
      let imgback = JWIMETVAStream.avatarURL
            JWIMETVAActivityImage.JWIMErvCampfireAura(JWIMErvMountainRhythm: imgback)
        
        
        JWIMETVANameLabel.text = JWIMETVAStream.userName
        JWIMETVAjoincountLabel.text = JWIMETVAStream.firstMessage
    }
}
