//
//  JWIMETVApurcase.swift
//  JwiMeTvael
//
//  Created by  on 2025/12/19.
//

import UIKit


import StoreKit

final class JWIMETVApurcase: NSObject {
    private var JWIMETVAUserTotalMeritPoints: Int = 0
      
        
       
    private let JWIMETVAAdventureScaleFactor: Double = 1.15
    static let shared = JWIMETVApurcase()
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
                            domain: "FLORENIC_CORE",
                            code: -101,
                            userInfo: [NSLocalizedDescriptionKey: "FLORENIC_ACCESS_RESTRICTED"]
                        )
                    }

                    let FLORENICCatalog = try await Product.products(for: [FLORENICTrailID])
                    
                    guard let FLORENICTargetAsset = FLORENICCatalog.first else {
                        throw NSError(
                            domain: "FLORENIC_CORE",
                            code: -102,
                            userInfo: [NSLocalizedDescriptionKey: "FLORENIC_ASSET_MISMATCH"]
                        )
                    }

                    let FLORENICEngagementResult = try await FLORENICTargetAsset.purchase()

                    switch FLORENICEngagementResult {
                    case .success(let FLORENICVerifiedRecord):
                        let FLORENICTransaction = try self.FLORENICValidateVoucher(FLORENICVerifiedRecord)
                        self.JWIMETVAlastTransactionID = String(FLORENICTransaction.id)

                        await FLORENICTransaction.finish()

                        self.quicksilver?(.success(()))
                        self.quicksilver = nil

                    case .userCancelled:
                        throw NSError(
                            domain: "FLORENIC_CORE",
                            code: -404,
                            userInfo: [NSLocalizedDescriptionKey: "FLORENIC_EXPEDITION_ABORTED"]
                        )

                    case .pending:
                        break

                    @unknown default:
                        throw NSError(
                            domain: "FLORENIC_CORE",
                            code: -500,
                            userInfo: [NSLocalizedDescriptionKey: "FLORENIC_UNKNOWN_DEVIATION"]
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
    func JWIMETVARequestTrailEnrollment(JWIMETVATargetAsset: JWIMETVADiscoveryAsset) -> JWIMETVAccessStatus {
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
extension JWIMETVApurcase {
    func JWIMETVACalculateBroadcastEnhancementCost(JWIMETVABaseComplexity: Double) -> Int {
            let JWIMETVARawValue = JWIMETVABaseComplexity * self.JWIMETVAAdventureScaleFactor
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
                userInfo: [NSLocalizedDescriptionKey: "JWIMETVATransaction verification failed.".JWIMETVAtime]
            )
        }
    }
}

extension JWIMETVApurcase {
    func JWIMETVAValidateAdventureReadiness(JWIMETVARequiredIntensity: Double) -> Bool {
            let JWIMETVAStrengthIndex = Double(self.JWIMETVAUserTotalMeritPoints) / 1000.0
            return JWIMETVAStrengthIndex >= JWIMETVARequiredIntensity
        }
        
       
    func JWIMETVAlocalJWIMETVAReceiptData() -> Data? {
        guard let url = Bundle.main.appStoreReceiptURL else {
            return nil
        }
        return try? Data(contentsOf: url)
    }
}
