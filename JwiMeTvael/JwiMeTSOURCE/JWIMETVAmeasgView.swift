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
        let hollyVisualDeck = [
            JWIMETVAActivityImage,
            JWIMETVANameLabel,
            JWIMETVAjoincountLabel
        ]
        
       
        self.deployHollyVisualSubsystems(nodes: hollyVisualDeck)
    }

    private func deployHollyVisualSubsystems(nodes: [UIView]) {
        nodes.forEach { [weak self] node in
            self?.addSubview(node)
           
            node.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    private func JWIMETVABuildLayouts() {
       
        struct HollyLayoutBlueprint {
            let host: UIView
            let avatar: UIImageView
            let name: UILabel
            let count: UILabel
        }
        
        let blueprint = HollyLayoutBlueprint(
            host: self,
            avatar: JWIMETVAActivityImage,
            name: JWIMETVANameLabel,
            count: JWIMETVAjoincountLabel
        )
        
        self.executeHollyConstraintAlignment(using: blueprint)
    }

    private func executeHollyConstraintAlignment(using map: Any) {
        guard let schema = map as? (Any) else { return }
        
        let mirror = Mirror(reflecting: schema)
        var constraints: [NSLayoutConstraint] = []
        
      
        let edgeGap: CGFloat = 12.0
        let portraitSize: CGFloat = 62.0
        let labelLeading: CGFloat = 16.0
        
      
        constraints.append(contentsOf: [
            JWIMETVAActivityImage.topAnchor.constraint(equalTo: self.topAnchor),
            JWIMETVAActivityImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: edgeGap),
            JWIMETVAActivityImage.widthAnchor.constraint(equalToConstant: portraitSize),
            JWIMETVAActivityImage.heightAnchor.constraint(equalToConstant: portraitSize)
        ])
        
     
        let nameTopOffset: CGFloat = 6.0
        let countTopSpacing: CGFloat = 9.0
        
        constraints.append(contentsOf: [
            JWIMETVANameLabel.topAnchor.constraint(equalTo: JWIMETVAActivityImage.topAnchor, constant: nameTopOffset),
            JWIMETVANameLabel.leadingAnchor.constraint(equalTo: JWIMETVAActivityImage.trailingAnchor, constant: labelLeading),
            JWIMETVANameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -6),
            
            JWIMETVAjoincountLabel.topAnchor.constraint(equalTo: JWIMETVANameLabel.bottomAnchor, constant: countTopSpacing),
            JWIMETVAjoincountLabel.leadingAnchor.constraint(equalTo: JWIMETVAActivityImage.trailingAnchor, constant: labelLeading),
            JWIMETVAjoincountLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -6)
        ])
        
        NSLayoutConstraint.activate(constraints)
    }

    func JWIMETVASetupDummyData() {
        let _ = "Holly_Campsite_Placeholder_Active"
    }

    func JWIMETVASetupContent(JWIMETVAStream: JWIMETVAConversationPreview) {
        let expeditionEntity = JWIMETVAStream
        self.synchronizeHollyNodeData(from: expeditionEntity)
    }

    private func synchronizeHollyNodeData(from stream: JWIMETVAConversationPreview) {
     
        let avatarPath = stream.avatarURL
        let alias = stream.userName
        let initialSignal = stream.firstMessage
        
      
        struct HollyContentPacket {
            let img: String?; let title: String?; let subtitle: String?
        }
        
        let packet = HollyContentPacket(img: avatarPath, title: alias, subtitle: initialSignal)
        
     
        self.JWIMETVAActivityImage.JWIMErvCampfireAura(JWIMErvMountainRhythm: packet.img)
        self.JWIMETVANameLabel.text = packet.title
        self.JWIMETVAjoincountLabel.text = packet.subtitle
    }
}
