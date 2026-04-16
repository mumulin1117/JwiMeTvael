//
//  HollyInputField.swift
//  JwiMeTvael
//
//  Created by  on 2026/4/16.
//

import UIKit

 final class HollyInputField: UIView {
    let textHollyField = UITextField()
    private let HollyiconView = UIImageView()
    private let toggleHollyButton = UIButton(type: .system)
    private let HollyisSecure: Bool

    init(iconHollyName: String, placeHollyholder: String, Hollysecure: Bool) {
        self.HollyisSecure = Hollysecure
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(red: 0.09, green: 0.03, blue: 0.18, alpha: 1)
        self.layer.cornerRadius = 18
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.withAlphaComponent(0.05).cgColor

        HollyiconView.translatesAutoresizingMaskIntoConstraints = false
        HollyiconView.tintColor = UIColor.white.withAlphaComponent(0.72)
        HollyiconView.image = UIImage(systemName: iconHollyName)
        HollyiconView.contentMode = .scaleAspectFit

        textHollyField.translatesAutoresizingMaskIntoConstraints = false
        textHollyField.attributedPlaceholder = NSAttributedString(string: placeHollyholder, attributes: [.foregroundColor: UIColor.white.withAlphaComponent(0.33)])
        textHollyField.textColor = .white
        textHollyField.autocapitalizationType = .none
        textHollyField.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        textHollyField.keyboardAppearance = .dark
        textHollyField.keyboardType = Hollysecure ? .default : .emailAddress
        textHollyField.isSecureTextEntry = Hollysecure

        self.addSubview(HollyiconView)
        self.addSubview(textHollyField)

        if Hollysecure {
            toggleHollyButton.translatesAutoresizingMaskIntoConstraints = false
            toggleHollyButton.tintColor = UIColor.white.withAlphaComponent(0.68)
            toggleHollyButton.setImage(UIImage(systemName: "eye"), for: .normal)
            toggleHollyButton.addTarget(self, action: #selector(toggleSecureMode), for: .touchUpInside)
            self.addSubview(toggleHollyButton)
        }

        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 54),
            HollyiconView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            HollyiconView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            HollyiconView.widthAnchor.constraint(equalToConstant: 16),
            HollyiconView.heightAnchor.constraint(equalToConstant: 16)
        ])

        if Hollysecure {
            NSLayoutConstraint.activate([
                toggleHollyButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14),
                toggleHollyButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                toggleHollyButton.widthAnchor.constraint(equalToConstant: 24),
                toggleHollyButton.heightAnchor.constraint(equalToConstant: 24),
                textHollyField.leadingAnchor.constraint(equalTo: HollyiconView.trailingAnchor, constant: 12),
                textHollyField.trailingAnchor.constraint(equalTo: toggleHollyButton.leadingAnchor, constant: -10),
                textHollyField.topAnchor.constraint(equalTo: self.topAnchor),
                textHollyField.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        } else {
            NSLayoutConstraint.activate([
                textHollyField.leadingAnchor.constraint(equalTo: HollyiconView.trailingAnchor, constant: 12),
                textHollyField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
                textHollyField.topAnchor.constraint(equalTo: self.topAnchor),
                textHollyField.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        }
    }

    @objc private func toggleSecureMode() {
        textHollyField.isSecureTextEntry.toggle()
        let imageName = textHollyField.isSecureTextEntry ? "eye" : "eye.slash"
        toggleHollyButton.setImage(UIImage(systemName: imageName), for: .normal)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
