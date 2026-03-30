//
//  RoadMateContrller.swift
//  JwiMeTvael
//
//  Created by mumu on 2026/3/30.
//

import UIKit


class RoadMateContrller: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
    
    var pageindex: Int = 0
    
    // MARK: - UI Components
    private let backButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "back_icon_holu"), for: .normal)
        btn.tintColor = .white
        return btn
    }()
    
    private let titleHeader: UILabel = {
        let label = UILabel()
        label.text = "Knowledge Base Details"
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private lazy var imageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.isPagingEnabled = false // 使用自定义偏移或调整以匹配设计
        cv.showsHorizontalScrollIndicator = false
        cv.decelerationRate = .fast
        cv.dataSource = self
        cv.delegate = self
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ImageCell")
        return cv
    }()
    
    private let contentTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private let indicatorStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 8
        return stack
    }()

    // MARK: - Init
    init(pageindex: Int) {
        self.pageindex = pageindex
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateContent(for: pageindex)
        
        // 初始滚动到传递的 index
        DispatchQueue.main.async {
            let indexPath = IndexPath(item: self.pageindex, section: 0)
            self.imageCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        
        [backButton, titleHeader, imageCollectionView, contentTitleLabel, descriptionLabel, indicatorStack].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        backButton.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        
        // 使用比例适配约束
        NSLayoutConstraint.activate([
        
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .adaptiveHeight(10)),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            titleHeader.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            titleHeader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           
            imageCollectionView.topAnchor.constraint(equalTo: titleHeader.bottomAnchor, constant: .adaptiveHeight(30)),
            imageCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 400.0/852.0),
            
            indicatorStack.topAnchor.constraint(equalTo: imageCollectionView.bottomAnchor, constant: .adaptiveHeight(20)),
            indicatorStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicatorStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 200.0/393.0),
            indicatorStack.heightAnchor.constraint(equalToConstant: 4),
            
            contentTitleLabel.topAnchor.constraint(equalTo: indicatorStack.bottomAnchor, constant: .adaptiveHeight(30)),
            contentTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contentTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: contentTitleLabel.bottomAnchor, constant: .adaptiveHeight(15)),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentTitleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentTitleLabel.trailingAnchor)
        ])
        
        setupIndicators()
    }
    
    private func setupIndicators() {
        for i in 0..<BatteryLoginBankAssembler.BatteryRV.count {
            let dot = UIView()
            dot.backgroundColor = (i == pageindex) ? .systemPurple : .darkGray
            dot.layer.cornerRadius = 2
            indicatorStack.addArrangedSubview(dot)
        }
    }
    
    private func updateContent(for index: Int) {
        let data = BatteryLoginBankAssembler.BatteryRV[index]
        contentTitleLabel.text = data.1
        descriptionLabel.text = data.2
        
        for (idx, view) in indicatorStack.arrangedSubviews.enumerated() {
            view.backgroundColor = (idx == index) ? .systemPurple : .darkGray
        }
    }
    
    @objc private func handleBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return BatteryLoginBankAssembler.BatteryRV.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath)
        
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        
        let imageView = UIImageView(image: UIImage(named: BatteryLoginBankAssembler.BatteryRV[indexPath.item].0))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.frame = cell.contentView.bounds
        cell.contentView.addSubview(imageView)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        let itemWidth = collectionView.frame.width * 0.82
        let itemHeight = collectionView.frame.height
        return CGSize(width: itemWidth, height: itemHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
       
        let sideInset = (collectionView.frame.width - (collectionView.frame.width * 0.82)) / 2
        return UIEdgeInsets(top: 0, left: sideInset, bottom: 0, right: sideInset)
    }
    
  
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: imageCollectionView.contentOffset, size: imageCollectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let indexPath = imageCollectionView.indexPathForItem(at: visiblePoint) {
            self.pageindex = indexPath.item
            updateContent(for: self.pageindex)
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
