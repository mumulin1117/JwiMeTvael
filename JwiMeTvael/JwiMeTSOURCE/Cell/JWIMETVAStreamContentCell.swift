//
//  JWIMETVAStreamContentCell.swift
//  JwiMeTvael
//
//  Created by  on 2025/12/18.
//

import UIKit
//live cell
final class JWIMETVAStreamContentCell: UICollectionViewCell {
    
    // MARK: - Component Declarations (Cell)

    private let JWIMETVABackgroundView: UIView = {
        let JWIMETVABackgroundView = UIView()
        JWIMETVABackgroundView.layer.cornerRadius = 16
        JWIMETVABackgroundView.layer.masksToBounds = true
        JWIMETVABackgroundView.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVABackgroundView
    }()

    private let JWIMETVAPosterImage: UIImageView = {
        let JWIMETVAPosterImage = UIImageView()
        JWIMETVAPosterImage.contentMode = .scaleAspectFill
        JWIMETVAPosterImage.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVAPosterImage
    }()
    //在线人数
    private let JWIMETVALiveCountDisplay: UIButton = {
        let JWIMETVALiveCountDisplay = UIButton()
        JWIMETVALiveCountDisplay.setTitleColor(.black, for: .normal)
        JWIMETVALiveCountDisplay.backgroundColor = UIColor.white
        
        JWIMETVALiveCountDisplay.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        JWIMETVALiveCountDisplay.layer.cornerRadius = 8
        JWIMETVALiveCountDisplay.isUserInteractionEnabled = false
        JWIMETVALiveCountDisplay.layer.masksToBounds = true
       
        JWIMETVALiveCountDisplay.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVALiveCountDisplay
    }()
    
    //more
     let JWIMETVALiveMoreDisplay: UIButton = {
        let JWIMETVALiveCountDisplay = UIButton()
       
        JWIMETVALiveCountDisplay.setImage(JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMEmore"), for: .normal)
        JWIMETVALiveCountDisplay.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVALiveCountDisplay
    }()

    private let JWIMETVAUserPhoto: UIImageView = {
        let JWIMETVAUserPhoto = UIImageView()
        JWIMETVAUserPhoto.contentMode = .scaleAspectFill
        JWIMETVAUserPhoto.layer.cornerRadius = 18 // Half of 36
        JWIMETVAUserPhoto.layer.masksToBounds = true
        JWIMETVAUserPhoto.layer.borderWidth = 1.5
        JWIMETVAUserPhoto.layer.borderColor = UIColor.white.cgColor
        JWIMETVAUserPhoto.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVAUserPhoto
    }()
    
    private let JWIMETVAPilotName: UILabel = {
        let JWIMETVAPilotName = UILabel()
        JWIMETVAPilotName.textColor = .white
        JWIMETVAPilotName.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        JWIMETVAPilotName.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVAPilotName
    }()
    
    private let JWIMETVASubstreamInfo: UILabel = {
        let JWIMETVASubstreamInfo = UILabel()
        JWIMETVASubstreamInfo.textColor = UIColor(red: 0.6, green: 0.55, blue: 0.9, alpha: 1)
        JWIMETVASubstreamInfo.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        JWIMETVASubstreamInfo.translatesAutoresizingMaskIntoConstraints = false
        return JWIMETVASubstreamInfo
    }()

    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.JWIMETVAPlaceElements()
        self.JWIMETVABuildLayouts()
    }

    required init?(coder: NSCoder) {
        fatalError("JWIMETVAInitCoderNotImplemented")
    }
    
    // MARK: - Setup and Layout

    private func JWIMETVAPlaceElements() {
        self.contentView.addSubview(JWIMETVABackgroundView)
        self.JWIMETVABackgroundView.addSubview(JWIMETVAPosterImage)
        self.JWIMETVABackgroundView.addSubview(JWIMETVALiveCountDisplay)
        self.JWIMETVABackgroundView.addSubview(JWIMETVALiveMoreDisplay)
        self.contentView.addSubview(JWIMETVAUserPhoto)
        self.contentView.addSubview(JWIMETVAPilotName)
        self.contentView.addSubview(JWIMETVASubstreamInfo)
    }

    private func JWIMETVABuildLayouts() {
        let JWIMETVAMiniPadding: CGFloat = 8
        let JWIMETVAPilotSize: CGFloat = 36
        
        NSLayoutConstraint.activate([
            // Background View (Full Cell Size)
            JWIMETVABackgroundView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            JWIMETVABackgroundView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            JWIMETVABackgroundView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            JWIMETVABackgroundView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.8),

            // Poster Image
            JWIMETVAPosterImage.topAnchor.constraint(equalTo: JWIMETVABackgroundView.topAnchor),
            JWIMETVAPosterImage.leadingAnchor.constraint(equalTo: JWIMETVABackgroundView.leadingAnchor),
            JWIMETVAPosterImage.trailingAnchor.constraint(equalTo: JWIMETVABackgroundView.trailingAnchor),
            JWIMETVAPosterImage.bottomAnchor.constraint(equalTo: JWIMETVABackgroundView.bottomAnchor),
            
            // Live Count Display
            JWIMETVALiveCountDisplay.topAnchor.constraint(equalTo: JWIMETVAPosterImage.topAnchor, constant: JWIMETVAMiniPadding),
            JWIMETVALiveCountDisplay.leadingAnchor.constraint(equalTo: JWIMETVAPosterImage.leadingAnchor, constant: JWIMETVAMiniPadding),
            JWIMETVALiveCountDisplay.heightAnchor.constraint(equalToConstant: 21),
            JWIMETVALiveCountDisplay.widthAnchor.constraint(equalToConstant: 86), // Custom width for "128 live now"
            
            
            JWIMETVALiveMoreDisplay.centerYAnchor.constraint(equalTo: JWIMETVALiveCountDisplay.centerYAnchor),
            JWIMETVALiveMoreDisplay.heightAnchor.constraint(equalToConstant: 21),
            JWIMETVALiveMoreDisplay.widthAnchor.constraint(equalToConstant: 21),
            JWIMETVALiveMoreDisplay.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -12),
            // User Photo
            JWIMETVAUserPhoto.topAnchor.constraint(equalTo: JWIMETVAPosterImage.bottomAnchor,constant: 10),
            JWIMETVAUserPhoto.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: JWIMETVAMiniPadding),
            JWIMETVAUserPhoto.widthAnchor.constraint(equalToConstant: 36),
            JWIMETVAUserPhoto.heightAnchor.constraint(equalToConstant: 36),
            
            // Pilot Name
            JWIMETVAPilotName.leadingAnchor.constraint(equalTo:JWIMETVAUserPhoto.trailingAnchor, constant: 6),
            JWIMETVAPilotName.topAnchor.constraint(equalTo: JWIMETVAUserPhoto.topAnchor, constant: 2),
            JWIMETVAPilotName.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -JWIMETVAMiniPadding),
            
            // Substream Info
            JWIMETVASubstreamInfo.leadingAnchor.constraint(equalTo: JWIMETVAPilotName.leadingAnchor),
            JWIMETVASubstreamInfo.topAnchor.constraint(equalTo: JWIMETVAPilotName.bottomAnchor, constant: 2),
            JWIMETVASubstreamInfo.trailingAnchor.constraint(equalTo: JWIMETVAPilotName.trailingAnchor)
        ])
    }
    
    // MARK: - Content Assignment

    func JWIMETVASetupContent(JWIMETVAStream: Dictionary<String,Any>) {

        let JWIMETVARandomInt = Int.random(in: 0...3)
        
        if let JWIMETVARback = JWIMETVAStream["JWIMErvHorizonViewfinder"] as? String {
            JWIMETVAPosterImage.JWIMErvCampfireAura(JWIMErvMountainRhythm:JWIMETVARback )
        }
        
        if JWIMETVAStream["JWIMErvShotComposition"] as? Int == 1 {
            JWIMETVALiveCountDisplay.setImage(JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMETVAitol"), for: .normal)
        }else{
            JWIMETVALiveCountDisplay.setImage(JWIMETVADecolorfusioning.JWIMETVADegarmentripple(JWIMETVADepaletteform: "JWIMEmusic"), for: .normal)
            JWIMETVALiveCountDisplay.setTitle("\(JWIMETVARandomInt) " + "JWIMETVAonline".JWIMETVAtime, for: .normal)
        }
        
       
        if let JWIMETVARback = JWIMETVAStream["JWIMErvFocusPeaking"] as? String {
            JWIMETVAUserPhoto.JWIMErvCampfireAura(JWIMErvMountainRhythm:JWIMETVARback )
        }
        
        JWIMETVAPilotName.text = JWIMETVAStream["JWIMErvSlowMoCapture"] as? String
        JWIMETVASubstreamInfo.text =  JWIMETVAStream["JWIMErvLensCleaningPad"] as? String
    }
}
