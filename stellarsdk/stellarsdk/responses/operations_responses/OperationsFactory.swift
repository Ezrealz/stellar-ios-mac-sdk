//
//  OperationFactory.swift
//  stellarsdk
//
//  Created by Razvan Chelemen on 06/02/2018.
//  Copyright © 2018 Soneso. All rights reserved.
//

import Foundation

///  This class creates the different types of operation response classes depending on the operation type value from json.
class OperationsFactory: NSObject {
    
    /// The json decoder used to parse the received json response from the Horizon API.
    let jsonDecoder = JSONDecoder()
    
    override init() {
        jsonDecoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601)
    }
    
    /**
        Returns an AllOperationsResponse object conatining all operation responses parsed from the json data.
     
        - Parameter data: The json data received from the Horizon API. See
     */
    func operationsFromResponseData(data: Data) throws -> PageResponse<OperationResponse> {
        var operationsList = [OperationResponse]()
        var links: PagingLinksResponse
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String:AnyObject]
            
            for record in json["_embedded"]!["records"] as! [[String:AnyObject]] {
                let jsonRecord = try JSONSerialization.data(withJSONObject: record, options: .prettyPrinted)
                let operation = try operationFromData(data: jsonRecord)
                operationsList.append(operation)
            }
            
            let linksJson = try JSONSerialization.data(withJSONObject: json["_links"]!, options: .prettyPrinted)
            links = try jsonDecoder.decode(PagingLinksResponse.self, from: linksJson)
            
        } catch {
            throw HorizonRequestError.parsingResponseFailed(message: error.localizedDescription)
        }
        
        return PageResponse<OperationResponse>(records: operationsList, links: links)
    }
    
    func operationFromData(data: Data) throws -> OperationResponse {
        
        // The class to be used depends on the effect type coded in its json reresentation.
        //print(String(data: data, encoding: .utf8)!)
        let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String:AnyObject]
        if let type = OperationType(rawValue: Int32(json["type_i"] as! Int)) {
            switch type {
            case .accountCreated:
                return try jsonDecoder.decode(AccountCreatedOperationResponse.self, from: data)
            case .payment:
                return try jsonDecoder.decode(PaymentOperationResponse.self, from: data)
            case .pathPayment:
                return try jsonDecoder.decode(PathPaymentStrictReceiveOperationResponse.self, from: data)
            case .manageSellOffer:
                return try jsonDecoder.decode(ManageSellOfferOperationResponse.self, from: data)
            case .manageBuyOffer:
                return try jsonDecoder.decode(ManageBuyOfferOperationResponse.self, from: data)
            case .createPassiveSellOffer:
                return try jsonDecoder.decode(CreatePassiveSellOfferOperationResponse.self, from: data)
            case .setOptions:
                return try jsonDecoder.decode(SetOptionsOperationResponse.self, from: data)
            case .changeTrust:
                return try jsonDecoder.decode(ChangeTrustOperationResponse.self, from: data)
            case .allowTrust:
                return try jsonDecoder.decode(AllowTrustOperationResponse.self, from: data)
            case .accountMerge:
                return try jsonDecoder.decode(AccountMergeOperationResponse.self, from: data)
            case .inflation:
                return try jsonDecoder.decode(InflationOperationResponse.self, from: data)
            case .manageData:
                return try jsonDecoder.decode(ManageDataOperationResponse.self, from: data)
            case .bumpSequence:
                return try jsonDecoder.decode(BumpSequenceOperationResponse.self, from: data)
            case .pathPaymentStrictSend:
                return try jsonDecoder.decode(PathPaymentStrictSendOperationResponse.self, from: data)
            case .createClaimableBalance:
                return try jsonDecoder.decode(CreateClaimableBalanceOperationResponse.self, from: data)
            case .claimClaimableBalance:
                return try jsonDecoder.decode(ClaimClaimableBalanceOperationResponse.self, from: data)
            case .beginSponsoringFutureReserves:
                return try jsonDecoder.decode(BeginSponsoringFutureReservesOperationResponse.self, from: data)
            case .endSponsoringFutureReserves:
                return try jsonDecoder.decode(EndSponsoringFutureReservesOperationResponse.self, from: data)
            case .revokeSponsorship:
                return try jsonDecoder.decode(RevokeSponsorshipOperationResponse.self, from: data)
            case .clawback:
                return try jsonDecoder.decode(ClawbackOperationResponse.self, from: data)
            case .clawbackClaimableBalance:
                return try jsonDecoder.decode(ClawbackClaimableBalanceOperationResponse.self, from: data)
            case .setTrustLineFlags:
                return try jsonDecoder.decode(SetTrustLineFlagsOperationResponse.self, from: data)
            case .liquidityPoolDeposit:
                return try jsonDecoder.decode(LiquidityPoolDepostOperationResponse.self, from: data)
            case .liquidityPoolWithdraw:
                return try jsonDecoder.decode(LiquidityPoolWithdrawOperationResponse.self, from: data)
            }
        } else {
            throw HorizonRequestError.parsingResponseFailed(message: "Unknown operation type")
        }
    }
}
