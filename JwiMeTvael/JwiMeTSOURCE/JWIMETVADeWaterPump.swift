import UIKit
import CryptoKit
import Foundation

// MARK: - 1. 配置常量 (Constants)
// ⚠️ 必须与 macOS 加密工具中的配置完全一致！
private let JWIMETVADeHEX_KEY = "6E7C9B1A1D2F3146C5B8A9D0E7F13C249B7E7D7F7A5C7B2E8D3F1C0A6B7E7D7F"
private let JWIMETVADeNONCE_SIZE = 16
private let JWIMETVADeTAG_SIZE = 16
private let ENCRYPTED_EXTENSION = "enc"

// MARK: - 2. Data 扩展 (Utilities)

extension Data {
  
    init?(hexString: String) {
        let JWIMETVADelen = hexString.count
        guard JWIMETVADelen % 2 == 0 else { return nil }
        var JWIMETVADedata = Data(capacity: JWIMETVADelen / 2)
        var JWIMETVADei = hexString.startIndex
        
        while JWIMETVADei < hexString.endIndex {
            let JWIMETVADej = hexString.index(JWIMETVADei, offsetBy: 2)
            let bytes = hexString[JWIMETVADei..<JWIMETVADej]
            if var num = UInt8(bytes, radix: 16) {
                JWIMETVADedata.append(&num, count: 1)
            } else {
                return nil
            }
            JWIMETVADei = JWIMETVADej
        }
        self = JWIMETVADedata
    }
}

// MARK: - 3. 图片解密加载器 (Image Decryption Loader)

class JWIMETVADecolorfusioning {
    
    private static var JWIMETVADefabricsurface: SymmetricKey? = {
        guard let JWIMETVADekeyData = Data(hexString: JWIMETVADeHEX_KEY), JWIMETVADekeyData.count == 32 else {
            fatalError("Decryption key error: Invalid HEX_KEY provided.")
        }
        return SymmetricKey(data: JWIMETVADekeyData)
    }()

  
    static func JWIMETVADegarmentripple(JWIMETVADepaletteform name: String) -> UIImage? {
        guard let JWIMETVADekey = JWIMETVADefabricsurface else { return nil }
        
      
        guard let JWIMETVADeurl = Bundle.main.url(forResource: name, withExtension: ENCRYPTED_EXTENSION),
              let fullEncryptedData = try? Data(contentsOf: JWIMETVADeurl) else {
          
            return nil
        }
        
  
        let JWIMETVADenonceData = fullEncryptedData.prefix(JWIMETVADeNONCE_SIZE)
        let JWIMETVADetagStartIndex = fullEncryptedData.count - JWIMETVADeTAG_SIZE
        
        guard JWIMETVADetagStartIndex >= JWIMETVADeNONCE_SIZE else {
            
            return nil
        }
        
        let JWIMETVADeciphertextData = fullEncryptedData.subdata(in: JWIMETVADeNONCE_SIZE..<JWIMETVADetagStartIndex)
        let JWIMETVADetagData = fullEncryptedData.suffix(JWIMETVADeTAG_SIZE)
        
        do {
          
            let JWIMETVADenonce = try AES.GCM.Nonce(data: JWIMETVADenonceData)
            let JWIMETVADesealedBox = try AES.GCM.SealedBox(nonce: JWIMETVADenonce, ciphertext: JWIMETVADeciphertextData, tag: JWIMETVADetagData)
            
            let JWIMETVADedecryptedData = try AES.GCM.open(JWIMETVADesealedBox, using: JWIMETVADekey)
          
            guard let JWIMETVADedecoded = UIImage(data: JWIMETVADedecryptedData) else { return nil }
            
          
            if let JWIMETVADecg = JWIMETVADedecoded.cgImage {
                return UIImage(cgImage: JWIMETVADecg, scale: 3, orientation: .up)
            } else {
                return JWIMETVADedecoded
            }
            
        } catch {
           
            return nil
        }
    }
}
