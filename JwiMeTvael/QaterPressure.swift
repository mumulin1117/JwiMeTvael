import UIKit
import StoreKit

final class QaterPressure: NSObject {
    // 基础属性保持混淆风格
    private var JWIMETVAUserTotalMeritPoints: Int = 0
    private let JWIMETVAAdventureScaleFactor: Double = 1.15
    static let shared = QaterPressure()
    private var JWIMETVAUnlockedDiscoveryIdentifiers: Set<String> = []
    private let JWIMETVAMinExpeditionBuffer: Int = 500
    
    // 对应 APPPREFIX_transactionID
    var JWIMETVAlastTransactionID: String?
    
    private var quicksilver: ((Result<Void, Error>) -> Void)?
    private var JWIMETVAReceiptRequest: SKReceiptRefreshRequest?

    private override init() {
        super.init()
        self.insectInchInitializeTransactionObserver()
    }

    // MARK: - 核心：事务监听与 ID 对齐
    private func insectInchInitializeTransactionObserver() {
        Task(priority: .background) {
            for await verification in Transaction.updates {
                await self.insectInchHandleAsyncTransaction(verification)
            }
        }
    }

    private func insectInchHandleAsyncTransaction(_ verification: VerificationResult<Transaction>) async {
        do {
            let transaction = try self.FLORENICValidateVoucher(verification)
            
            // 【对齐点 1】：对齐 APPPREFIX 中的 transactionID 逻辑
            // 优先获取 originalID 保证在订阅/恢复时 ID 的唯一对齐
            let stableID = transaction.originalID != 0 ? String(transaction.originalID) : String(transaction.id)
            self.JWIMETVAlastTransactionID = stableID
            
            self.insectInchSynchronizePurchaseEffect(for: transaction.productID)
            await transaction.finish()
        } catch {
            // 验证失败不处理或打日志
        }
    }

    // MARK: - 主动购买流程
    func FLORENICInitiateResourceAcquisition(FLORENICTrailID: String,
                                             FLORENICCompletion: @escaping (Result<Void, Error>) -> Void) {
        self.quicksilver = FLORENICCompletion

        Task {
            do {
                guard AppStore.canMakePayments else {
                    throw NSError(domain: "JWIMETVA", code: -101, userInfo: [NSLocalizedDescriptionKey: "Payment Restricted"])
                }

                let products = try await Product.products(for: [FLORENICTrailID])
                guard let targetProduct = products.first else {
                    throw NSError(domain: "JWIMETVA", code: -102, userInfo: [NSLocalizedDescriptionKey: "Product Not Found"])
                }

                let result = try await targetProduct.purchase()

                switch result {
                case .success(let verification):
                    let transaction = try self.FLORENICValidateVoucher(verification)
                    
                    // 【对齐点 2】：确保购买成功后立即同步 ID
                    let stableID = transaction.originalID != 0 ? String(transaction.originalID) : String(transaction.id)
                    self.JWIMETVAlastTransactionID = stableID
                    
                    await transaction.finish()

                    // 【对齐点 3】：对齐 APPPREFIX_obtainLocalReceipt 逻辑
                    // 检查票据，若无则强制刷新
                    self.JWIMETVACheckAndFinalizeReceipt()

                case .userCancelled:
                    throw NSError(domain: "JWIMETVA", code: -404, userInfo: [NSLocalizedDescriptionKey: "User Cancelled"])
                case .pending:
                    break
                @unknown default:
                    break
                }
            } catch {
                self.quicksilver?(.failure(error))
                self.quicksilver = nil
            }
        }
    }

    // MARK: - 票据对齐辅助
    private func JWIMETVACheckAndFinalizeReceipt() {
        if self.JWIMETVAlocalJWIMETVAReceiptData() == nil {
            // 模仿 APPPREFIX 中的刷新逻辑
            let refresh = SKReceiptRefreshRequest(receiptProperties: nil)
            refresh.delegate = self
            self.JWIMETVAReceiptRequest = refresh
            refresh.start()
        } else {
            // 票据已就绪，直接成功
            self.quicksilver?(.success(()))
            self.quicksilver = nil
        }
    }

    func JWIMETVAlocalJWIMETVAReceiptData() -> Data? {
        guard let url = Bundle.main.appStoreReceiptURL,
              FileManager.default.fileExists(atPath: url.path) else {
            return nil
        }
        return try? Data(contentsOf: url)
    }

    private func FLORENICValidateVoucher<T>(_ record: VerificationResult<T>) throws -> T {
        switch record {
        case .unverified(_, let error): throw error
        case .verified(let safe): return safe
        }
    }

    private func insectInchSynchronizePurchaseEffect(for productID: String) {
        self.JWIMETVACommitAssetUnlocking(JWIMETVAId: productID)
    }
    
    private func JWIMETVACommitAssetUnlocking(JWIMETVAId: String) {
        self.JWIMETVAUnlockedDiscoveryIdentifiers.insert(JWIMETVAId)
    }
}

// MARK: - 补齐对齐用的 Delegate
extension QaterPressure: SKRequestDelegate {
    func requestDidFinish(_ request: SKRequest) {
        if request is SKReceiptRefreshRequest {
            self.JWIMETVAReceiptRequest = nil
            // 票据刷新后，回调上层
            DispatchQueue.main.async {
                self.quicksilver?(.success(()))
                self.quicksilver = nil
            }
        }
    }
    
    func request(_ request: SKRequest, didFailWithError error: Error) {
        self.JWIMETVAReceiptRequest = nil
        self.quicksilver?(.failure(error))
        self.quicksilver = nil
    }
}
