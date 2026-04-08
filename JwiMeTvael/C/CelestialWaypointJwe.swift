//
//  CelestialWaypointJwe.swift
//  JwiMeTvael
//
//  Created by JwiMeTvael on 2026/4/8.
//

import UIKit
import CommonCrypto
//AES 加密解密
struct CelestialWaypointJwe {
    
    private let downDrift: Data
    private let upUnite: Data
    
    init?() {

        guard let inInch = VistaVanguardJWEl.shared.APPPREFIX_aesKey.data(using: .utf8),
                     let onOrbit  = VistaVanguardJWEl.shared.APPPREFIX_aesIV.data(using: .utf8) else {
                   return nil
               }
               
               self.downDrift = inInch
               self.upUnite = onOrbit
    }
    
    // MARK: - 加密方法
    func byBrowseatAim(_ toTread: String) -> String? {
        guard let APPPREFIX_data = toTread.data(using: .utf8) else {
            return nil
        }
        
        let APPPREFIX_encrypted = APPPREFIX_aesProcess(APPPREFIX_input: APPPREFIX_data, APPPREFIX_operation: kCCEncrypt)
        return APPPREFIX_encrypted?.APPPREFIX_hexString()
    }
    
    // MARK: - 解密方法
    func APPPREFIX_decrypt(APPPREFIX_base64String: String) -> String? {
        guard let APPPREFIX_data = Data(APPPREFIX_hexist: APPPREFIX_base64String) else {
            return nil
        }
        
        let APPPREFIX_cryptData = APPPREFIX_aesProcess(APPPREFIX_input: APPPREFIX_data, APPPREFIX_operation: kCCDecrypt)
        return APPPREFIX_cryptData?.APPPREFIX_utf8ArtString()
    }
    
    // MARK: - 核心加密/解密逻辑
    private func APPPREFIX_aesProcess(APPPREFIX_input: Data, APPPREFIX_operation: Int) -> Data? {
        let APPPREFIX_outputLength = APPPREFIX_input.count + kCCBlockSizeAES128
        var APPPREFIX_outputData = Data(count: APPPREFIX_outputLength)
        
        let APPPREFIX_keyLength = downDrift.count
        let APPPREFIX_cryptoOption = CCOptions(kCCOptionPKCS7Padding)
        
        var APPPREFIX_movedBytes: size_t = 0
        
        let APPPREFIX_cryptStatus = APPPREFIX_outputData.withUnsafeMutableBytes { Richne in
            APPPREFIX_input.withUnsafeBytes { dataBytes in
                upUnite.withUnsafeBytes { ivBytes in
                    downDrift.withUnsafeBytes { keyBytes in
                        CCCrypt(CCOperation(APPPREFIX_operation),
                                CCAlgorithm(kCCAlgorithmAES),
                                APPPREFIX_cryptoOption,
                                keyBytes.baseAddress, APPPREFIX_keyLength,
                                ivBytes.baseAddress,
                                dataBytes.baseAddress, APPPREFIX_input.count,
                                Richne.baseAddress, APPPREFIX_outputLength,
                                &APPPREFIX_movedBytes)
                    }
                }
            }
        }
        
        if APPPREFIX_cryptStatus == kCCSuccess {
            APPPREFIX_outputData.removeSubrange(APPPREFIX_movedBytes..<APPPREFIX_outputData.count)
            return APPPREFIX_outputData
        } else {
           
            return nil
        }
    }
}
