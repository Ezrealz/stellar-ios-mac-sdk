//
//  LiquidityPoolTradeEffectResponse.swift
//  stellarsdk
//
//  Created by Christian Rogobete on 12.09.21.
//  Copyright © 2021 Soneso. All rights reserved.
//

import Foundation

public class LiquidityPoolTradeEffectResponse: EffectResponse {
    
    public var liquidityPool:LiquidityPoolTradeResponse
    
    // Properties to encode and decode
    private enum CodingKeys: String, CodingKey {
        case liquidityPool = "liquidity_pool"
    }
    
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        liquidityPool = try values.decode(LiquidityPoolTradeResponse.self, forKey: .liquidityPool)
        try super.init(from: decoder)
    }
}

public class LiquidityPoolTradeResponse: NSObject, Decodable {
    
    public var poolId:String
    public var fee:Int64
    public var type:String
    public var totalTrustlines:String
    public var totalShares:String
    public var reserves:[ReserveResponse]
    public var sold:ReserveResponse
    public var bought:ReserveResponse
    
    // Properties to encode and decode
    private enum CodingKeys: String, CodingKey {
        case poolId = "id"
        case fee = "fee_bp"
        case type
        case totalTrustlines = "total_trustlines"
        case totalShares = "total_shares"
        case reserves
        case sold
        case bought
    }
    
    /**
        Initializer - creates a new instance by decoding from the given decoder.
     
        - Parameter decoder: The decoder containing the data
     */
    public required init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        poolId = try values.decode(String.self, forKey: .poolId)
        fee = try values.decode(Int64.self, forKey: .fee)
        type = try values.decode(String.self, forKey: .type)
        totalTrustlines = try values.decode(String.self, forKey: .totalTrustlines)
        totalShares = try values.decode(String.self, forKey: .totalShares)
        reserves = try values.decode([ReserveResponse].self, forKey: .reserves)
        sold = try values.decode(ReserveResponse.self, forKey: .sold)
        bought = try values.decode(ReserveResponse.self, forKey: .bought)
    }
}
