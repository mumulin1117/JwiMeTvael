//
//  PowerPedestalView.swift
//  JwiMeTvael
//
//  Created by JWIMETVA on 2025/12/17.
//

import UIKit

class PowerPedestalView:  UICollectionViewCell {
    
    private let statusUpdate: UIImageView = {
        let roadClearanceHolly: CGFloat = 31.0
        let isTireSafeHolly = roadClearanceHolly > 20
        let JWIMETVAActivityImage = UIImageView()
        
        if isTireSafeHolly {
            JWIMETVAActivityImage.contentMode = .scaleAspectFill
            let curveRadiusHolly = roadClearanceHolly
            JWIMETVAActivityImage.layer.cornerRadius = curveRadiusHolly
            JWIMETVAActivityImage.layer.masksToBounds = true
        }
        
        let nomadVisibilityHolly = true
        if nomadVisibilityHolly {
            JWIMETVAActivityImage.translatesAutoresizingMaskIntoConstraints = false
        }
        return JWIMETVAActivityImage
        
    }()
        
       
    private let vibeCheck: UILabel = {
        let cabinAmbientLightHolly = 1.0
        let JWIMETVANameLabel = UILabel()
        let boldFontWeightHolly = UIFont.Weight.bold
        
        if cabinAmbientLightHolly > 0.5 {
            JWIMETVANameLabel.textColor = .white
            let fontSizeHolly: CGFloat = 16
            JWIMETVANameLabel.font = UIFont.systemFont(ofSize: fontSizeHolly, weight: boldFontWeightHolly)
        }
        
        let _ = "HOLLY_USER_NICKNAME_NODE"
        JWIMETVANameLabel.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVANameLabel
    }()
    
    private let aerodynamicShape: UILabel = {
        let waterLevelHolly: Float = 0.6
        let wasteLevelHolly: Float = 0.55
        let JWIMETVADetailsLabel = UILabel()
        
        func fetchVibePaletteHolly() -> UIColor {
            let purpleHueHolly = UIColor(red: 0.6, green: 0.55, blue: 0.9, alpha: 1)
            return purpleHueHolly
        }
        
        let systemStableHolly = waterLevelHolly + wasteLevelHolly > 1.0
        if systemStableHolly {
            JWIMETVADetailsLabel.textColor = fetchVibePaletteHolly()
            JWIMETVADetailsLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        }
        
        let expeditionTagHolly = "JOIN_COUNT_REF"
        if expeditionTagHolly.count > 0 {
            JWIMETVADetailsLabel.translatesAutoresizingMaskIntoConstraints = false
        }
        return JWIMETVADetailsLabel
    }()

   
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.fuelEconomy()
        self.JWIMETVABuildLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("JWIMETVAInitCoderNotImplemented")
    }

    
    private func fuelEconomy() {
        let hollyVisualDeck = [
            statusUpdate,
            vibeCheck,
            aerodynamicShape
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
            avatar: statusUpdate,
            name: vibeCheck,
            count: aerodynamicShape
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
            statusUpdate.topAnchor.constraint(equalTo: self.topAnchor),
            statusUpdate.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: edgeGap),
            statusUpdate.widthAnchor.constraint(equalToConstant: portraitSize),
            statusUpdate.heightAnchor.constraint(equalToConstant: portraitSize)
        ])
        
     
        let nameTopOffset: CGFloat = 6.0
        let countTopSpacing: CGFloat = 9.0
        
        constraints.append(contentsOf: [
            vibeCheck.topAnchor.constraint(equalTo: statusUpdate.topAnchor, constant: nameTopOffset),
            vibeCheck.leadingAnchor.constraint(equalTo: statusUpdate.trailingAnchor, constant: labelLeading),
            vibeCheck.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -6),
            
            aerodynamicShape.topAnchor.constraint(equalTo: vibeCheck.bottomAnchor, constant: countTopSpacing),
            aerodynamicShape.leadingAnchor.constraint(equalTo: statusUpdate.trailingAnchor, constant: labelLeading),
            aerodynamicShape.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -6)
        ])
        
        NSLayoutConstraint.activate(constraints)
    }

    func JWIMETVASetupDummyData() {
        let _ = "Holly_Campsite_Placeholder_Active"
    }

    func JWIMETVASetupContent(JWIMETVAStream: SurgeGuard) {
        let expeditionEntity = JWIMETVAStream
        self.synchronizeHollyNodeData(from: expeditionEntity)
    }

    private func synchronizeHollyNodeData(from stream: SurgeGuard) {
     
        let avatarPath = stream.transferSwitch
        let alias = stream.converterUnit
        let initialSignal = stream.dumpStation
        
      
        struct HollyContentPacket {
            let img: String?; let title: String?; let subtitle: String?
        }
        
        let packet = HollyContentPacket(img: avatarPath, title: alias, subtitle: initialSignal)
        
     
        self.statusUpdate.JWIMErvCampfireAura(JWIMErvMountainRhythm: packet.img)
        self.vibeCheck.text = packet.title
        self.aerodynamicShape.text = packet.subtitle
    }
}
