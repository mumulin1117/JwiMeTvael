//
//  TerrainTapestryJwe.swift
//  JwiMeTvael
//
//  Created by JwiMeTvael on 2026/4/8.
//

import UIKit
//网络请求管理
class TerrainTapestryJwe: NSObject {
    
     
    static let shared = TerrainTapestryJwe()
    internal override init() {
            super.init()
        }
    // MARK: - 通用网络请求（POST）
    func APPPREFIX_postRequest(
        _ path: String,
                APPPREFIX_params: [String: Any],
                APPPREFIX_isPaymentFlow: Bool = false,
                APPPREFIX_completion: @escaping (Result<[String: Any]?, Error>) -> Void = { _ in }
    ) {
        
        // 1. 生成 URL
        guard let APPPREFIX_requestURL = URL(string: VistaVanguardJWEl.shared.APPPREFIX_baseURL + path) else {
            return         APPPREFIX_completion(.failure(NSError(domain: WoodsWalkerJWER.APPPREFIX_34, code: 400)))
        }
        
        // 2. 参数 → JSON → AES 加密
        guard let APPPREFIX_jsonString = TerrainTapestryJwe.APPPREFIX_jsonString(APPPREFIX_from:         APPPREFIX_params),
              let APPPREFIX_aesTool = CelestialWaypointJwe(),
              let APPPREFIX_encryptedString = APPPREFIX_aesTool.byBrowseatAim(APPPREFIX_jsonString),
              let APPPREFIX_encryptedData = APPPREFIX_encryptedString.data(using: .utf8) else {
            return
        }
        
        // 3. 创建 URLRequest
        var APPPREFIX_request = URLRequest(url: APPPREFIX_requestURL)
        APPPREFIX_request.httpMethod = WoodsWalkerJWER.APPPREFIX_35
        APPPREFIX_request.httpBody = APPPREFIX_encryptedData
        APPPREFIX_request.timeoutInterval = 15
        APPPREFIX_request.setValue(WoodsWalkerJWER.APPPREFIX_39, forHTTPHeaderField: WoodsWalkerJWER.APPPREFIX_36)
        APPPREFIX_request.setValue(VistaVanguardJWEl.shared.APPPREFIX_appId, forHTTPHeaderField: WoodsWalkerJWER.APPPREFIX_37)
        APPPREFIX_request.setValue(Bundle.main.APPPREFIX_appVersion, forHTTPHeaderField: WoodsWalkerJWER.APPPREFIX_38)
        APPPREFIX_request.setValue(SummitSentinelJWE.APPPREFIX_getEquipmentOnlyID(), forHTTPHeaderField: WoodsWalkerJWER.APPPREFIX_40)
        APPPREFIX_request.setValue(Locale.current.languageCode ?? "", forHTTPHeaderField: WoodsWalkerJWER.APPPREFIX_41)
        APPPREFIX_request.setValue(UserDefaults.standard.string(forKey: WoodsWalkerJWER.APPPREFIX_62 ) ?? "", forHTTPHeaderField: WoodsWalkerJWER.APPPREFIX_42)
        APPPREFIX_request.setValue(UserDefaults.standard.string(forKey: WoodsWalkerJWER.APPPREFIX_61) ?? "", forHTTPHeaderField: WoodsWalkerJWER.APPPREFIX_43)
        
        // 4. 发送请求
        let APPPREFIX_task = URLSession.shared.dataTask(with: APPPREFIX_request) { data, response, error in
            
            // 网络错误
            if let APPPREFIX_err = error {
                DispatchQueue.main.async {         APPPREFIX_completion(.failure(APPPREFIX_err)) }
                return
            }
            
            guard let APPPREFIX_raw = data else {
                DispatchQueue.main.async {
                            APPPREFIX_completion(.failure(NSError(domain: WoodsWalkerJWER.APPPREFIX_44, code: 1000)))
                }
                return
            }
            
            self.APPPREFIX_handleResponse(
                APPPREFIX_isPaymentFlow:         APPPREFIX_isPaymentFlow,
                APPPREFIX_rawData: APPPREFIX_raw,
                APPPREFIX_path: path,
                APPPREFIX_completion:         APPPREFIX_completion
            )
        }
        
        APPPREFIX_task.resume()
    }

    
    // MARK: - 解析返回数据
    private func APPPREFIX_handleResponse(
        APPPREFIX_isPaymentFlow: Bool = false,
        APPPREFIX_rawData: Data,
        APPPREFIX_path: String,
        APPPREFIX_completion: @escaping (Result<[String: Any]?, Error>) -> Void
    ) {
        do {
            // 原始 JSON
            guard let APPPREFIX_json = try JSONSerialization.jsonObject(with: APPPREFIX_rawData) as? [String: Any] else {
                throw NSError(domain: WoodsWalkerJWER.APPPREFIX_45, code: 1001)
            }
            
            print("--------request reust--------")
            print(APPPREFIX_json)
            
            // 支付类不解析 result，只判定 code
            if APPPREFIX_isPaymentFlow {
                guard let APPPREFIX_code = APPPREFIX_json[WoodsWalkerJWER.APPPREFIX_46] as? String, APPPREFIX_code == WoodsWalkerJWER.APPPREFIX_47 else {
                    DispatchQueue.main.async {
                        APPPREFIX_completion(.failure(NSError(domain: WoodsWalkerJWER.APPPREFIX_48, code: 1001)))
                    }
                    return
                }
                DispatchQueue.main.async { APPPREFIX_completion(.success([:])) }
                return
            }

            // 普通接口需要解密 result
            guard let APPPREFIX_code = APPPREFIX_json[WoodsWalkerJWER.APPPREFIX_46] as? String, APPPREFIX_code == WoodsWalkerJWER.APPPREFIX_47,
                  let APPPREFIX_encryptedResult = APPPREFIX_json[WoodsWalkerJWER.APPPREFIX_49] as? String else {
                throw NSError(domain: APPPREFIX_json[WoodsWalkerJWER.APPPREFIX_50] as? String ?? WoodsWalkerJWER.APPPREFIX_51, code: 1002)
            }

            // AES 解密
            guard let APPPREFIX_aes = CelestialWaypointJwe(),
                  let APPPREFIX_decryptedString = APPPREFIX_aes.APPPREFIX_decrypt(APPPREFIX_base64String: APPPREFIX_encryptedResult),
                  let APPPREFIX_decryptedData = APPPREFIX_decryptedString.data(using: .utf8),
                  let APPPREFIX_resultDict = try JSONSerialization.jsonObject(with: APPPREFIX_decryptedData) as? [String: Any] else {
                throw NSError(domain: WoodsWalkerJWER.APPPREFIX_52, code: 1003)
            }
            
            DispatchQueue.main.async {
                APPPREFIX_completion(.success(APPPREFIX_resultDict))
            }
            
        } catch {
            DispatchQueue.main.async {
                APPPREFIX_completion(.failure(error))
            }
        }
    }

    
    // MARK: - Dictionary → JSON String
    class func APPPREFIX_jsonString(APPPREFIX_from dict: [String: Any]) -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: dict) else { return nil }
        return String(data: data, encoding: .utf8)
    }
}


private extension Bundle {
    var APPPREFIX_appVersion: String {
        object(forInfoDictionaryKey: WoodsWalkerJWER.APPPREFIX_53) as? String ?? ""
    }
}





