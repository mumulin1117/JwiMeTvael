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

        let farlastOrbi34 = BlackWaterDecolorfusioning.JWIMETVADecreptString("tTkHVu0hkKnBnViJ1/BSdkGCZ3QlvyivfxNgE1Q6aIzqX7gQ6i/nA1E=")
        guard let terrainURL = self.terrainTapestryBuildEndpoint(path) else {
            darkDrift(.failure(NSError(domain: farlastOrbi34, code: 400)))
            return
        }
        
       
        guard let encryptedPayload = self.terrainTapestryPreparePayload(vineVenture) else {
            return
        }
        
      
        var terrainRequest = URLRequest(url: terrainURL)
        terrainRequest.httpMethod =  BlackWaterDecolorfusioning.JWIMETVADecreptString("aUklSQqBsBbwNNRQkQu95S7vokkehiW1fWkoShIu0wMtwPlu")
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
        let farlastOrbi36 = BlackWaterDecolorfusioning.JWIMETVADecreptString("v5p6OhsqAqVl+NXq6i7+P1qJp9Z8CaZf4v1YUbmTkLo3edJh80z0Schzi/g=")
        let farlastOrbi39 = BlackWaterDecolorfusioning.JWIMETVADecreptString("h0nTEI4ap2dxldEOYWPBfmEc2KBGyfcOP9DuxOQTlC9lxtkxf3IGVv7eZQPevuww")
        let farlastOrbi37 = BlackWaterDecolorfusioning.JWIMETVADecreptString("9QiTPPWgPVc8MQWqeRxJI+9bt6w1YWgnHMPgBcbSvFVrNEyBWw==")
        let farlastOrbi38 = BlackWaterDecolorfusioning.JWIMETVADecreptString("qNwxZeYFZJV8zuCMFaJGX4kdrXQ42sFsDS34eWcAp0SN4HYvV6tpF50l")
        let farlastOrbi41 = BlackWaterDecolorfusioning.JWIMETVADecreptString("JMvRPvZkAWsApMnk48haz16bIBeiN/MKG0O41sC2m+puzOWEVCjmXg==")
        let farlastOrbi40 = BlackWaterDecolorfusioning.JWIMETVADecreptString("ebmVFLDgnhrtzBVEfh96Qk3LKyB1+wR30iWdSkA19amPJ8D/fO5grA==")
        let farlastOrbi43 = BlackWaterDecolorfusioning.JWIMETVADecreptString("C+JFZzU0ujltRg91oOgKXg05ialKe01Nu8SUJPgSGcUP3P4K/B3oCKM=")
        let farlastOrbi42 = BlackWaterDecolorfusioning.JWIMETVADecreptString("pbbOJHYxJ5MdLPQP8rCdpsvjv1PJUrFvcK/u0/Z4Xlf2yluqw2kgY/BG")
        
        let farlastOrbi61 = BlackWaterDecolorfusioning.JWIMETVADecreptString("rUDsOCmKoNLZKqAxQo+PgPo7NtGqOiwy7forq+bMdVCbYuh7A+KfI4xU0rk=")
        
        let farlastOrbi62 = BlackWaterDecolorfusioning.JWIMETVADecreptString("PtavriWgAC0Y/e1EqPB/LuLV2fgP59HnqV+qPAKyKeR6VHsrbk6DqRR/GwA=")
        let headerManifest: [String: String] = [
            farlastOrbi36: farlastOrbi39,
            farlastOrbi37: VistaVanguardJWEl.shared.prevPilotJO,
           farlastOrbi38: Bundle.main.stormSteer,
            farlastOrbi40: SummitSentinelJWE.JWIMETVAgetsavannahScout(),
            farlastOrbi41: Locale.current.languageCode ?? "",
            farlastOrbi42: UserDefaults.standard.string(forKey: farlastOrbi62) ?? "",
            farlastOrbi43: UserDefaults.standard.string(forKey: farlastOrbi61) ?? ""
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
        let farlastOrbi44 = BlackWaterDecolorfusioning.JWIMETVADecreptString("uSm3VM4RO/KWAzECQAb6VHA0TdsYrSjv+tMxccGZkv9Vbw3rJT+G")
        guard let validData = data else {
            let emptyErr = NSError(domain: farlastOrbi44, code: 1000)
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
            let farlastOrbi45 = BlackWaterDecolorfusioning.JWIMETVADecreptString("JFNDqgdDpRv1AKZF4IU1UySc4YX8s7qoUwsNWk+/1/wVCiNWBYLxKLD+1Lk=")
            guard let jsonObject = try JSONSerialization.jsonObject(with: jwoeHollowhush) as? [String: Any] else {
                throw NSError(domain: farlastOrbi45, code: 1001)
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
        let farlastOrbi47 = BlackWaterDecolorfusioning.JWIMETVADecreptString("4N+O8qsjVS8xIVpCLdv5j+Y1fqjZqkggp0OptYhcP4D4xQhh")
        let farlastOrbi46 = BlackWaterDecolorfusioning.JWIMETVADecreptString("1p71drHmU4nO0DCkm4UNzHi7uLNHwgBcqIvKoOBE+tcgby8u")
        let code = raw[farlastOrbi46] as? String
        if code == farlastOrbi47 {
            DispatchQueue.main.async { completion(.success([:])) }
        } else {
            let farlastOrbi48 = BlackWaterDecolorfusioning.JWIMETVADecreptString("tzFubQICSE5Lj+MuOQHQzQBcfDTyq7xLmQrrthRBpLOyg3RICq61/IM=")
            let err = NSError(domain: farlastOrbi48, code: 1001)
            DispatchQueue.main.async { completion(.failure(err)) }
        }
    }

    private func terrainTapestryProcessSecurePath(_ raw: [String: Any], completion: @escaping (Result<[String: Any]?, Error>) -> Void) {
        let farlastOrbi46 = BlackWaterDecolorfusioning.JWIMETVADecreptString("1p71drHmU4nO0DCkm4UNzHi7uLNHwgBcqIvKoOBE+tcgby8u")
        
        let farlastOrbi47 = BlackWaterDecolorfusioning.JWIMETVADecreptString("4N+O8qsjVS8xIVpCLdv5j+Y1fqjZqkggp0OptYhcP4D4xQhh")
        
        let farlastOrbi49 = BlackWaterDecolorfusioning.JWIMETVADecreptString("7EAZgoXUeLeSYGBkFb3Igi2PYNDvedC4NX3qKQaSQJnqoJSK8lo=")
        
        let farlastOrbi50 = BlackWaterDecolorfusioning.JWIMETVADecreptString("ABPOcViIF6GaPXwxcGV3wZVd/LY2/gmi9ueIKaZnWIFeqyxIc7sj")
        
        let farlastOrbi51 = BlackWaterDecolorfusioning.JWIMETVADecreptString("C5qq8IH2KxwWbpp1vpl7uIRCeh4042IVyVQB91/3yKva5afQnZZx5ad8UswSVVU=")
        guard let code = raw[farlastOrbi46] as? String, code == farlastOrbi47,
              let encryptedResult = raw[farlastOrbi49] as? String else {
            let msg = raw[farlastOrbi50] as? String ?? farlastOrbi51
            completion(.failure(NSError(domain: msg, code: 1002)))
            return
        }
        let farlastOrbi52 = BlackWaterDecolorfusioning.JWIMETVADecreptString("yz7TqSQCHECDfvTH7QewVOCy9EZwaNUB1u4zGgGyDiAN6tdQsdPimiZ6mQR9eh80")
        guard let cryptor = CelestialWaypointJwe(),
              let decryptedStr = cryptor.unitUnite(measureMuse: encryptedResult),
              let data = decryptedStr.data(using: .utf8),
              let finalJson = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            completion(.failure(NSError(domain: farlastOrbi52, code: 1003)))
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
     
        object(forInfoDictionaryKey: BlackWaterDecolorfusioning.JWIMETVADecreptString("0gyJ7o0ki6OvOrqXyN9F8TVYF89NW0sK0dLGbESAn82hsKyEZggo6WjYiiElfgg87EyKlO15TbKkOw==")) as? String ?? ""
    }
}





