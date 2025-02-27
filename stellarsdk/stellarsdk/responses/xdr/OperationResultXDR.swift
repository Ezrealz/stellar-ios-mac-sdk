//
//  OperationResult.swift
//  stellarsdk
//
//  Created by Razvan Chelemen on 12/02/2018.
//  Copyright © 2018 Soneso. All rights reserved.
//

import Foundation

public enum OperationResultCode: Int32 {
    case inner = 0 // inner object result is valid
    case badAuth = -1  // too few valid signatures / wrong network
    case noAccount = -2 // source account was not found
    case notSupported = -3 // operation not supported at this time
    case tooManySubentries = -4 // max number of subentries already reached
    case exceededWorkLimit = -5 // operation did too much work
    case tooManySponsoring = -6 // account is sponsoring too many entries
}

public enum OperationResultXDR: XDRCodable {
    case createAccount(Int32, CreateAccountResultXDR)
    case payment(Int32, PaymentResultXDR)
    case pathPayment(Int32, PathPaymentResultXDR)
    case manageSellOffer(Int32, ManageOfferResultXDR)
    case createPassiveSellOffer(Int32, ManageOfferResultXDR)
    case setOptions(Int32, SetOptionsResultXDR)
    case changeTrust(Int32, ChangeTrustResultXDR)
    case allowTrust(Int32, AllowTrustResultXDR)
    case accountMerge(Int32, AccountMergeResultXDR)
    case inflation(Int32, InflationResultXDR)
    case manageData(Int32, ManageDataResultXDR)
    case bumpSequence(Int32, BumpSequenceResultXDR)
    case manageBuyOffer(Int32, ManageOfferResultXDR)
    case pathPaymentStrictSend(Int32, PathPaymentResultXDR)
    case createClaimableBalance(Int32, CreateClaimableBalanceResultXDR)
    case claimClaimableBalance(Int32, ClaimClaimableBalanceResultXDR)
    case beginSponsoringFutureReserves(Int32, BeginSponsoringFutureReservesResultXDR)
    case endSponsoringFutureReserves(Int32, EndSponsoringFutureReservesResultXDR)
    case revokeSponsorship(Int32, RevokeSponsorshipResultXDR)
    case clawback(Int32, ClawbackResultXDR)
    case clawbackClaimableBalance(Int32, ClawbackClaimableBalanceResultXDR)
    case setTrustLineFlags(Int32, SetTrustLineFlagsResultXDR)
    case liquidityPoolDeposit(Int32, LiquidityPoolDepositResultXDR)
    case liquidityPoolWithdraw(Int32, LiquidityPoolWithdrawResultXDR)
    case empty (Int32)
    
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        let discriminant = try container.decode(Int32.self)
        let code = OperationResultCode(rawValue: discriminant)!
        
        switch code {
        case .inner:
            let type = OperationType(rawValue: try container.decode(Int32.self))!
            switch type {
                case .accountCreated:
                    self = .createAccount(code.rawValue, try container.decode(CreateAccountResultXDR.self))
                case .payment:
                    self = .payment(code.rawValue, try container.decode(PaymentResultXDR.self))
                case .pathPayment:
                    self = .pathPayment(code.rawValue, try container.decode(PathPaymentResultXDR.self))
                case .manageSellOffer:
                    self = .manageSellOffer(code.rawValue, try container.decode(ManageOfferResultXDR.self))
                case .manageBuyOffer:
                    self = .manageBuyOffer(code.rawValue, try container.decode(ManageOfferResultXDR.self))
                case .createPassiveSellOffer:
                    self = .createPassiveSellOffer(code.rawValue, try container.decode(ManageOfferResultXDR.self))
                case .setOptions:
                    self = .setOptions(code.rawValue, try container.decode(SetOptionsResultXDR.self))
                case .changeTrust:
                    self = .changeTrust(code.rawValue, try container.decode(ChangeTrustResultXDR.self))
                case .allowTrust:
                    self = .allowTrust(code.rawValue, try container.decode(AllowTrustResultXDR.self))
                case .accountMerge:
                    self = .accountMerge(code.rawValue, try container.decode(AccountMergeResultXDR.self))
                case .inflation:
                    self = .inflation(code.rawValue, try container.decode(InflationResultXDR.self))
                case .manageData:
                    self = .manageData(code.rawValue, try container.decode(ManageDataResultXDR.self))
                case .bumpSequence:
                    self = .bumpSequence(code.rawValue, try container.decode(BumpSequenceResultXDR.self))
                case .pathPaymentStrictSend:
                    self = .pathPaymentStrictSend(code.rawValue, try container.decode(PathPaymentResultXDR.self))
                case .createClaimableBalance:
                    self = .createClaimableBalance(code.rawValue, try container.decode(CreateClaimableBalanceResultXDR.self))
                case .claimClaimableBalance:
                    self = .claimClaimableBalance(code.rawValue, try container.decode(ClaimClaimableBalanceResultXDR.self))
                case .beginSponsoringFutureReserves:
                    self = .beginSponsoringFutureReserves(code.rawValue, try container.decode(BeginSponsoringFutureReservesResultXDR.self))
                case .endSponsoringFutureReserves:
                    self = .endSponsoringFutureReserves(code.rawValue, try container.decode(EndSponsoringFutureReservesResultXDR.self))
                case .revokeSponsorship:
                    self = .revokeSponsorship(code.rawValue, try container.decode(RevokeSponsorshipResultXDR.self))
                case .clawback:
                    self = .clawback(code.rawValue, try container.decode(ClawbackResultXDR.self))
                case .clawbackClaimableBalance:
                    self = .clawbackClaimableBalance(code.rawValue, try container.decode(ClawbackClaimableBalanceResultXDR.self))
                case .setTrustLineFlags:
                    self = .setTrustLineFlags(code.rawValue, try container.decode(SetTrustLineFlagsResultXDR.self))
                case .liquidityPoolDeposit:
                    self = .liquidityPoolDeposit(code.rawValue, try container.decode(LiquidityPoolDepositResultXDR.self))
                case .liquidityPoolWithdraw:
                    self = .liquidityPoolWithdraw(code.rawValue, try container.decode(LiquidityPoolWithdrawResultXDR.self))
            }
        default:
            self = .empty(code.rawValue)
            break
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()

        switch self {
            case .createAccount(let code, let result):
                try container.encode(code)
                try container.encode(result)
            case .payment(let code, let result):
                try container.encode(code)
                try container.encode(result)
            case .pathPayment(let code, let result):
                try container.encode(code)
                try container.encode(result)
            case .manageSellOffer(let code, let result):
                try container.encode(code)
                try container.encode(result)
            case .manageBuyOffer(let code, let result):
                try container.encode(code)
                try container.encode(result)
            case .createPassiveSellOffer(let code, let result):
                try container.encode(code)
                try container.encode(result)
            case .setOptions(let code, let result):
                try container.encode(code)
                try container.encode(result)
            case .changeTrust(let code, let result):
                try container.encode(code)
                try container.encode(result)
            case .allowTrust(let code, let result):
                try container.encode(code)
                try container.encode(result)
            case .accountMerge(let code, let result):
                try container.encode(code)
                try container.encode(result)
            case .inflation(let code, let result):
                try container.encode(code)
                try container.encode(result)
            case .manageData(let code, let result):
                try container.encode(code)
                try container.encode(result)
            case .bumpSequence(let code, let result):
                try container.encode(code)
                try container.encode(result)
            case .pathPaymentStrictSend(let code, let result):
                try container.encode(code)
                try container.encode(result)
            case .createClaimableBalance(let code, let result):
                try container.encode(code)
                try container.encode(result)
            case .claimClaimableBalance(let code, let result):
                try container.encode(code)
                try container.encode(result)
            case .beginSponsoringFutureReserves(let code, let result):
                try container.encode(code)
                try container.encode(result)
            case .endSponsoringFutureReserves(let code, let result):
                try container.encode(code)
                try container.encode(result)
            case .revokeSponsorship(let code, let result):
                try container.encode(code)
                try container.encode(result)
            case .clawback(let code, let result):
                try container.encode(code)
                try container.encode(result)
            case .clawbackClaimableBalance(let code, let result):
                try container.encode(code)
                try container.encode(result)
            case .setTrustLineFlags(let code, let result):
                try container.encode(code)
                try container.encode(result)
            case .liquidityPoolDeposit(let code, let result):
                try container.encode(code)
                try container.encode(result)
            case .liquidityPoolWithdraw(let code, let result):
                try container.encode(code)
                try container.encode(result)
            case .empty (let code):
                try container.encode(code)
                break
        }
    }
}
