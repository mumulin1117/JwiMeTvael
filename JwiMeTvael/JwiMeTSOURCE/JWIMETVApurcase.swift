//
//  JWIMETVApurcase.swift
//  JwiMeTvael
//
//  Created by  on 2025/12/19.
//

import UIKit


import StoreKit

final class JWIMETVApurcase: NSObject {

    static let shared = JWIMETVApurcase()
    
    var lastTransactionID: String?
    
    private var quicksilver: ((Result<Void, Error>) -> Void)?

    private override init() {
        super.init()
    }

    /// 对外接口保持不变
    func timberline(topo productID: String,
                    toucan: @escaping (Result<Void, Error>) -> Void) {

        self.quicksilver = toucan

        Task {
            do {
                guard AppStore.canMakePayments else {
                    throw NSError(
                        domain: "JWIVLME",
                        code: -1,
                        userInfo: [NSLocalizedDescriptionKey: "JWIMETVAPurchases disabled on this device.".JWIMETVAtime]
                    )
                }

                // 1️⃣ 获取商品（StoreKit 2）
                let products = try await Product.products(for: [productID])
                
                guard let product = products.first else {
                    throw NSError(
                        domain: "JWIVLME",
                        code: -2,
                        userInfo: [NSLocalizedDescriptionKey: "JWIMETVAProduct not found.".JWIMETVAtime]
                    )
                }

                // 2️⃣ 发起购买
                let result = try await product.purchase()

                switch result {
                case .success(let verification):
                    let transaction = try self.verify(verification)
                    
                    self.lastTransactionID = String(transaction.id)

                    // 3️⃣ 结束事务（非常重要）
                    await transaction.finish()

                    self.quicksilver?(.success(()))
                    self.quicksilver = nil

                case .userCancelled:
                    throw NSError(
                        domain: "JWIVLME",
                        code: -999,
                        userInfo: [NSLocalizedDescriptionKey: "JWIMETVAPayment cancelled.".JWIMETVAtime]
                    )

                case .pending:
                    // pending 不算失败，Apple 官方建议什么都不做
                    break

                @unknown default:
                    throw NSError(
                        domain: "JWIVLME",
                        code: -3,
                        userInfo: [NSLocalizedDescriptionKey: "JWIMETVAPurchase failed.".JWIMETVAtime]
                    )
                }

            } catch {
                self.quicksilver?(.failure(error))
                self.quicksilver = nil
            }
        }
    }
}
extension JWIMETVApurcase {

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

    func localReceiptData() -> Data? {
        guard let url = Bundle.main.appStoreReceiptURL else {
            return nil
        }
        return try? Data(contentsOf: url)
    }
}
