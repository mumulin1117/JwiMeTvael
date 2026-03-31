//
//  RoadMateContrller.swift
//  JwiMeTvael
//
//  Created by  on 2026/3/30.
//

import UIKit

class RoadMateAtlasDetailController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
    private var activeNarrativeIndex: Int = 0
    
    // MARK: - UI Elements
    private let orbitalDismissTrigger: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "back_icon_holu"), for: .normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(initiateRetreatSequence), for: .touchUpInside)
        return btn
    }()
    
    private let topNavigationTitle: UILabel = {
        let label = UILabel()
        label.text = "Knowledge Base Details"
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private lazy var visualCarouselDisplay: UICollectionView = {
        let flowPipe = UICollectionViewFlowLayout()
        flowPipe.scrollDirection = .horizontal
        flowPipe.minimumLineSpacing = 15
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowPipe)
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.decelerationRate = .fast
        cv.dataSource = self
        cv.delegate = self
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "AtlasVisualCarrier")
        return cv
    }()
    
    private let primaryHeaderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private let secondaryNarrativeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private let progressIndicatorPod: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 8
        return stack
    }()

    // MARK: - Initializer
    init(targetIndex: Int) {
        self.activeNarrativeIndex = targetIndex
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Atlas Controller Critical Failure")
    }

    // MARK: - Lifecycle Execution
    override func viewDidLoad() {
        super.viewDidLoad()
        configureEnvironmentBase()
        assembleVisualHierarchy()
        syncNarrativeContent(at: activeNarrativeIndex)
        
        // 延迟滚动以确保布局完成
        executeInitialFocus()
    }
    
    private func executeInitialFocus() {
        DispatchQueue.main.async {
            let focusPath = IndexPath(item: self.activeNarrativeIndex, section: 0)
            self.visualCarouselDisplay.scrollToItem(at: focusPath, at: .centeredHorizontally, animated: false)
        }
    }
    
    private func configureEnvironmentBase() {
        view.backgroundColor = .black
    }

    private func assembleVisualHierarchy() {
        let atlasSubviews = [orbitalDismissTrigger, topNavigationTitle, visualCarouselDisplay, primaryHeaderLabel, secondaryNarrativeLabel, progressIndicatorPod]
        
        atlasSubviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            orbitalDismissTrigger.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .adaptiveHeight(10)),
            orbitalDismissTrigger.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            topNavigationTitle.centerYAnchor.constraint(equalTo: orbitalDismissTrigger.centerYAnchor),
            topNavigationTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            visualCarouselDisplay.topAnchor.constraint(equalTo: topNavigationTitle.bottomAnchor, constant: .adaptiveHeight(30)),
            visualCarouselDisplay.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            visualCarouselDisplay.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            visualCarouselDisplay.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 400.0/852.0),
            
            progressIndicatorPod.topAnchor.constraint(equalTo: visualCarouselDisplay.bottomAnchor, constant: .adaptiveHeight(20)),
            progressIndicatorPod.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressIndicatorPod.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 200.0/393.0),
            progressIndicatorPod.heightAnchor.constraint(equalToConstant: 4),
            
            primaryHeaderLabel.topAnchor.constraint(equalTo: progressIndicatorPod.bottomAnchor, constant: .adaptiveHeight(30)),
            primaryHeaderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            primaryHeaderLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            secondaryNarrativeLabel.topAnchor.constraint(equalTo: primaryHeaderLabel.bottomAnchor, constant: .adaptiveHeight(15)),
            secondaryNarrativeLabel.leadingAnchor.constraint(equalTo: primaryHeaderLabel.leadingAnchor),
            secondaryNarrativeLabel.trailingAnchor.constraint(equalTo: primaryHeaderLabel.trailingAnchor)
        ])
        
        constructStatusIndicators()
    }
    
    private func constructStatusIndicators() {
        let totalUnits = fetchDataSourceCount()
        for i in 0..<totalUnits {
            let segment = UIView()
            segment.backgroundColor = (i == activeNarrativeIndex) ? .systemPurple : .darkGray
            segment.layer.cornerRadius = 2
            progressIndicatorPod.addArrangedSubview(segment)
        }
    }
    
    private func syncNarrativeContent(at index: Int) {
        let unitData = BatteryLoginBankAssembler.BatteryRV[index]
        primaryHeaderLabel.text = unitData.1
        secondaryNarrativeLabel.text = unitData.2
        
        progressIndicatorPod.arrangedSubviews.enumerated().forEach { idx, view in
            view.backgroundColor = (idx == index) ? .systemPurple : .darkGray
        }
    }
    
    private func fetchDataSourceCount() -> Int {
        return BatteryLoginBankAssembler.BatteryRV.count
    }
    
    @objc private func initiateRetreatSequence() {
        self.navigationController?.popViewController(animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchDataSourceCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AtlasVisualCarrier", for: indexPath)
        
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        
        let resourceName = BatteryLoginBankAssembler.BatteryRV[indexPath.item].0
        let visualComponent = UIImageView(image: UIImage(named: resourceName))
        visualComponent.contentMode = .scaleAspectFill
        visualComponent.clipsToBounds = true
        visualComponent.layer.cornerRadius = 20
        visualComponent.frame = cell.contentView.bounds
        cell.contentView.addSubview(visualComponent)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let dynamicWidth = collectionView.frame.width * 0.82
        return CGSize(width: dynamicWidth, height: collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let horizontalPadding = (collectionView.frame.width - (collectionView.frame.width * 0.82)) / 2
        return UIEdgeInsets(top: 0, left: horizontalPadding, bottom: 0, right: horizontalPadding)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let corePoint = CGPoint(x: visualCarouselDisplay.contentOffset.x + (visualCarouselDisplay.frame.width / 2),
                                y: visualCarouselDisplay.frame.height / 2)
        
        if let targetPath = visualCarouselDisplay.indexPathForItem(at: corePoint) {
            self.activeNarrativeIndex = targetPath.item
            syncNarrativeContent(at: self.activeNarrativeIndex)
        }
    }
}
extension CGFloat {
   
    static var screenHeight: CGFloat { UIScreen.main.bounds.height }
    static var screenWidth: CGFloat { UIScreen.main.bounds.width }
    
    static func adaptiveHeight(_ h: CGFloat) -> CGFloat {
        return (h / 812.0) * screenHeight
    }
}
