//
//  HollyButtonBase.swift
//  JwiMeTvael
//
//  Created by  on 2026/4/16.
//

import UIKit

 class HollyButtonBase: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
    }

    convenience init(title: String) {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

 final class HollyGradientButton: HollyButtonBase {
    private let gradientLayer = CAGradientLayer()

    convenience init(title: String) {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        gradientLayer.colors = [
            UIColor(red: 0.26, green: 0.74, blue: 0.99, alpha: 1).cgColor,
            UIColor(red: 0.79, green: 0.11, blue: 0.98, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = self.layer.cornerRadius
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

 final class HollyOutlineButton: HollyButtonBase {
    convenience init(title: String) {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.09, green: 0.03, blue: 0.18, alpha: 1)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 0.37, green: 0.28, blue: 0.82, alpha: 0.7).cgColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
