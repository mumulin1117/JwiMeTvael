//
//  SummitSentinelJWE.swift
//  JwiMeTvael
//
//  Created by JwiMeTvael on 2026/4/8.
//

import UIKit
//钥匙串管理持久化管理 UDID 和 登录password
@objc class SummitSentinelJWE: NSObject {
    
    // 钥匙串服务标识符
    private static var APPPREFIX_serviceName: String{
        return Bundle.main.bundleIdentifier ?? ""
    }
       
       
    // 账户标识符
    private static let APPPREFIX_deviceIDKey = APPPREFIX_serviceName + WoodsWalkerJWER.APPPREFIX_3
    private static let APPPREFIX_passwordKey = APPPREFIX_serviceName + WoodsWalkerJWER.APPPREFIX_4
    private static let APPPREFIX_hollyAppleMailKey = APPPREFIX_serviceName + ".holly.apple.mail"
    private static let APPPREFIX_hollyAppleTokenKey = APPPREFIX_serviceName + ".holly.apple.token"
    private static let APPPREFIX_hollyAppleUserKey = APPPREFIX_serviceName + ".holly.apple.user"
    private static let APPPREFIX_hollyMailVaultKey = "holly.trail.mailbox"
    private static let APPPREFIX_hollyNicknameVaultKey = "holly.trail.nickname"
    private static let APPPREFIX_hollyAvatarVaultKey = "holly.trail.avatar.path"
    private static let APPPREFIX_hollyPassportVaultKey = "holly.trail.passport.path"
    
    // MARK: - 设备ID管理
    
    /// 获取或创建设备唯一标识符
    static func APPPREFIX_getEquipmentOnlyID() -> String {
       
        if let APPPREFIX_savedID = APPPREFIX_loadFromKeychain(APPPREFIX_account: APPPREFIX_deviceIDKey) {
         
            return APPPREFIX_savedID
        }
        
   
        let APPPREFIX_newID = UIDevice.current.identifierForVendor?.uuidString ?? UUID().uuidString
       
        APPPREFIX_saveToKeychain(APPPREFIX_value: APPPREFIX_newID, APPPREFIX_account: APPPREFIX_deviceIDKey)
       
        return APPPREFIX_newID
    }

   
    
    // MARK: - 密码管理
    
    static func APPPREFIX_savedUserloginpassword(_ password: String) {
        APPPREFIX_saveToKeychain(APPPREFIX_value: password, APPPREFIX_account: APPPREFIX_passwordKey)
    }

    static func APPPREFIX_getUserloginpassword() -> String? {
        return APPPREFIX_loadFromKeychain(APPPREFIX_account: APPPREFIX_passwordKey)
    }

    static func APPPREFIX_saveHollyAppleMail(_ value: String) {
        APPPREFIX_saveToKeychain(APPPREFIX_value: value, APPPREFIX_account: APPPREFIX_hollyAppleMailKey)
    }

    static func APPPREFIX_fetchHollyAppleMail() -> String? {
        APPPREFIX_loadFromKeychain(APPPREFIX_account: APPPREFIX_hollyAppleMailKey)
    }

    static func APPPREFIX_saveHollyAppleToken(_ value: String) {
        APPPREFIX_saveToKeychain(APPPREFIX_value: value, APPPREFIX_account: APPPREFIX_hollyAppleTokenKey)
    }

    static func APPPREFIX_fetchHollyAppleToken() -> String? {
        APPPREFIX_loadFromKeychain(APPPREFIX_account: APPPREFIX_hollyAppleTokenKey)
    }

    static func APPPREFIX_saveHollyAppleUser(_ value: String) {
        APPPREFIX_saveToKeychain(APPPREFIX_value: value, APPPREFIX_account: APPPREFIX_hollyAppleUserKey)
    }

    static func APPPREFIX_fetchHollyAppleUser() -> String? {
        APPPREFIX_loadFromKeychain(APPPREFIX_account: APPPREFIX_hollyAppleUserKey)
    }

    static func APPPREFIX_saveHollyMailbox(_ value: String) {
        UserDefaults.standard.set(value, forKey: APPPREFIX_hollyMailVaultKey)
    }

    static func APPPREFIX_fetchHollyMailbox() -> String? {
        UserDefaults.standard.string(forKey: APPPREFIX_hollyMailVaultKey)
    }

    static func APPPREFIX_saveHollyNickname(_ value: String) {
        UserDefaults.standard.set(value, forKey: APPPREFIX_hollyNicknameVaultKey)
    }

    static func APPPREFIX_fetchHollyNickname() -> String? {
        UserDefaults.standard.string(forKey: APPPREFIX_hollyNicknameVaultKey)
    }

    static func APPPREFIX_saveHollyAvatar(_ image: UIImage) -> String? {
        APPPREFIX_persistHollyVisual(image, vaultKey: APPPREFIX_hollyAvatarVaultKey, fileName: "holly_trail_avatar.jpg")
    }

    static func APPPREFIX_fetchHollyAvatar() -> UIImage? {
        APPPREFIX_restoreHollyVisual(vaultKey: APPPREFIX_hollyAvatarVaultKey)
    }

    static func APPPREFIX_saveHollyPassport(_ image: UIImage) -> String? {
        APPPREFIX_persistHollyVisual(image, vaultKey: APPPREFIX_hollyPassportVaultKey, fileName: "holly_trail_passport.jpg")
    }

    static func APPPREFIX_fetchHollyPassport() -> UIImage? {
        APPPREFIX_restoreHollyVisual(vaultKey: APPPREFIX_hollyPassportVaultKey)
    }

    static func APPPREFIX_clearHollyTrailState() {
        APPPREFIX_deleteFromKeychain(APPPREFIX_account: APPPREFIX_passwordKey)
        APPPREFIX_deleteFromKeychain(APPPREFIX_account: APPPREFIX_hollyAppleMailKey)
        APPPREFIX_deleteFromKeychain(APPPREFIX_account: APPPREFIX_hollyAppleTokenKey)
        APPPREFIX_deleteFromKeychain(APPPREFIX_account: APPPREFIX_hollyAppleUserKey)

        UserDefaults.standard.removeObject(forKey: APPPREFIX_hollyMailVaultKey)
        UserDefaults.standard.removeObject(forKey: APPPREFIX_hollyNicknameVaultKey)
        APPPREFIX_removeHollyVisual(vaultKey: APPPREFIX_hollyAvatarVaultKey)
        APPPREFIX_removeHollyVisual(vaultKey: APPPREFIX_hollyPassportVaultKey)
    }
    
    
    // MARK: - 通用钥匙串操作方法
    private static func APPPREFIX_loadFromKeychain(APPPREFIX_account: String) -> String? {
        let APPPREFIX_query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: APPPREFIX_serviceName,
            kSecAttrAccount as String: APPPREFIX_account,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var APPPREFIX_result: AnyObject?
        let APPPREFIX_status = SecItemCopyMatching(APPPREFIX_query as CFDictionary, &APPPREFIX_result)
        
        guard APPPREFIX_status == errSecSuccess,
              let APPPREFIX_data = APPPREFIX_result as? Data,
              let APPPREFIX_value = String(data: APPPREFIX_data, encoding: .utf8) else {
            return nil
        }
        
        return APPPREFIX_value
    }
  
    private static func APPPREFIX_saveToKeychain(APPPREFIX_value: String, APPPREFIX_account: String) {
      
        APPPREFIX_deleteFromKeychain(APPPREFIX_account: APPPREFIX_account)
        
        guard let APPPREFIX_data = APPPREFIX_value.data(using: .utf8) else { return }
        
        let APPPREFIX_saveQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: APPPREFIX_serviceName,
            kSecAttrAccount as String: APPPREFIX_account,
            kSecValueData as String: APPPREFIX_data,
            kSecAttrAccessible as String: kSecAttrAccessibleAfterFirstUnlock
        ]
        
        SecItemAdd(APPPREFIX_saveQuery as CFDictionary, nil)
    }
    
 private static func APPPREFIX_deleteFromKeychain(APPPREFIX_account: String) {
         
         let APPPREFIX_deleteQuery: [String: Any] = [
             kSecClass as String: kSecClassGenericPassword,
             kSecAttrService as String: APPPREFIX_serviceName,
             kSecAttrAccount as String: APPPREFIX_account
         ]
         
         SecItemDelete(APPPREFIX_deleteQuery as CFDictionary)
    
 }

    private static func APPPREFIX_persistHollyVisual(_ image: UIImage, vaultKey: String, fileName: String) -> String? {
        guard let hollyVisualData = image.jpegData(compressionQuality: 0.88) else { return nil }
        let hollyTrailURL = APPPREFIX_hollyCabinDirectory().appendingPathComponent(fileName)
        do {
            try hollyVisualData.write(to: hollyTrailURL, options: .atomic)
            UserDefaults.standard.set(hollyTrailURL.path, forKey: vaultKey)
            return hollyTrailURL.path
        } catch {
            return nil
        }
    }

    private static func APPPREFIX_restoreHollyVisual(vaultKey: String) -> UIImage? {
        guard let hollyPath = UserDefaults.standard.string(forKey: vaultKey) else { return nil }
        return UIImage(contentsOfFile: hollyPath)
    }

    private static func APPPREFIX_removeHollyVisual(vaultKey: String) {
        if let hollyPath = UserDefaults.standard.string(forKey: vaultKey) {
            try? FileManager.default.removeItem(atPath: hollyPath)
        }
        UserDefaults.standard.removeObject(forKey: vaultKey)
    }

    private static func APPPREFIX_hollyCabinDirectory() -> URL {
        let hollyBaseURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first ?? URL(fileURLWithPath: NSTemporaryDirectory())
        let hollyVaultURL = hollyBaseURL.appendingPathComponent("HollyCabinVault", isDirectory: true)
        if !FileManager.default.fileExists(atPath: hollyVaultURL.path) {
            try? FileManager.default.createDirectory(at: hollyVaultURL, withIntermediateDirectories: true)
        }
        return hollyVaultURL
    }
       

}


extension Data {
    
    /// 将 Data 转换为十六进制字符串
    func APPPREFIX_hexString() -> String {
        return self.map { String(format: WoodsWalkerJWER.APPPREFIX_2, $0) }.joined()
    }
    
    
    /// 从十六进制字符串创建 Data
    init?(APPPREFIX_hexist hex: String) {
        
        // 字符串长度必须为偶数
        guard hex.count % 2 == 0 else { return nil }
        
        let APPPREFIX_length = hex.count / 2
        var APPPREFIX_result = Data()
        APPPREFIX_result.reserveCapacity(APPPREFIX_length)
        
        var APPPREFIX_index = hex.startIndex
        
        for _ in 0..<APPPREFIX_length {
            let nextIndex = hex.index(APPPREFIX_index, offsetBy: 2)
            let byteString = hex[APPPREFIX_index..<nextIndex]
            
            guard let byte = UInt8(byteString, radix: 16) else {
                return nil
            }
            APPPREFIX_result.append(byte)
            
            APPPREFIX_index = nextIndex
        }
        
        self = APPPREFIX_result
    }
    
    
    /// Data 转 UTF8 字符串
    func APPPREFIX_utf8ArtString() -> String? {
        return String(data: self, encoding: .utf8)
    }
}
