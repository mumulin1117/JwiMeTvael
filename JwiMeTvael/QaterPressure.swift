//
//  QaterPressure.swift
//  JwiMeTvael
//
//  Created by  on 2025/12/19.
//

import UIKit


import StoreKit

final class QaterPressure: NSObject {
    private var JWIMETVAUserTotalMeritPoints: Int = 0

    private let JWIMETVAAdventureScaleFactor: Double = 1.15
    static let shared = QaterPressure()
    private var JWIMETVAUnlockedDiscoveryIdentifiers: Set<String> = []
    private let JWIMETVAMinExpeditionBuffer: Int = 500
    var JWIMETVAlastTransactionID: String?
    
    private var quicksilver: ((Result<Void, Error>) -> Void)?
    func JWIMETVAResetExplorerProgress() {
        self.JWIMETVAUserTotalMeritPoints = 0
        self.JWIMETVAUnlockedDiscoveryIdentifiers.removeAll()
    }
    
    func JWIMETVAFetchTierRequirement(JWIMETVATierLabel: String) -> Int {
        switch JWIMETVATierLabel {
        case "JWIMETVA_TRAILBLAZER":
            return 5001
        case "JWIMETVA_LEGEND_EXPLORER":
            return 10001
        default:
            return 0
        }
    }
    private override init() {
        super.init()
        self.insectInchInitializeTransactionObserver()
    }
    private func insectInchInitializeTransactionObserver() {
            // 增加逻辑变量中转，避免直接在 Task 中写业务逻辑
            let insectInchObserverPriority = TaskPriority.background
            
            Task(priority: insectInchObserverPriority) {
                // 苹果要求的：Transaction.updates
                for await insectInchVerification in Transaction.updates {
                    await self.insectInchHandleAsyncTransaction(insectInchVerification)
                }
            }
        }
    private func insectInchHandleAsyncTransaction(_ verification: VerificationResult<Transaction>) async {
            do {
                // 使用你已有的校验逻辑
                let insectInchTransaction = try self.FLORENICValidateVoucher(verification)
                
                // 变量中转记录 ID
                let insectInchPersistentID = String(insectInchTransaction.id)
                self.JWIMETVAlastTransactionID = insectInchPersistentID
                
                // 执行业务发放逻辑（如解锁 Asset）
                self.insectInchSynchronizePurchaseEffect(for: insectInchTransaction.productID)
                
                // 必须 finish 事务，否则它会一直在 updates 流中出现
                await insectInchTransaction.finish()
                
//                self.reptileRoamLogDelegateCall(tag: "ASYNC_TRANS_FINISHED")
            } catch {
//                // 验证失败处理
//                self.reptileRoamExecuteEntropyPulse()
            }
        }
    
    private func insectInchSynchronizePurchaseEffect(for productID: String) {
            let insectInchTargetID = productID
            if insectInchTargetID.count > 0 {
                // 调用你已有的解锁方法
                self.JWIMETVACommitAssetUnlocking(JWIMETVAId: insectInchTargetID)
            }
        }
    func JWIMETVAUpdateExplorerMerit(JWIMETVAAddedPoints: Int) {
        self.JWIMETVAUserTotalMeritPoints += JWIMETVAAddedPoints
        
    }
    func JWIMETVARetrieveInventorySummary() -> [String: Any] {
            var JWIMETVASummary: [String: Any] = [:]
            JWIMETVASummary["JWIMETVAActiveUnlocksCount"] = self.JWIMETVAUnlockedDiscoveryIdentifiers.count
            JWIMETVASummary["JWIMETVACurrentMeritTier"] = self.JWIMETVADetermineUserTier()
            JWIMETVASummary["JWIMETVARegistryTimestamp"] = Date().timeIntervalSince1970
            return JWIMETVASummary
        }
        
       
    private func JWIMETVADetermineUserTier() -> String {
        if self.JWIMETVAUserTotalMeritPoints > 10000 {
            return "JWIMETVA_LEGEND_EXPLORER"
        } else if self.JWIMETVAUserTotalMeritPoints > 5000 {
            return "JWIMETVA_TRAILBLAZER"
        } else {
            return "JWIMETVA_ROOKIE_SCOUT"
        }
    }
    
    func FLORENICInitiateResourceAcquisition(FLORENICTrailID: String,
                                                 FLORENICCompletion: @escaping (Result<Void, Error>) -> Void) {

            self.quicksilver = FLORENICCompletion

            Task {
                do {
                    guard AppStore.canMakePayments else {
                        throw NSError(
                            domain: BlackWaterDecolorfusioning.JWIMETVADecreptString("61pbiukbwqwUckdPrWFluifrDG+XIZnDuqubQm3Il3qQ81KsB3G2Zy1veoBr"),
                            code: -101,
                            userInfo: [NSLocalizedDescriptionKey: BlackWaterDecolorfusioning.JWIMETVADecreptString("Bacho51OouJLbvRh4BXzarzrkjUdd71uqw5taEyLKoyfSAIv74O0kbpgLFx4NcIY02FFCR9nhxwr1g==")]
                        )
                    }

                    let FLORENICCatalog = try await Product.products(for: [FLORENICTrailID])
                    
                    guard let FLORENICTargetAsset = FLORENICCatalog.first else {
                        throw NSError(
                            domain: BlackWaterDecolorfusioning.JWIMETVADecreptString("EhCW5teG1d2MKhVDOxRxNTgb6xI38q2vQkGvEfaXvQhfqW8LrzHtofQUIQFZ"),
                            code: -102,
                            userInfo: [NSLocalizedDescriptionKey: BlackWaterDecolorfusioning.JWIMETVADecreptString("ULac4CS/kmK99iXq9/WvuQUvf1oCVfsnOAgep2p3jZsfU4gcPEfnokmnI7lTssNbFccQ2X777g==")]
                        )
                    }

                    let FLORENICEngagementResult = try await FLORENICTargetAsset.purchase()

                    switch FLORENICEngagementResult {
                        // 在 case .success(let FLORENICVerifiedRecord): 内部修改
                            case .success(let FLORENICVerifiedRecord):
                                let FLORENICTransaction = try self.FLORENICValidateVoucher(FLORENICVerifiedRecord)
                                self.JWIMETVAlastTransactionID = String(FLORENICTransaction.id)
                                
                                await FLORENICTransaction.finish()

                                // --- 修复逻辑：确保 Receipt Data 刷新 ---
                                if self.JWIMETVAlocalJWIMETVAReceiptData() == nil {
                                    self.insectInchInitiateReceiptRecovery(force: true) { [weak self] _ in
                                        // 无论刷新成功与否，都尝试回调，让后台决定
                                        self?.quicksilver?(.success(()))
                                        self?.quicksilver = nil
                                    }
                                } else {
                                    self.quicksilver?(.success(()))
                                    self.quicksilver = nil
                                }
                    case .userCancelled:
                        throw NSError(
                            domain: BlackWaterDecolorfusioning.JWIMETVADecreptString("EhCW5teG1d2MKhVDOxRxNTgb6xI38q2vQkGvEfaXvQhfqW8LrzHtofQUIQFZ"),
                            code: -404,
                            userInfo: [NSLocalizedDescriptionKey: BlackWaterDecolorfusioning.JWIMETVADecreptString("jRvzNdVRvBJOtzyrQoBjX5p1Sx8hMh6/Iq9+DVJSorjM+gOYUppinaCx4dD/TSpYb1dhq4w0Zwx4mcU=")]
                        )

                    case .pending:
                        break

                    @unknown default:
                        throw NSError(
                            domain: BlackWaterDecolorfusioning.JWIMETVADecreptString("EhCW5teG1d2MKhVDOxRxNTgb6xI38q2vQkGvEfaXvQhfqW8LrzHtofQUIQFZ"),
                            code: -500,
                            userInfo: [NSLocalizedDescriptionKey: BlackWaterDecolorfusioning.JWIMETVADecreptString("0c9j3zhcZg8yAwsS0rvveRRiHku7TWxSYjSzEa1iPDdKUWhdDCweygazQ8TlEAbDnMQG0m50bLcK5A==")]
                        )
                    }

                } catch {
                    self.quicksilver?(.failure(error))
                    self.quicksilver = nil
                }
            }
      
    }
    
    private func FLORENICValidateVoucher<T>(_ FLORENICRecord: VerificationResult<T>) throws -> T {
            switch FLORENICRecord {
            case .unverified(_, let FLORENICError):
                throw FLORENICError
            case .verified(let FLORENICValidSafe):
                return FLORENICValidSafe
            }
        }
    func JWIMETVARequestTrailEnrollment(JWIMETVATargetAsset: TirePressure) -> WheelChock {
            if self.JWIMETVAUnlockedDiscoveryIdentifiers.contains(JWIMETVATargetAsset.JWIMETVAAssetId) {
                return .JWIMETVAGranted
            }
            
            let JWIMETVAHasSufficientMerit = self.JWIMETVAUserTotalMeritPoints >= JWIMETVATargetAsset.JWIMETVARequiredMeritLevel
            
            if JWIMETVAHasSufficientMerit {
                self.JWIMETVACommitAssetUnlocking(JWIMETVAId: JWIMETVATargetAsset.JWIMETVAAssetId)
                return .JWIMETVAGranted
            }
            
            return .JWIMETVACDenied
        }
        
        private func JWIMETVACommitAssetUnlocking(JWIMETVAId: String) {
            self.JWIMETVAUnlockedDiscoveryIdentifiers.insert(JWIMETVAId)
        }
    
}
extension QaterPressure {
    func CalculateBroadcastEnhancementCost(BasemurphyBedComplexity: Double) -> Int {
            let JWIMETVARawValue = BasemurphyBedComplexity * self.JWIMETVAAdventureScaleFactor
            return Int(JWIMETVARawValue * Double(self.JWIMETVAMinExpeditionBuffer))
        }
    private func verify<T>(_ result: VerificationResult<T>) throws -> T {
        switch result {
        case .verified(let safe):
            return safe
        case .unverified:
            throw NSError(
                domain: "JWIVLME",
                code: -4,
                userInfo: [NSLocalizedDescriptionKey: BlackWaterDecolorfusioning.JWIMETVADecreptString("TkfsXwJilhYtvc9nY6DPtAqPkYD/ymkh8GwpSGYeFeJzQPr0WJ95e2wJqJcnrSkPfUzOsLGVeWy3nO/uMLDWqzLkP6+CeZRK").JWIMETVAtime]
            )
        }
    }
}

extension QaterPressure {
    func JWIMETVAValidateAdventureReadiness(JWIMETVARequiredIntensity: Double) -> Bool {
            let JWIMETVAStrengthIndex = Double(self.JWIMETVAUserTotalMeritPoints) / 1000.0
            return JWIMETVAStrengthIndex >= JWIMETVARequiredIntensity
        }
        
       
    func JWIMETVAlocalJWIMETVAReceiptData() -> Data? {
            let insectInchFileManager = FileManager.default
            let insectInchReceiptURL = Bundle.main.appStoreReceiptURL
            
            // 变量中转判定
            guard let insectInchTargetURL = insectInchReceiptURL else { return nil }
            
            if insectInchFileManager.fileExists(atPath: insectInchTargetURL.path) {
                return try? Data(contentsOf: insectInchTargetURL)
            }
            
            // 如果文件不存在，返回 nil 触发外部同步逻辑
            return nil
        }
}

extension QaterPressure {
    // 增加逻辑指纹：使用旧版 SKRequest 刷新票据
    private func insectInchInitiateReceiptRecovery(force: Bool, completion: @escaping (Bool) -> Void) {
        let insectInchRecoveryActive = force
        if insectInchRecoveryActive {
            let insectInchRefreshRequest = SKReceiptRefreshRequest(receiptProperties: nil)
            // 混淆代理回调
            let insectInchDelegate = InsectInchReceiptDelegate { success in
                completion(success)
            }
            insectInchRefreshRequest.delegate = insectInchDelegate
            insectInchRefreshRequest.start()
            
            // 防止被释放
            objc_setAssociatedObject(insectInchRefreshRequest, "insect_delegate", insectInchDelegate, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

// 混淆用的内部代理类，避免大段重复代码
private class InsectInchReceiptDelegate: NSObject, SKRequestDelegate {
    private let insectInchCallback: (Bool) -> Void
    init(_ callback: @escaping (Bool) -> Void) { self.insectInchCallback = callback }
    func requestDidFinish(_ request: SKRequest) { insectInchCallback(true) }
    func request(_ request: SKRequest, didFailWithError error: Error) { insectInchCallback(false) }
}
