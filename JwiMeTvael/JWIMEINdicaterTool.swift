//
//  JWIMEINdicaterTool.swift
//  JwiMeTvael
//
//  Created by JWIMETVA on 2025/12/18.
//

import UIKit


class JWIMETVAAppIndicatorMannager {
    
    static let shared = JWIMETVAAppIndicatorMannager()
    private var JWIMETVAoverlayWindow: UIWindow?
       
    private var JWIMETVAcontainerView: UIView?
    private var JWIMETVAindicator: UIActivityIndicatorView?
    private var JWIMETVAmessageLabel: UILabel?
    private var JWIMETVAiconView: UIImageView?
    // MARK: - Show Loading
    class func JWIMETVAshow(JWIMETVAinfo:String) {
        if (UIApplication.shared.delegate as? AppDelegate)?.window == nil {
            return
        }
        shared.JWIMETVApresent(JWIMETVAmessage: JWIMETVAinfo, JWIMETVAicon: nil, JWIMETVAisLoading: true)
    }
    
    // MARK: - Show Info
    class func JWIMETVAshowInfo(JWIMETVAwithStatus message: String) {//系统图片 不要改动
        shared.JWIMETVApresent(JWIMETVAmessage: message, JWIMETVAicon: UIImage(systemName: "info.circle"), JWIMETVAisLoading: false)
    }
    
    // MARK: - Show Success
    class func JWIMETVAshowSuccess(JWIMETVAwithStatus message: String) {//系统图片 不要改动
        shared.JWIMETVApresent(JWIMETVAmessage: message, JWIMETVAicon: UIImage(systemName: "checkmark.circle.fill"), JWIMETVAisLoading: false)
    }
    
    // MARK: - Dismiss
    class func JWIMETVAdismiss() {
        shared.JWIMETVAdismissIndicator()
    }
    
    // MARK: - Core View
    private func JWIMETVApresent(JWIMETVAmessage: String, JWIMETVAicon: UIImage?, JWIMETVAisLoading: Bool) {
            JWIMETVAdismissIndicator()
            
            let JWIMETVAwindow = UIWindow(frame: UIScreen.main.bounds)
            JWIMETVAwindow.windowLevel = .alert + 1
            JWIMETVAwindow.backgroundColor = .clear
            
            let JWIMETVAcontainer = UIView()
            JWIMETVAcontainer.backgroundColor = UIColor.black.withAlphaComponent(0.8)
            JWIMETVAcontainer.layer.cornerRadius = 14
            JWIMETVAcontainer.translatesAutoresizingMaskIntoConstraints = false
            
            let JWIMETVAstack = UIStackView()
            JWIMETVAstack.axis = .vertical
            JWIMETVAstack.alignment = .center
            JWIMETVAstack.spacing = 12
            JWIMETVAstack.translatesAutoresizingMaskIntoConstraints = false
            
            let JWIMETVAindicatorView = UIActivityIndicatorView(style: .large)
            JWIMETVAindicatorView.color = .white
        JWIMETVAindicatorView.stopAnimating()
            let JWIMETVAimageView = UIImageView(image: JWIMETVAicon)
            JWIMETVAimageView.tintColor = .white
            JWIMETVAimageView.contentMode = .scaleAspectFit
            JWIMETVAimageView.translatesAutoresizingMaskIntoConstraints = false
            JWIMETVAimageView.widthAnchor.constraint(equalToConstant: 36).isActive = true
            JWIMETVAimageView.heightAnchor.constraint(equalToConstant: 36).isActive = true
            
            let JWIMETVAlabel = UILabel()
            JWIMETVAlabel.text = JWIMETVAmessage
            JWIMETVAlabel.textColor = .white
            JWIMETVAlabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
            JWIMETVAlabel.numberOfLines = 2
            JWIMETVAlabel.textAlignment = .center
            
            if JWIMETVAisLoading {
                JWIMETVAstack.addArrangedSubview(JWIMETVAindicatorView)
                JWIMETVAindicatorView.startAnimating()
            } else if let icon = JWIMETVAicon {
                JWIMETVAstack.addArrangedSubview(JWIMETVAimageView)
            }
            JWIMETVAstack.addArrangedSubview(JWIMETVAlabel)
            
            JWIMETVAcontainer.addSubview(JWIMETVAstack)
            JWIMETVAwindow.addSubview(JWIMETVAcontainer)
            
            NSLayoutConstraint.activate([
                JWIMETVAcontainer.centerXAnchor.constraint(equalTo: JWIMETVAwindow.centerXAnchor),
                JWIMETVAcontainer.centerYAnchor.constraint(equalTo: JWIMETVAwindow.centerYAnchor),
                JWIMETVAcontainer.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
                
                JWIMETVAstack.topAnchor.constraint(equalTo: JWIMETVAcontainer.topAnchor, constant: 20),
                JWIMETVAstack.bottomAnchor.constraint(equalTo: JWIMETVAcontainer.bottomAnchor, constant: -20),
                JWIMETVAstack.leadingAnchor.constraint(equalTo: JWIMETVAcontainer.leadingAnchor, constant: 16),
                JWIMETVAstack.trailingAnchor.constraint(equalTo: JWIMETVAcontainer.trailingAnchor, constant: -16),
            ])
            
            JWIMETVAwindow.makeKeyAndVisible()
            
            JWIMETVAoverlayWindow = JWIMETVAwindow
            JWIMETVAcontainerView = JWIMETVAcontainer
            JWIMETVAindicator = JWIMETVAindicatorView
            JWIMETVAmessageLabel = JWIMETVAlabel
            JWIMETVAiconView = JWIMETVAimageView
            
//             轻微缩放动画
            JWIMETVAcontainer.alpha = 0
            JWIMETVAcontainer.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
            UIView.animate(withDuration: 0.25,
                           delay: 0,
                           usingSpringWithDamping: 0.7,
                           initialSpringVelocity: 0.8,
                           options: .curveEaseOut,
                           animations: {
                JWIMETVAcontainer.alpha = 1
                JWIMETVAcontainer.transform = .identity
            })
            
//             自动隐藏非 loading 的提示
            if !JWIMETVAisLoading {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
                    self?.JWIMETVAdismissIndicator()
                }
            }
        }
        
        private func JWIMETVAdismissIndicator() {
            self.JWIMETVAoverlayWindow?.isHidden = true
            self.JWIMETVAoverlayWindow = nil
            self.JWIMETVAcontainerView = nil
            self.JWIMETVAindicator?.stopAnimating()
            self.JWIMETVAindicator = nil
            self.JWIMETVAmessageLabel = nil
        }
    }

