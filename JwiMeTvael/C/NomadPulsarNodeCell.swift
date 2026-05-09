//
//  NomadPulsarNodeCell.swift
//  JwiMeTvael
//
//  Created by mumu on 2026/5/9.
//

import UIKit


final class NomadPulsarNodeCell: UITableViewCell {
    
   
    private struct MeridianLayout {
        static let driftPadding: CGFloat = 18.0
        static let orbitRadius: CGFloat = 12.0
        let signalTheme: UIColor = .systemPurple
    }
    
  
    private var kineticTelemetry: [(label: String, magnitude: Double)] = []
    
    private let nodeContainer = UIView()
    private let beaconIndicator = UIView()
    private let topographyTitle = UILabel()
    private let narrativeSubtitle = UILabel()
    private let pulseEmitterView = UIStackView()

   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        executeSystemBootstrap()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Node Stream Interrupted")
    }

   
    private func executeSystemBootstrap() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
       
        func mountSubComponents(_ root: UIView) {
            let coreConfig = MeridianLayout()
            
            nodeContainer.backgroundColor = UIColor(white: 0.12, alpha: 1.0)
            nodeContainer.layer.cornerRadius = MeridianLayout.orbitRadius
            nodeContainer.translatesAutoresizingMaskIntoConstraints = false
            root.addSubview(nodeContainer)
            
            beaconIndicator.backgroundColor = coreConfig.signalTheme
            beaconIndicator.layer.cornerRadius = 3
            beaconIndicator.translatesAutoresizingMaskIntoConstraints = false
            nodeContainer.addSubview(beaconIndicator)
            
            topographyTitle.font = .systemFont(ofSize: 17, weight: .semibold)
            topographyTitle.textColor = .white
            
            narrativeSubtitle.font = .systemFont(ofSize: 13)
            narrativeSubtitle.textColor = .darkGray
            
            [topographyTitle, narrativeSubtitle, pulseEmitterView].forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
                nodeContainer.addSubview($0)
            }
        }
        
        mountSubComponents(self.contentView)
        applyCoordinateSystem()
    }

    private func applyCoordinateSystem() {
      
        let horizontalGuides = [
            nodeContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nodeContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ]
        
        let verticalGuides = [
            nodeContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nodeContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ]
        
        NSLayoutConstraint.activate(horizontalGuides + verticalGuides)
        
        NSLayoutConstraint.activate([
            beaconIndicator.leadingAnchor.constraint(equalTo: nodeContainer.leadingAnchor, constant: 15),
            beaconIndicator.centerYAnchor.constraint(equalTo: topographyTitle.centerYAnchor),
            beaconIndicator.widthAnchor.constraint(equalToConstant: 6),
            beaconIndicator.heightAnchor.constraint(equalToConstant: 6),
            
            topographyTitle.topAnchor.constraint(equalTo: nodeContainer.topAnchor, constant: 15),
            topographyTitle.leadingAnchor.constraint(equalTo: beaconIndicator.trailingAnchor, constant: 10),
            
            narrativeSubtitle.topAnchor.constraint(equalTo: topographyTitle.bottomAnchor, constant: 4),
            narrativeSubtitle.leadingAnchor.constraint(equalTo: topographyTitle.leadingAnchor),
            narrativeSubtitle.bottomAnchor.constraint(equalTo: nodeContainer.bottomAnchor, constant: -15)
        ])
    }

   
    public func calibrateNodeStream(nodeName: String, summary: String, metrics: [Double]) {
       
        let generator = { (val: Double) -> String in
            return val > 0.5 ? "Active" : "Stable"
        }
        
        self.topographyTitle.text = nodeName
        self.narrativeSubtitle.text = summary
        
      
        self.kineticTelemetry = metrics.map { (generator($0), $0) }
        
        performAestheticUpdate()
    }
    
    private func performAestheticUpdate() {
     
        UIView.animate(withDuration: 0.4) {
            self.beaconIndicator.alpha = self.kineticTelemetry.isEmpty ? 0.3 : 1.0
            self.beaconIndicator.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        } completion: { _ in
            self.beaconIndicator.transform = .identity
        }
    }
}


