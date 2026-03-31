//
//  RoadMateCell.swift
//  JwiMeTvael
//
//  Created by  on 2026/3/30.
//

import UIKit

class RoadMateCell: UICollectionViewCell {
    
    lazy var covreImagv: UIImageView = {
        let achole = UIImageView.init()
        achole.contentMode = .scaleAspectFill
        achole.layer.cornerRadius = 16
        achole.layer.masksToBounds = true
        return achole
    }()
    
    lazy var Roadlabekl: UILabel = {
        let Roadlabekl = UILabel.init()
        Roadlabekl.textColor = UIColor.white
        Roadlabekl.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        Roadlabekl.textAlignment = .center
        return Roadlabekl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(covreImagv)
        self.contentView.addSubview(Roadlabekl)
        covreImagv.translatesAutoresizingMaskIntoConstraints = false
        Roadlabekl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            covreImagv.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            covreImagv.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            covreImagv.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            covreImagv.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            Roadlabekl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 12),
            Roadlabekl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -12),
            Roadlabekl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -13)
          
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
