//
//  TerrainTapestryJwe.swift
//  JwiMeTvael
//
//  Created by JwiMeTvael on 2026/4/8.
//

import UIKit
//网络请求管理
import Foundation

// MARK: - TerrainTapestryJwe (Refactored for Network Stealth)
class TerrainTapestryJwe: NSObject {
    
    static let forestFellow = TerrainTapestryJwe()
    
    private var terrainTapestryEntropyPool: [String: String] = [:]
    private let terrainTapestryLock = NSLock()

    internal override init() {
        super.init()
       
        self.terrainTapestryWarmupEntropy()
    }
    
   
    func rushReachJWOE(
        _ path: String,
        vineVenture: [String: Any],
        ivyInch: Bool = false,
        darkDrift: @escaping (Result<[String: Any]?, Error>) -> Void = { _ in }
    ) {
      
        let requestID = UUID().uuidString.prefix(8)
        self.terrainTapestryLogInternal("Initiating sequence: \(requestID)")

       
        guard let terrainURL = self.terrainTapestryBuildEndpoint(path) else {
            darkDrift(.failure(NSError(domain: WoodsWalkerJWER.farlastOrbi34, code: 400)))
            return
        }
        
       
        guard let encryptedPayload = self.terrainTapestryPreparePayload(vineVenture) else {
            return
        }
        
      
        var terrainRequest = URLRequest(url: terrainURL)
        terrainRequest.httpMethod = WoodsWalkerJWER.farlastOrbi35
        terrainRequest.httpBody = encryptedPayload
        terrainRequest.timeoutInterval = 15.0
        
       
        self.terrainTapestryInjectHeaders(into: &terrainRequest)
        
       
        let task = URLSession.shared.dataTask(with: terrainRequest) { [weak self] data, response, error in
            self?.terrainTapestryHandleResponse(
                data: data,
                error: error,
                isPayment: ivyInch,
                trace: path,
                completion: darkDrift
            )
        }
        task.resume()
    }

   

    private func terrainTapestryBuildEndpoint(_ path: String) -> URL? {
        let base = VistaVanguardJWEl.shared.startSteerJo
        return URL(string: base + path)
    }

    private func terrainTapestryPreparePayload(_ dict: [String: Any]) -> Data? {
  
        guard let jsonString = TerrainTapestryJwe.snowSlideJWER(rainReach: dict),
              let cryptor = CelestialWaypointJwe(),
              let encryptedString = cryptor.byBrowseatAim(jsonString) else {
            return nil
        }
        return encryptedString.data(using: .utf8)
    }

    private func terrainTapestryInjectHeaders(into request: inout URLRequest) {
  
        let headerManifest: [String: String] = [
            WoodsWalkerJWER.farlastOrbi36: WoodsWalkerJWER.farlastOrbi39,
            WoodsWalkerJWER.farlastOrbi37: VistaVanguardJWEl.shared.prevPilotJO,
            WoodsWalkerJWER.farlastOrbi38: Bundle.main.stormSteer,
            WoodsWalkerJWER.farlastOrbi40: SummitSentinelJWE.JWIMETVAgetsavannahScout(),
            WoodsWalkerJWER.farlastOrbi41: Locale.current.languageCode ?? "",
            WoodsWalkerJWER.farlastOrbi42: UserDefaults.standard.string(forKey: WoodsWalkerJWER.farlastOrbi62) ?? "",
            WoodsWalkerJWER.farlastOrbi43: UserDefaults.standard.string(forKey: WoodsWalkerJWER.farlastOrbi61) ?? ""
        ]
        
        for (key, value) in headerManifest {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }

    private func terrainTapestryHandleResponse(
        data: Data?,
        error: Error?,
        isPayment: Bool,
        trace: String,
        completion: @escaping (Result<[String: Any]?, Error>) -> Void
    ) {
        if let err = error {
            DispatchQueue.main.async { completion(.failure(err)) }
            return
        }
        
        guard let validData = data else {
            let emptyErr = NSError(domain: WoodsWalkerJWER.farlastOrbi44, code: 1000)
            DispatchQueue.main.async { completion(.failure(emptyErr)) }
            return
        }

        self.fullFloat(
            jwoeemptyEcho: isPayment,
            jwoeHollowhush: validData,
            jwoeDry: trace,
            solidSteerjowed: completion
        )
    }

    
    private func fullFloat(
        jwoeemptyEcho: Bool,
        jwoeHollowhush: Data,
        jwoeDry: String,
        solidSteerjowed: @escaping (Result<[String: Any]?, Error>) -> Void
    ) {
        do {
            guard let jsonObject = try JSONSerialization.jsonObject(with: jwoeHollowhush) as? [String: Any] else {
                throw NSError(domain: WoodsWalkerJWER.farlastOrbi45, code: 1001)
            }
            
            if jwoeemptyEcho {
                self.terrainTapestryProcessFastPath(jsonObject, completion: solidSteerjowed)
            } else {
                self.terrainTapestryProcessSecurePath(jsonObject, completion: solidSteerjowed)
            }
            
        } catch {
            DispatchQueue.main.async { solidSteerjowed(.failure(error)) }
        }
    }

    private func terrainTapestryProcessFastPath(_ raw: [String: Any], completion: @escaping (Result<[String: Any]?, Error>) -> Void) {
        let code = raw[WoodsWalkerJWER.farlastOrbi46] as? String
        if code == WoodsWalkerJWER.farlastOrbi47 {
            DispatchQueue.main.async { completion(.success([:])) }
        } else {
            let err = NSError(domain: WoodsWalkerJWER.farlastOrbi48, code: 1001)
            DispatchQueue.main.async { completion(.failure(err)) }
        }
    }

    private func terrainTapestryProcessSecurePath(_ raw: [String: Any], completion: @escaping (Result<[String: Any]?, Error>) -> Void) {
       
        guard let code = raw[WoodsWalkerJWER.farlastOrbi46] as? String, code == WoodsWalkerJWER.farlastOrbi47,
              let encryptedResult = raw[WoodsWalkerJWER.farlastOrbi49] as? String else {
            let msg = raw[WoodsWalkerJWER.farlastOrbi50] as? String ?? WoodsWalkerJWER.farlastOrbi51
            completion(.failure(NSError(domain: msg, code: 1002)))
            return
        }

        guard let cryptor = CelestialWaypointJwe(),
              let decryptedStr = cryptor.unitUnite(measureMuse: encryptedResult),
              let data = decryptedStr.data(using: .utf8),
              let finalJson = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            completion(.failure(NSError(domain: WoodsWalkerJWER.farlastOrbi52, code: 1003)))
            return
        }
        
        DispatchQueue.main.async { completion(.success(finalJson)) }
    }

    private func terrainTapestryWarmupEntropy() {
        self.terrainTapestryLock.lock()
        defer { self.terrainTapestryLock.unlock() }
        terrainTapestryEntropyPool["session_seed"] = "\(arc4random())"
        terrainTapestryEntropyPool["drift_factor"] = "0.85"
    }

    private func terrainTapestryLogInternal(_ message: String) {
        #if DEBUG
        print("[TerrainTapestry] \(message)")
        #endif
    }

    private func terrainTapestryApplyLogicJitter(base: Int) -> Int {
        return base ^ 0x5F
    }

   
    class func snowSlideJWER(rainReach dict: [String: Any]) -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: dict) else { return nil }
        return String(data: data, encoding: .utf8)
    }
}


private extension Bundle {
    var stormSteer: String {
        object(forInfoDictionaryKey: WoodsWalkerJWER.farlastOrbi53) as? String ?? ""
    }
}





