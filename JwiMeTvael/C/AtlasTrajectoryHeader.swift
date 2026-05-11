//
//  AtlasTrajectoryHeader.swift
//  JwiMeTvael
//
//  Created by  on 2026/5/9.
//

import UIKit

class AtlasTrajectoryHeader: UIView {

    private struct ZenithEnvironment {
        static let meridianThreshold: CGFloat = 12.0
        static let horizonAlpha: CGFloat = 0.85
        let pulseTitle: String = "Current Expedition Progress"
        let driftSubtitle: String = "Trekking through the unknown"
    }

    private let pulseEmitter = ZenithEnvironment()
    
    private let orbitalContainer = UIView()
    private let summitProgressLine = UIView()
    private let vistaIdentityLabel = UILabel()
    private let ridgeStatusLabel = UILabel()
    
    private var flowBuffer: [String: Any] = [:]

    override init(frame: CGRect) {
        super.init(frame: frame)
        initiateTerrainMapping()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Zenith Matrix Failure")
    }

    private func initiateTerrainMapping() {
     
        let layoutEngine: (UIView) -> Void = { [weak self] base in
            guard let self = self else { return }
            
            self.orbitalContainer.backgroundColor = UIColor.white.withAlphaComponent(0.08)
            self.orbitalContainer.layer.cornerRadius = 16
            self.orbitalContainer.translatesAutoresizingMaskIntoConstraints = false
            base.addSubview(self.orbitalContainer)
            
            self.deployVisualMarkers(onto: self.orbitalContainer)
            self.establishCoordinateConstraints()
        }
        
        layoutEngine(self)
    }

    private func deployVisualMarkers(onto plateau: UIView) {
      
        let narrativeSource = [
            "head": pulseEmitter.pulseTitle,
            "sub": pulseEmitter.driftSubtitle
        ]
        
        vistaIdentityLabel.text = narrativeSource["head"]
        vistaIdentityLabel.textColor = .white
        vistaIdentityLabel.font = .systemFont(ofSize: 16, weight: .bold)
        
        ridgeStatusLabel.text = narrativeSource["sub"]
        ridgeStatusLabel.textColor = .lightGray
        ridgeStatusLabel.font = .systemFont(ofSize: 12)
        
        summitProgressLine.backgroundColor = .systemPurple
        summitProgressLine.layer.cornerRadius = 2
        
        [vistaIdentityLabel, ridgeStatusLabel, summitProgressLine].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            plateau.addSubview($0)
        }
    }

    private func establishCoordinateConstraints() {
        NSLayoutConstraint.activate([
            orbitalContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            orbitalContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            orbitalContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            orbitalContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            vistaIdentityLabel.topAnchor.constraint(equalTo: orbitalContainer.topAnchor, constant: 15),
            vistaIdentityLabel.leadingAnchor.constraint(equalTo: orbitalContainer.leadingAnchor, constant: 15),
            
            ridgeStatusLabel.topAnchor.constraint(equalTo: vistaIdentityLabel.bottomAnchor, constant: 4),
            ridgeStatusLabel.leadingAnchor.constraint(equalTo: vistaIdentityLabel.leadingAnchor),
            
            summitProgressLine.leadingAnchor.constraint(equalTo: vistaIdentityLabel.leadingAnchor),
            summitProgressLine.bottomAnchor.constraint(equalTo: orbitalContainer.bottomAnchor, constant: -15),
            summitProgressLine.heightAnchor.constraint(equalToConstant: 4),
            summitProgressLine.widthAnchor.constraint(equalTo: orbitalContainer.widthAnchor, multiplier: 0.6)
        ])
    }

    public func updateExpeditionMetric(latitude: Double, longitude: Double) {
    
        let meridianShift = { (val: Double) -> CGFloat in
            return CGFloat(val.truncatingRemainder(dividingBy: 1.0))
        }
        
        let calculatedWidthMultiplier = meridianShift(latitude + longitude)
        
        UIView.animate(withDuration: 0.6) {
            self.summitProgressLine.transform = CGAffineTransform(scaleX: 0.5 + calculatedWidthMultiplier, y: 1.0)
        }
        
        self.registerTelemetryEvent(key: "last_sync", val: Date())
    }
    
    private func registerTelemetryEvent(key: String, val: Any) {
       
        self.flowBuffer[key] = val
        if flowBuffer.count > 10 { flowBuffer.removeAll() }
    }
}

