 //
//  OperationBodyXDR.swift
//  stellarsdk
//
//  Created by Rogobete Christian on 13.02.18.
//  Copyright © 2018 Soneso. All rights reserved.
//

import Foundation

public enum OperationBodyXDR: XDRCodable {
    case createAccount (CreateAccountOperationXDR)
    case payment (PaymentOperationXDR)
    case pathPayment (PathPaymentOperationXDR)
    case manageSellOffer (ManageOfferOperationXDR)
    case manageBuyOffer (ManageOfferOperationXDR)
    case createPassiveSellOffer (CreatePassiveOfferOperationXDR)
    case setOptions (SetOptionsOperationXDR)
    case allowTrust (AllowTrustOperationXDR)
    case changeTrust (ChangeTrustOperationXDR)
    case inflation
    case manageData (ManageDataOperationXDR)
    case accountMerge (MuxedAccountXDR)
    case bumpSequence (BumpSequenceOperationXDR)
    case pathPaymentStrictSend (PathPaymentOperationXDR)
    case createClaimableBalance (CreateClaimableBalanceOpXDR)
    case claimClaimableBalance (ClaimClaimableBalanceOpXDR)
    case beginSponsoringFutureReserves (BeginSponsoringFutureReservesOpXDR)
    case endSponsoringFutureReserves
    case revokeSponsorship (RevokeSponsorshipOpXDR)
    case clawback(ClawbackOpXDR)
    case clawbackClaimableBalance(ClawbackClaimableBalanceOpXDR)
    case setTrustLineFlags(SetTrustLineFlagsOpXDR)
    case liquidityPoolDeposit(LiquidityPoolDepositOpXDR)
    case liquidityPoolWithdraw(LiquidityPoolWithdrawOpXDR)
    
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        
        let type = try container.decode(Int32.self)
        
        switch type {
            case OperationType.accountCreated.rawValue:
                self = .createAccount(try container.decode(CreateAccountOperationXDR.self))
            case OperationType.payment.rawValue:
                self = .payment(try container.decode(PaymentOperationXDR.self))
            case OperationType.pathPayment.rawValue:
                self = .pathPayment(try container.decode(PathPaymentOperationXDR.self))
            case OperationType.manageSellOffer.rawValue:
                self = .manageSellOffer(try container.decode(ManageOfferOperationXDR.self))
            case OperationType.manageBuyOffer.rawValue:
                self = .manageBuyOffer(try container.decode(ManageOfferOperationXDR.self))
            case OperationType.createPassiveSellOffer.rawValue:
                self = .createPassiveSellOffer(try container.decode(CreatePassiveOfferOperationXDR.self))
            case OperationType.setOptions.rawValue:
                self = .setOptions(try container.decode(SetOptionsOperationXDR.self))
            case OperationType.allowTrust.rawValue:
                self = .allowTrust(try container.decode(AllowTrustOperationXDR.self))
            case OperationType.changeTrust.rawValue:
                self = .changeTrust(try container.decode(ChangeTrustOperationXDR.self))
            case OperationType.inflation.rawValue:
                self = .inflation
            case OperationType.manageData.rawValue:
                self = .manageData(try container.decode(ManageDataOperationXDR.self))
            case OperationType.accountMerge.rawValue:
                self = .accountMerge(try container.decode(MuxedAccountXDR.self))
            case OperationType.bumpSequence.rawValue:
                self = .bumpSequence(try container.decode(BumpSequenceOperationXDR.self))
            case OperationType.pathPaymentStrictSend.rawValue:
                self = .pathPaymentStrictSend(try container.decode(PathPaymentOperationXDR.self))
            case OperationType.createClaimableBalance.rawValue:
                self = .createClaimableBalance(try container.decode(CreateClaimableBalanceOpXDR.self))
            case OperationType.claimClaimableBalance.rawValue:
                self = .claimClaimableBalance(try container.decode(ClaimClaimableBalanceOpXDR.self))
            case OperationType.beginSponsoringFutureReserves.rawValue:
                self = .beginSponsoringFutureReserves(try container.decode(BeginSponsoringFutureReservesOpXDR.self))
            case OperationType.endSponsoringFutureReserves.rawValue:
                self = .endSponsoringFutureReserves
            case OperationType.revokeSponsorship.rawValue:
                self = .revokeSponsorship(try container.decode(RevokeSponsorshipOpXDR.self))
            case OperationType.clawback.rawValue:
                self = .clawback(try container.decode(ClawbackOpXDR.self))
            case OperationType.clawbackClaimableBalance.rawValue:
                self = .clawbackClaimableBalance(try container.decode(ClawbackClaimableBalanceOpXDR.self))
            case OperationType.setTrustLineFlags.rawValue:
                self = .setTrustLineFlags(try container.decode(SetTrustLineFlagsOpXDR.self))
            case OperationType.liquidityPoolDeposit.rawValue:
                self = .liquidityPoolDeposit(try container.decode(LiquidityPoolDepositOpXDR.self))
            case OperationType.liquidityPoolWithdraw.rawValue:
                self = .liquidityPoolWithdraw(try container.decode(LiquidityPoolWithdrawOpXDR.self))
            default:
                throw StellarSDKError.xdrDecodingError(message: "Could not decode operation")
        }
    }
    
    public func type() -> Int32 {
        switch self {
            case .createAccount: return OperationType.accountCreated.rawValue
            case .payment: return OperationType.payment.rawValue
            case .pathPayment: return OperationType.pathPayment.rawValue
            case .manageSellOffer: return OperationType.manageSellOffer.rawValue
            case .manageBuyOffer: return OperationType.manageBuyOffer.rawValue
            case .createPassiveSellOffer: return OperationType.createPassiveSellOffer.rawValue
            case .setOptions: return OperationType.setOptions.rawValue
            case .allowTrust: return OperationType.allowTrust.rawValue
            case .changeTrust: return OperationType.changeTrust.rawValue
            case .inflation: return OperationType.inflation.rawValue
            case .manageData: return OperationType.manageData.rawValue
            case .accountMerge: return OperationType.accountMerge.rawValue
            case .bumpSequence: return OperationType.bumpSequence.rawValue
            case .pathPaymentStrictSend: return OperationType.pathPaymentStrictSend.rawValue
            case .createClaimableBalance: return OperationType.createClaimableBalance.rawValue
            case .claimClaimableBalance: return OperationType.claimClaimableBalance.rawValue
            case .beginSponsoringFutureReserves: return OperationType.beginSponsoringFutureReserves.rawValue
            case .endSponsoringFutureReserves: return OperationType.endSponsoringFutureReserves.rawValue
            case .revokeSponsorship: return OperationType.revokeSponsorship.rawValue
            case .clawback: return OperationType.clawback.rawValue
            case .clawbackClaimableBalance: return OperationType.clawbackClaimableBalance.rawValue
            case .setTrustLineFlags: return OperationType.setTrustLineFlags.rawValue
            case .liquidityPoolDeposit: return OperationType.liquidityPoolDeposit.rawValue
            case .liquidityPoolWithdraw: return OperationType.liquidityPoolWithdraw.rawValue
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        
        try container.encode(type())
        
        switch self {
        case .createAccount (let op):
            try container.encode(op)
        case .payment (let op):
            try container.encode(op)
        case .pathPayment (let op):
            try container.encode(op)
        case .manageSellOffer (let op):
            try container.encode(op)
        case .manageBuyOffer (let op):
            try container.encode(op)
        case .createPassiveSellOffer (let op):
            try container.encode(op)
        case .setOptions (let op):
            try container.encode(op)
        case .allowTrust (let op):
            try container.encode(op)
        case .changeTrust (let op):
            try container.encode(op)
        case .inflation:
            break
        case .manageData (let op):
            try container.encode(op)
        case .accountMerge (let op):
            try container.encode(op)
        case .bumpSequence (let op):
            try container.encode(op)
        case .pathPaymentStrictSend (let op):
            try container.encode(op)
        case .createClaimableBalance (let op):
            try container.encode(op)
        case .claimClaimableBalance (let op):
            try container.encode(op)
        case .beginSponsoringFutureReserves (let op):
            try container.encode(op)
        case .endSponsoringFutureReserves:
            break
        case .revokeSponsorship (let op):
            try container.encode(op)
        case .clawback (let op):
            try container.encode(op)
        case .clawbackClaimableBalance (let op):
            try container.encode(op)
        case .setTrustLineFlags (let op):
            try container.encode(op)
        case .liquidityPoolDeposit (let op):
            try container.encode(op)
        case .liquidityPoolWithdraw (let op):
            try container.encode(op)
        }
    }
}
