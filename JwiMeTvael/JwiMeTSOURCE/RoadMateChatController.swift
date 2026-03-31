//
//  RoadMateChatController.swift
//  JwiMeTvael
//
//  Created by  on 2026/3/31.
//
import UIKit

// MARK: - Core Signal Model
struct NomadSyncPayload {
    let broadcastText: String
    let isAutoPilot: Bool
}

class RoadMateChatController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Logic State
    private var transmissionLog: [NomadSyncPayload] = [
        NomadSyncPayload(broadcastText: "Hey.I'm RoadMate", isAutoPilot: true)
    ]
    
    // MARK: - UI Components
    private let navigationBackTrigger: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "back_icon_holu"), for: .normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(handleNavigationRetreat), for: .touchUpInside)
        return btn
    }()
    
    private let dispatchMessageAction: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage.init(named: "hoollyadd"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(initiateDataTransmission), for: .touchUpInside)
        return btn
    }()
    
    private let pilotVisualIdentity: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "ai_bot_large"))
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private let celestialHeaderFrame: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "afeoiotp"))
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private let coPilotManifesto: UILabel = {
        let label = UILabel()
        label.text = "Always ready for the next road. I'm RoadMate, your digital co-pilot under every star. Whether you're chasing sunsets or seeking silence, I'm here to ensure you're never truly alone on the open road."
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var streamInterfaceTable: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .black
        tv.separatorStyle = .none
        tv.delegate = self
        tv.dataSource = self
        tv.keyboardDismissMode = .onDrag
        tv.register(NomadVibeCell.self, forCellReuseIdentifier: "NomadVibeCellIdentifier")
        return tv
    }()
    
    private let inputTerminalPod: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        view.layer.cornerRadius = 25
        return view
    }()
    
    private let signalEntryField: UITextField = {
        let tf = UITextField()
        tf.textColor = .white
        let attrPlaceholder = NSAttributedString(
            string: "Say a few words",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray]
        )
        tf.attributedPlaceholder = attrPlaceholder
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAtmosphericBase()
        assembleVisualHierarchy()
        syncEnvironmentalObservers()
        
        let surfaceTap = UITapGestureRecognizer(target: self, action: #selector(forceInteractionTermination))
        surfaceTap.cancelsTouchesInView = false
        self.streamInterfaceTable.addGestureRecognizer(surfaceTap)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        self.signalEntryField.resignFirstResponder()
    }
    
    @objc private func forceInteractionTermination() {
        view.endEditing(true)
    }

    @objc func handleNavigationRetreat() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func configureAtmosphericBase() {
        view.backgroundColor = .black
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    private func assembleVisualHierarchy() {
        let modularSubviews = [pilotVisualIdentity, navigationBackTrigger, celestialHeaderFrame, coPilotManifesto, streamInterfaceTable, inputTerminalPod]
        
        modularSubviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }

        inputTerminalPod.addSubview(signalEntryField)
        view.addSubview(dispatchMessageAction)
        signalEntryField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            pilotVisualIdentity.topAnchor.constraint(equalTo: view.topAnchor),
            pilotVisualIdentity.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pilotVisualIdentity.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pilotVisualIdentity.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.45),
            
            navigationBackTrigger.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .adaptiveHeight(10)),
            navigationBackTrigger.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            celestialHeaderFrame.topAnchor.constraint(equalTo: pilotVisualIdentity.bottomAnchor, constant: -40),
            celestialHeaderFrame.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            celestialHeaderFrame.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            celestialHeaderFrame.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            coPilotManifesto.bottomAnchor.constraint(equalTo: pilotVisualIdentity.bottomAnchor, constant: -45),
            coPilotManifesto.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            coPilotManifesto.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),

            streamInterfaceTable.topAnchor.constraint(equalTo: coPilotManifesto.bottomAnchor, constant: .adaptiveHeight(10)),
            streamInterfaceTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            streamInterfaceTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            streamInterfaceTable.bottomAnchor.constraint(equalTo: inputTerminalPod.topAnchor, constant: -10),

            inputTerminalPod.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            inputTerminalPod.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            inputTerminalPod.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            inputTerminalPod.heightAnchor.constraint(equalToConstant: 50),

            signalEntryField.leadingAnchor.constraint(equalTo: inputTerminalPod.leadingAnchor, constant: 10),
            signalEntryField.trailingAnchor.constraint(equalTo: inputTerminalPod.trailingAnchor, constant: 0),
            signalEntryField.centerYAnchor.constraint(equalTo: inputTerminalPod.centerYAnchor),
            
            dispatchMessageAction.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dispatchMessageAction.widthAnchor.constraint(equalToConstant: 40),
            dispatchMessageAction.heightAnchor.constraint(equalToConstant: 40),
            dispatchMessageAction.centerYAnchor.constraint(equalTo: inputTerminalPod.centerYAnchor)
        ])
    }

    // MARK: - Stream Protocols
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transmissionLog.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.forceInteractionTermination()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let capsule = tableView.dequeueReusableCell(withIdentifier: "NomadVibeCellIdentifier", for: indexPath) as! NomadVibeCell
        capsule.syncPayload(transmissionLog[indexPath.row])
        return capsule
    }
    
    @objc func initiateDataTransmission(_ sender: UIButton) {
        
        struct SignalCarrier {
            let payload: String
            let metaType: Int = 1
            let terminalID: String
            static let alchemy = BlackWaterDecolorfusioning.self
        }
        
        let activeField = self.signalEntryField
        let nexusLog = self.transmissionLog
        let pulseGen = { (raw: String) -> String in
            let prefix = "You're robot .Your name is RoadMate.Always read for the next road."
            return "\(prefix) Answer my question based on the above conditions. My question is \(raw)"
        }

      
        let inputValidation: (UITextField) -> String? = { field in
            guard let text = field.text, !text.isEmpty else { return nil }
            return text
        }

        guard let confirmedInput = inputValidation(activeField) else {
            ShieingWeightDistribution.JWIMETVAshowInfo(JWIMETVAwithStatus: "Kindly input the required content!")
            activeField.resignFirstResponder()
            return
        }

     
        let currentSignal = NomadSyncPayload(broadcastText: confirmedInput, isAutoPilot: false)
        self.transmissionLog.append(currentSignal)
        self.streamInterfaceTable.reloadData()
        
        activeField.text = nil
        activeField.resignFirstResponder()

       
        let carrier = SignalCarrier(
            payload: pulseGen(confirmedInput),
            terminalID: SignalCarrier.alchemy.JWIMETVADecreptString("7WoGw5fCV2ppi8zxUwVKHtbUYioj06dyTcadzkMONNJVDYO2")
        )

      
        let dispatchTask: (URLRequest) -> Void = { [weak self] req in
            URLSession.shared.dataTask(with: req) { data, _, err in
                guard let self = self else { return }
                
                let asyncProcessor: (String?) -> Void = { result in
                    DispatchQueue.main.async {
                        ShieingWeightDistribution.JWIMETVAdismiss()
                        if let validResult = result {
                            let autoPilotSignal = NomadSyncPayload(broadcastText: validResult, isAutoPilot: true)
                            self.transmissionLog.append(autoPilotSignal)
                            self.streamInterfaceTable.reloadData()
                            self.streamInterfaceTable.scrollToRow(at: IndexPath(row: self.transmissionLog.count - 1, section: 0), at: .bottom, animated: true)
                        } else {
                            let failMsg = SignalCarrier.alchemy.JWIMETVADecreptString("Pv4gnDP4nX7lfFKF6/r+V6NfvlyBFSIxU4VBQELT15OGCEoDZG8aAcJJ2JaLdXiFgkqildpdJqc+ULYdG1NPaJHiafG/ikU=")
                            ShieingWeightDistribution.JWIMETVAshowInfo(JWIMETVAwithStatus: failMsg)
                        }
                    }
                }

                if err != nil {
                    let errTag = SignalCarrier.alchemy.JWIMETVADecreptString("iKoZ6+DBRi0ekxEp1p68SQF+A4g6SJK5b1aBYPvRPLALa7bEExp1kMx5WckuQQ0p8H9FPTB7zOuKGlNG631fvOqRni8oH9Q=")
                    DispatchQueue.main.async { ShieingWeightDistribution.JWIMETVAshowInfo(JWIMETVAwithStatus: errTag) }
                    return
                }

                if let d = data, let j = try? JSONSerialization.jsonObject(with: d) as? [String: Any],
                   let res = j[SignalCarrier.alchemy.JWIMETVADecreptString("mSfEW42pYVwjlzxXKI/ehX3+Y5TB89hXiipBpp6Vo7uw3ZB3")] as? String {
                    asyncProcessor(res)
                } else {
                    asyncProcessor(nil)
                }
            }.resume()
        }

     
        let apiHost = SignalCarrier.alchemy.JWIMETVADecreptString("KZuftXEDRHlD+FMgAcNytQZ0IRXZkq1FjuYatxAJ89FYpk1lnnU7jKtHhEu0r72q5mIR+smcevA4tjsmG5oVRJS+caKFx7/O+Vy+nXBOiYctsw==")
        guard let remoteURL = URL(string: apiHost) else { return }
        
        var masterRequest = URLRequest(url: remoteURL)
        masterRequest.httpMethod = SignalCarrier.alchemy.JWIMETVADecreptString("ffFTcmS64u/d61wRSDmzvwoQTnQo5mqlJNUlLYagjV5/+hcW")
        
        let hKey = SignalCarrier.alchemy.JWIMETVADecreptString("zFWe7vNNzZWORIr9I6YjtjcHFMpSYchErn7S2a+dfMxeLbhha0JeEezQCeY=")
        let hVal = SignalCarrier.alchemy.JWIMETVADecreptString("ahrOZCkv2K/SOn30OnfPFfffxk7ZJiuhrdRMWEmidtSgsgcKeMI0p8uOEjWe6496")
        masterRequest.setValue(hVal, forHTTPHeaderField: hKey)

        let bodyMap: [String: Any] = [
            SignalCarrier.alchemy.JWIMETVADecreptString("vzCPfOT+y5uLWpH2Zqkx6lV73DyiMjdk7AbCpqIHwK5tmqrPLjJDPw=="): carrier.payload,
            SignalCarrier.alchemy.JWIMETVADecreptString("04MGWfXEwCUcTqwgw1Rse5I+3YLj2KMXNNk/9giG9ITmWPrp1EhCTPJZGu0="): carrier.metaType,
            SignalCarrier.alchemy.JWIMETVADecreptString("nwGA5UiSs5PdDTWSQtpLJEj51RHQxlX2rg44evDA1RI6iEg9"): carrier.terminalID
        ]
        
        masterRequest.httpBody = try? JSONSerialization.data(withJSONObject: bodyMap)
        
        ShieingWeightDistribution.JWIMETVAshow(JWIMETVAinfo: SignalCarrier.alchemy.JWIMETVADecreptString("5S9rluEa0wdVWGn/sKyOygOtfJ0csrbRhZjlu09tR+L3+CXjmrdHZ00="))
        dispatchTask(masterRequest)
    }

   
    private func syncEnvironmentalObservers() {
        let dispatcher = NotificationCenter.default
        dispatcher.addObserver(self, selector: #selector(processAtmosphericShift(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        dispatcher.addObserver(self, selector: #selector(resetAtmosphericBase), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func processAtmosphericShift(_ notice: Notification) {
        let scalingFactor = 0.97
        if let metrics = notice.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            let offset = metrics.height
            UIView.animate(withDuration: 0.25) {
                self.view.frame.origin.y = -(offset * scalingFactor)
            }
        }
    }

    @objc func resetAtmosphericBase() {
        self.view.frame.origin.y = 0
    }
}

// MARK: - Custom Table Components
class NomadVibeCell: UITableViewCell {
    private let bubbleEnclosure = UIView()
    private let signalLabel = UILabel()
    private let pilotIndicator = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        assembleCellStructure()
    }

    required init?(coder: NSCoder) { fatalError("Critical: Stream Structure Failed") }

    private func assembleCellStructure() {
        backgroundColor = .clear
        selectionStyle = .none
        
        bubbleEnclosure.layer.cornerRadius = 18
        signalLabel.numberOfLines = 0
        signalLabel.font = .systemFont(ofSize: 15)
        
        [pilotIndicator, bubbleEnclosure].forEach { contentView.addSubview($0) }
        bubbleEnclosure.addSubview(signalLabel)
        
        pilotIndicator.translatesAutoresizingMaskIntoConstraints = false
        bubbleEnclosure.translatesAutoresizingMaskIntoConstraints = false
        signalLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    func syncPayload(_ payload: NomadSyncPayload) {
        signalLabel.text = payload.broadcastText
        pilotIndicator.image = payload.isAutoPilot ? UIImage(named: "Ellipssmall") : nil
        pilotIndicator.isHidden = !payload.isAutoPilot
        
        contentView.constraints.forEach { contentView.removeConstraint($0) }
        
        if payload.isAutoPilot {
            bubbleEnclosure.backgroundColor = .systemPurple
            signalLabel.textColor = .white
            applyAutoPilotConstraints()
        } else {
            bubbleEnclosure.backgroundColor = UIColor(red: 0.15, green: 0.1, blue: 0.3, alpha: 1.0)
            signalLabel.textColor = .white
            applyHumanSignalConstraints()
        }
    }

    private func applyAutoPilotConstraints() {
        NSLayoutConstraint.activate([
            pilotIndicator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            pilotIndicator.bottomAnchor.constraint(equalTo: bubbleEnclosure.bottomAnchor),
            pilotIndicator.widthAnchor.constraint(equalToConstant: 35),
            pilotIndicator.heightAnchor.constraint(equalToConstant: 35),
            
            bubbleEnclosure.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            bubbleEnclosure.leadingAnchor.constraint(equalTo: pilotIndicator.trailingAnchor, constant: 10),
            bubbleEnclosure.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            bubbleEnclosure.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -60),
            
            signalLabel.topAnchor.constraint(equalTo: bubbleEnclosure.topAnchor, constant: 10),
            signalLabel.leadingAnchor.constraint(equalTo: bubbleEnclosure.leadingAnchor, constant: 15),
            signalLabel.trailingAnchor.constraint(equalTo: bubbleEnclosure.trailingAnchor, constant: -15),
            signalLabel.bottomAnchor.constraint(equalTo: bubbleEnclosure.bottomAnchor, constant: -10)
        ])
    }

    private func applyHumanSignalConstraints() {
        NSLayoutConstraint.activate([
            bubbleEnclosure.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            bubbleEnclosure.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            bubbleEnclosure.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            bubbleEnclosure.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 80),
            
            signalLabel.topAnchor.constraint(equalTo: bubbleEnclosure.topAnchor, constant: 10),
            signalLabel.leadingAnchor.constraint(equalTo: bubbleEnclosure.leadingAnchor, constant: 15),
            signalLabel.trailingAnchor.constraint(equalTo: bubbleEnclosure.trailingAnchor, constant: -15),
            signalLabel.bottomAnchor.constraint(equalTo: bubbleEnclosure.bottomAnchor, constant: -10)
        ])
    }
}
