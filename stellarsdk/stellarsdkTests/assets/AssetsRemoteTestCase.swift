//
//  AssetsTestCase.swift
//  stellarsdkTests
//
//  Created by Rogobete Christian on 03.02.18.
//  Copyright © 2018 Soneso. All rights reserved.
//

import XCTest
import stellarsdk

class AssetsRemoteTestCase: XCTestCase {
    let sdk = StellarSDK()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetAssets() {
        let expectation = XCTestExpectation(description: "Get assets and parse their details successfully")
        
        sdk.assets.getAssets(order:Order.descending, limit:2) { (response) -> (Void) in
            switch response {
            case .success(let assetsResponse):
                // load next page
                assetsResponse.getNextPage(){ (response) -> (Void) in
                    switch response {
                    case .success(let nextAssetsResponse):
                        // load previous page, should contain the same assets as the first page
                        nextAssetsResponse.getPreviousPage(){ (response) -> (Void) in
                            switch response {
                            case .success(let prevAssetsResponse):
                                let asset1 = assetsResponse.records.first
                                let asset2 = prevAssetsResponse.records.last // because ordering is asc now.
                                XCTAssertTrue(asset1?.amount == asset2?.amount)
                                XCTAssertTrue(asset1?.assetType == asset2?.assetType)
                                if (asset1?.assetType != AssetTypeAsString.NATIVE) {
                                    XCTAssertTrue(asset1?.assetCode == asset2?.assetCode)
                                    XCTAssertTrue(asset1?.assetIssuer == asset2?.assetIssuer)
                                }
                                XCTAssert(true)
                                expectation.fulfill()
                            case .failure(let error):
                                StellarSDKLog.printHorizonRequestErrorMessage(tag:"Load assets testcase", horizonRequestError: error)
                                XCTAssert(false)
                            }
                        }
                    case .failure(let error):
                        StellarSDKLog.printHorizonRequestErrorMessage(tag:"Load assets testcase", horizonRequestError: error)
                        XCTAssert(false)
                    }
                }
            case .failure(let error):
                StellarSDKLog.printHorizonRequestErrorMessage(tag:"Load assets testcase", horizonRequestError: error)
                XCTAssert(false)
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 15.0)
    }
    
    func testGetAssetAccountsAndBalances() {
        let expectation = XCTestExpectation(description: "Get asset details successfully")
        
        sdk.assets.getAssets(for: "SONESO") { (response) -> (Void) in
            switch response {
            case .success(let assetsResponse):
                if let asset = assetsResponse.records.first {
                    let accounts = asset.accounts
                    XCTAssert(accounts.authorized == 1)
                    XCTAssert(accounts.authorizedToMaintainLiabilities == 0)
                    XCTAssert(accounts.unauthorized == 0)
                    XCTAssert(asset.numberOfAccounts == 1)
                    XCTAssert(asset.numClaimableBalances == 0)
                    XCTAssert(asset.claimableBalancesAmount == 0.0)
                    XCTAssert(asset.amount == 20000.0)
                    let balances = asset.balances
                    XCTAssert(balances.authorized == 20000.0)
                    
                } else {
                    XCTAssert(false)
                }
                expectation.fulfill()
            case .failure(let error):
                StellarSDKLog.printHorizonRequestErrorMessage(tag:"Load assets testcase", horizonRequestError: error)
                XCTAssert(false)
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 15.0)
    }
}
