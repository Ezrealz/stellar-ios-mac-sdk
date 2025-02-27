//
//  WebAuthenticatorGetChallengeResponseMock.swift
//  stellarsdk
//
//  Created by Razvan Chelemen on 16/11/2018.
//  Copyright © 2018 Soneso. All rights reserved.
//

import Foundation
import stellarsdk

class WebAuthenticatorChallengeResponseMock: ResponsesMock {
    var address: String
    var serverKeyPair: KeyPair
    
    init(address:String, serverKeyPair:KeyPair) {
        self.address = address
        self.serverKeyPair = serverKeyPair
        
        super.init()
    }
    
    override func requestMock() -> RequestMock {
        let handler: MockHandler = { [weak self] mock, request in
            if let key = mock.variables["account"] {
                if key == "GB4L7JUU5DENUXYH3ANTLVYQL66KQLDDJTN5SF7MWEDGWSGUA375V44V" {
                    mock.statusCode = 200
                    return self?.requestSuccess(account: key)
                }
                else if key == "GDTQAJVJMEDWCSSSBZ54KFURMUJ4RKSCBBPGTNXVWOK6LZDN5TL6F3EA" {
                    mock.statusCode = 200
                    return self?.requestValidSecondOperation(account: "GDTQAJVJMEDWCSSSBZ54KFURMUJ4RKSCBBPGTNXVWOK6LZDN5TL6F3EA")
                } else if key == "GA3BS4KS3XR4KEYG5QD6RSELGTCYQDETRISIVLWCMHI243NFYCLR7NSE" {
                    mock.statusCode = 200
                    return self?.requestInvalidSecondOperation(account: "GA3BS4KS3XR4KEYG5QD6RSELGTCYQDETRISIVLWCMHI243NFYCLR7NSE")
                } else if key == "GAUQO2IDU23EJGLTUTOLSL2VBSWCS3YCVUBP3FET6VQJAUULNZ5CCW3Y" {
                    mock.statusCode = 200
                    return self?.requestInvalidSeq(account: "GAUQO2IDU23EJGLTUTOLSL2VBSWCS3YCVUBP3FET6VQJAUULNZ5CCW3Y")
                } else if key == "GDWPRWTBZBVNUBRPHQXOKIJR4GRAALJ34HWHEWO7O3GGLJ5DA3XKSLMD" {
                    mock.statusCode = 200
                    return self?.requestSuccess(account: "GBCJQ6Q7PVSRZJA26A76AP4UJM4WORKUSMDEIAAZLYR4HHRG3GQI4GUZ")
                } else if key == "GBCJQ6Q7PVSRZJA26A76AP4UJM4WORKUSMDEIAAZLYR4HHRG3GQI4GUZ" {
                    mock.statusCode = 400
                    return self?.requestError
                } else if key == "GDRNSOWWZWLVFMBY4ZUUFVJXWYRVVGCC7ALXNEWZU7X2TODIRHAZANNA" {
                    mock.statusCode = 200
                    return self?.requestInvalidOperationType()
                } else if key == "GDTJSQ4KGWKKYDIAR5WKMKDQVNKK2BUR6KY43VWZ464T6FWJHHIG7ZI4" {
                    mock.statusCode = 200
                    return self?.requestInvalidOperationCount()
                } else if key == "GBLIKSJM67PCYH7CNFLQETPPOWATL2PVH2SY7WGWDQEOK47FANF3PIIX" {
                    mock.statusCode = 200
                    return self?.requestInvalidTimebounds(account: key)
                } else if key == "GCN2YSJLDRFN2VZKDVQU4ARHHTRS6X7QD4Q6IO4D3DIVVARVPRK5CPKU" {
                    mock.statusCode = 200
                    return self?.requestInvalidHomeDomain(account: key)
                } else if key == "GBCWD4VLRY42JMWNPETGDPY6HSVHQ7YPOM73KALIWEJXIK4OIN5SSY3S" {
                    mock.statusCode = 200
                    return self?.requestInvalidWebAuthDomain(account: key)
                } else if key == "GBPFFS63LXKHUL5SFJAI4737JJ2UHEQJXKJRQ3BFBN2PQC4RQ2OLMPSY" {
                    mock.statusCode = 200
                    return self?.requestInvalidSignature(account: key)
                } else if key == "GBGWIAAKWQFGARYINLHSPFIQCHMMGNJICNRRO435L4AP7DNYYHYMNFFT" {
                    mock.statusCode = 200
                    return self?.requestNotFoundSignature(account: key)
                } else if key == "GA5YLRKU57II42AXED2LA3IO2AL4URSVO3WXI7CIE4KJDPJSSRUSDJU7" {
                    mock.statusCode = 200
                    return self?.requestSuccess(account: key)
                } else if key == "GCK2PNGZBGBZCULG6QHYQUPIM2DXNXCJKLFMC2SPDX2B5A54IR4Q5KE3" {
                    mock.statusCode = 200
                    return self?.requestInvalidClientDomainOperation(account: "GA3BS4KS3XR4KEYG5QD6RSELGTCYQDETRISIVLWCMHI243NFYCLR7NSE")
                } else if key == "GDBEDW4SYL3NJY2ILKUE2MX7CU6BQKSK6UXZUHVOLZL2R3BKRLBEJRXC" {
                    mock.statusCode = 200
                    return self?.requestValidClientDomainOperation(userAccount: "GDBEDW4SYL3NJY2ILKUE2MX7CU6BQKSK6UXZUHVOLZL2R3BKRLBEJRXC", clientDomainAccount: "GBXFU2EMT2Y3IRGN2MSXIBIAXEPT77PYKN5HHQSDBLNCT7OCYYBABJBF")
                } else if key == "GC6PZZU7XEYLCV7XW5LZC3J72HKQ7CABZCLVGPXCPLLRPZ4SJHC2US3P" || key == "MC6PZZU7XEYLCV7XW5LZC3J72HKQ7CABZCLVGPXCPLLRPZ4SJHC2UAAAAAAACMICQPLEG" {
                    mock.statusCode = 200
                    if let memo = mock.variables["memo"] {
                        return self?.requestSuccess(account: key, memo: UInt64(memo))
                    }
                    return self?.requestSuccess(account: key)
                } else if key == "GB5PZY253VWYRF47YMNFIWO3U6BG2SD2457FNQVFO4CLOAIUEN5IG7P7" {
                    mock.statusCode = 200
                    return self?.requestInvalidMemoType(account: key)
                } else if key == "GCEQZYKOEJTZET2AKUY664EM44VFNRIAH7AXE4RIDWFV6UYGDTJWD2JJ" {
                    mock.statusCode = 200
                    return self?.requestInvalidMemoValue(account:key)
                }
            }
            
            return "not treated"
        }
        
        return RequestMock(host: address,
                           path: "/auth",
                           httpMethod: "GET",
                           mockHandler: handler)
    }
    
    func generateNonce(length: Int) -> String? {
        let nonce = NSMutableData(length: length)
        let result = SecRandomCopyBytes(kSecRandomDefault, nonce!.length, nonce!.mutableBytes)
        if result == errSecSuccess {
            return (nonce! as Data).base64EncodedString()
        } else {
            return nil
        }
    }
    
    func requestSuccess(account: String, memo:UInt64? = nil) -> String {
        let transactionAccount = Account(keyPair: serverKeyPair, sequenceNumber: -1)
        
        let timeBounds = try! TimeBounds(minTime: UInt64(Date().timeIntervalSince1970), maxTime: UInt64(Date().timeIntervalSince1970 + 300))
        
        let operation1 = ManageDataOperation(sourceAccountId: account, name: "place.domain.com auth", data: generateNonce(length: 64)?.data(using: .utf8))
        let operation2 = ManageDataOperation(sourceAccountId: serverKeyPair.accountId, name: "web_auth_domain", data: "api.stellar.org".data(using: .utf8))
        
        var txmemo = Memo.none
        if let memoval = memo {
            txmemo = Memo.id(memoval)
        }
        let transaction = try! Transaction(sourceAccount: transactionAccount, operations: [operation1,operation2], memo: txmemo, timeBounds: timeBounds)
        try! transaction.sign(keyPair: serverKeyPair, network: .testnet)
        
        return """
                {
                "transaction": "\(try! transaction.encodedEnvelope())"
                }
                """
    }
    
    func requestValidSecondOperation(account: String) -> String {
        let clientKeyPair = try! KeyPair(accountId: account)
        let transactionAccount = Account(keyPair: serverKeyPair, sequenceNumber: -1)
        
        let timeBounds = try! TimeBounds(minTime: UInt64(Date().timeIntervalSince1970), maxTime: UInt64(Date().timeIntervalSince1970 + 300))
        
        let operation = ManageDataOperation(sourceAccountId: clientKeyPair.accountId, name: "place.domain.com auth", data: generateNonce(length: 64)?.data(using: .utf8))
        
        let nextOperation = ManageDataOperation(sourceAccountId: serverKeyPair.accountId, name: "place.domain.com auth", data: generateNonce(length: 64)?.data(using: .utf8))
        
        let transaction = try! Transaction(sourceAccount: transactionAccount, operations: [operation, nextOperation], memo: nil, timeBounds: timeBounds)
        try! transaction.sign(keyPair: serverKeyPair, network: .testnet)
        
        return """
                {
                "transaction": "\(try! transaction.encodedEnvelope())"
                }
                """
    }
    
    func requestInvalidSecondOperation(account: String) -> String {
        let clientKeyPair = try! KeyPair(accountId: account)
        let transactionAccount = Account(keyPair: serverKeyPair, sequenceNumber: -1)
        
        let timeBounds = try! TimeBounds(minTime: UInt64(Date().timeIntervalSince1970), maxTime: UInt64(Date().timeIntervalSince1970 + 300))
        
        let operation = ManageDataOperation(sourceAccountId: clientKeyPair.accountId, name: "place.domain.com auth", data: generateNonce(length: 64)?.data(using: .utf8))
        
        let nextOperation = ManageDataOperation(sourceAccountId: clientKeyPair.accountId, name: "place.domain.com auth", data: generateNonce(length: 64)?.data(using: .utf8))
        
        let transaction = try! Transaction(sourceAccount: transactionAccount, operations: [operation, nextOperation], memo: nil, timeBounds: timeBounds)
        try! transaction.sign(keyPair: serverKeyPair, network: .testnet)
        
        return """
                {
                "transaction": "\(try! transaction.encodedEnvelope())"
                }
                """
    }
    
    func requestInvalidClientDomainOperation(account: String) -> String {
        let clientKeyPair = try! KeyPair(accountId: account)
        let transactionAccount = Account(keyPair: serverKeyPair, sequenceNumber: -1)
        
        let timeBounds = try! TimeBounds(minTime: UInt64(Date().timeIntervalSince1970), maxTime: UInt64(Date().timeIntervalSince1970 + 300))
        
        let operation = ManageDataOperation(sourceAccountId: clientKeyPair.accountId, name: "place.domain.com auth", data: generateNonce(length: 64)?.data(using: .utf8))
        
        let nextOperation = ManageDataOperation(sourceAccountId: serverKeyPair.accountId, name: "place.domain.com auth", data: generateNonce(length: 64)?.data(using: .utf8))
        
        let lastOperation = ManageDataOperation(sourceAccountId: serverKeyPair.accountId, name: "client_domain", data: "domain.client.com".data(using: .utf8))
        
        let transaction = try! Transaction(sourceAccount: transactionAccount, operations: [operation, nextOperation, lastOperation], memo: nil, timeBounds: timeBounds)
        try! transaction.sign(keyPair: serverKeyPair, network: .testnet)
        
        return """
                {
                "transaction": "\(try! transaction.encodedEnvelope())"
                }
                """
    }
    
    func requestValidClientDomainOperation(userAccount: String, clientDomainAccount:String) -> String {
        let clientKeyPair = try! KeyPair(accountId: userAccount)
        let transactionAccount = Account(keyPair: serverKeyPair, sequenceNumber: -1)
        
        let timeBounds = try! TimeBounds(minTime: UInt64(Date().timeIntervalSince1970), maxTime: UInt64(Date().timeIntervalSince1970 + 300))
        
        let operation = ManageDataOperation(sourceAccountId: clientKeyPair.accountId, name: "place.domain.com auth", data: generateNonce(length: 64)?.data(using: .utf8))
        
        let nextOperation = ManageDataOperation(sourceAccountId: serverKeyPair.accountId, name: "place.domain.com auth", data: generateNonce(length: 64)?.data(using: .utf8))
        
        let lastOperation = ManageDataOperation(sourceAccountId: clientDomainAccount, name: "client_domain", data: "domain.client.com".data(using: .utf8))
        
        let transaction = try! Transaction(sourceAccount: transactionAccount, operations: [operation, nextOperation, lastOperation], memo: nil, timeBounds: timeBounds)
        try! transaction.sign(keyPair: serverKeyPair, network: .testnet)
        
        return """
                {
                "transaction": "\(try! transaction.encodedEnvelope())"
                }
                """
    }
    
    
    func requestInvalidSeq(account: String) -> String {
        let clientKeyPair = try! KeyPair(accountId: account)
        let transactionAccount = Account(keyPair: serverKeyPair, sequenceNumber: 123)
        
        let timeBounds = try! TimeBounds(minTime: UInt64(Date().timeIntervalSince1970), maxTime: UInt64(Date().timeIntervalSince1970 + 300))
        
        let operation = ManageDataOperation(sourceAccountId: clientKeyPair.accountId, name: "place.domain.com auth", data: generateNonce(length: 64)?.data(using: .utf8))
        
        let transaction = try! Transaction(sourceAccount: transactionAccount, operations: [operation], memo: nil, timeBounds: timeBounds)
        try! transaction.sign(keyPair: serverKeyPair, network: .testnet)
        
        return """
        {
        "transaction": "\(try! transaction.encodedEnvelope())"
        }
        """
    }
    
    func requestInvalidOperationType() -> String {
        let transactionAccount = Account(keyPair: serverKeyPair, sequenceNumber: -1)
        
        let timeBounds = try! TimeBounds(minTime: UInt64(Date().timeIntervalSince1970), maxTime: UInt64(Date().timeIntervalSince1970 + 300))
        
        let sourceAccountKeyPair = try! KeyPair(secretSeed:"SBCUVXRTONIII2HOZLCXQUSNMBKFLZBSN3BEZKTP7ACPBG5DZQEV62F5")
        let destinationAccountKeyPair = try! KeyPair(secretSeed: "SDA6XCDPNHTT7ZAHMW4H5LJG4HN7SJC2DU3RZ6QXVR3QFIFNWJ5ZAFHT")
        let operation = try! PaymentOperation(sourceAccountId: sourceAccountKeyPair.accountId,
                                         destinationAccountId: destinationAccountKeyPair.accountId,
                                         asset: Asset(type: AssetType.ASSET_TYPE_NATIVE)!,
                                         amount: 1.5)
        
        let transaction = try! Transaction(sourceAccount: transactionAccount, operations: [operation], memo: nil, timeBounds: timeBounds)
        try! transaction.sign(keyPair: serverKeyPair, network: .testnet)
        
        return """
        {
        "transaction": "\(try! transaction.encodedEnvelope())"
        }
        """
    }
    
    func requestInvalidOperationCount() -> String {
        let transactionAccount = Account(keyPair: serverKeyPair, sequenceNumber: 0)
        
        let timeBounds = try! TimeBounds(minTime: UInt64(Date().timeIntervalSince1970), maxTime: UInt64(Date().timeIntervalSince1970 + 300))
        
        var transaction = TransactionXDR(sourceAccount: transactionAccount.keyPair.publicKey, seqNum: transactionAccount.sequenceNumber, timeBounds: timeBounds.toXdr(), memo: .none, operations: [])
        try! transaction.sign(keyPair: serverKeyPair, network: .testnet)
        
        return """
        {
        "transaction": "\(try! transaction.encodedEnvelope())"
        }
        """
    }
    
    func requestInvalidHomeDomain(account: String) -> String {
        let clientKeyPair = try! KeyPair(accountId: account)
        let transactionAccount = Account(keyPair: serverKeyPair, sequenceNumber: -1)
        
        let timeBounds = try! TimeBounds(minTime: UInt64(Date().timeIntervalSince1970), maxTime: UInt64(Date().timeIntervalSince1970 + 300))
        
        let operation = ManageDataOperation(sourceAccountId: clientKeyPair.accountId
                                            , name: "fail.domain.com auth", data: generateNonce(length: 64)?.data(using: .utf8))
        
        let transaction = try! Transaction(sourceAccount: transactionAccount, operations: [operation], memo: nil, timeBounds: timeBounds)
        try! transaction.sign(keyPair: serverKeyPair, network: .testnet)
        
        return """
                {
                "transaction": "\(try! transaction.encodedEnvelope())"
                }
                """
    }
    
    func requestInvalidWebAuthDomain(account: String) -> String {
        let clientKeyPair = try! KeyPair(accountId: account)
        let transactionAccount = Account(keyPair: serverKeyPair, sequenceNumber: -1)
        
        let timeBounds = try! TimeBounds(minTime: UInt64(Date().timeIntervalSince1970), maxTime: UInt64(Date().timeIntervalSince1970 + 300))
        
        let operation1 = ManageDataOperation(sourceAccountId: clientKeyPair.accountId
                                            , name: "place.domain.com auth", data: generateNonce(length: 64)?.data(using: .utf8))
        let operation2 = ManageDataOperation(sourceAccountId: serverKeyPair.accountId
                                            , name: "web_auth_domain", data: "blubber".data(using: .utf8))
        
        let transaction = try! Transaction(sourceAccount: transactionAccount, operations: [operation1, operation2], memo: nil, timeBounds: timeBounds)
        try! transaction.sign(keyPair: serverKeyPair, network: .testnet)
        
        return """
                {
                "transaction": "\(try! transaction.encodedEnvelope())"
                }
                """
    }
    
    func requestInvalidTimebounds(account: String) -> String {
        let clientKeyPair = try! KeyPair(accountId: account)
        let transactionAccount = Account(keyPair: serverKeyPair, sequenceNumber: -1)
        
        let timeBounds = try! TimeBounds(minTime: UInt64(Date().timeIntervalSince1970) + 800, maxTime: UInt64(Date().timeIntervalSince1970 + 1200))
        
        let operation = ManageDataOperation(sourceAccountId: clientKeyPair.accountId
                                            , name: "place.domain.com auth", data: generateNonce(length: 64)?.data(using: .utf8))
        
        let transaction = try! Transaction(sourceAccount: transactionAccount, operations: [operation], memo: nil, timeBounds: timeBounds)
        try! transaction.sign(keyPair: serverKeyPair, network: .testnet)
        
        return "{ \"transaction\": \"\(try! transaction.encodedEnvelope())\" }"
    }
    
    func requestInvalidSignature(account: String) -> String {
        let clientKeyPair = try! KeyPair(accountId: account)
        let transactionAccount = Account(keyPair: serverKeyPair, sequenceNumber: -1)
        
        let timeBounds = try! TimeBounds(minTime: UInt64(Date().timeIntervalSince1970), maxTime: UInt64(Date().timeIntervalSince1970 + 300))
        
        let operation = ManageDataOperation(sourceAccountId: clientKeyPair.accountId, name: "place.domain.com auth", data: generateNonce(length: 64)?.data(using: .utf8))
        
        let transaction = try! Transaction(sourceAccount: transactionAccount, operations: [operation], memo: nil, timeBounds: timeBounds)
        let keyPair = try! KeyPair(secretSeed: "SCNNPRMRJSIEZ2M64YP5TKM3P2XPJJDEQ2YS33RA5Y4GS7AOJHKLXVP4")
        try! transaction.sign(keyPair: keyPair, network: .testnet)
        
        return "{ \"transaction\": \"\(try! transaction.encodedEnvelope())\" }"
    }
    
    func requestNotFoundSignature(account: String) -> String {
        let clientKeyPair = try! KeyPair(accountId: account)
        let transactionAccount = Account(keyPair: serverKeyPair, sequenceNumber: 0)
        
        let timeBounds = try! TimeBounds(minTime: UInt64(Date().timeIntervalSince1970), maxTime: UInt64(Date().timeIntervalSince1970 + 300))
        
        let operation = ManageDataOperation(sourceAccountId: clientKeyPair.accountId, name: "place.domain.com auth", data: generateNonce(length: 64)?.data(using: .utf8))
        
        let transaction = TransactionXDR(sourceAccount: transactionAccount.keyPair.publicKey, seqNum: transactionAccount.sequenceNumber, timeBounds: timeBounds.toXdr(), memo: .none, operations: [try! operation.toXDR()])
        
        let envelopeV1 = TransactionV1EnvelopeXDR(tx: transaction, signatures: [])
        let envelope = TransactionEnvelopeXDR.v1(envelopeV1)
        var encodedEnvelope = try! XDREncoder.encode(envelope)
        
        return "{ \"transaction\": \"\(Data(bytes: &encodedEnvelope, count: encodedEnvelope.count).base64EncodedString())\" }"
    }
    
    func requestInvalidMemoType(account: String) -> String {
        let transactionAccount = Account(keyPair: serverKeyPair, sequenceNumber: -1)
        
        let timeBounds = try! TimeBounds(minTime: UInt64(Date().timeIntervalSince1970), maxTime: UInt64(Date().timeIntervalSince1970 + 300))
        
        let operation1 = ManageDataOperation(sourceAccountId: account, name: "place.domain.com auth", data: generateNonce(length: 64)?.data(using: .utf8))
        let operation2 = ManageDataOperation(sourceAccountId: serverKeyPair.accountId, name: "web_auth_domain", data: "api.stellar.org".data(using: .utf8))
        
        let txmemo = Memo.text("hello")
        let transaction = try! Transaction(sourceAccount: transactionAccount, operations: [operation1,operation2], memo: txmemo, timeBounds: timeBounds)
        try! transaction.sign(keyPair: serverKeyPair, network: .testnet)
        
        return """
                {
                "transaction": "\(try! transaction.encodedEnvelope())"
                }
                """
    }
    
    func requestInvalidMemoValue(account: String) -> String {
        let transactionAccount = Account(keyPair: serverKeyPair, sequenceNumber: -1)
        
        let timeBounds = try! TimeBounds(minTime: UInt64(Date().timeIntervalSince1970), maxTime: UInt64(Date().timeIntervalSince1970 + 300))
        
        let operation1 = ManageDataOperation(sourceAccountId: account, name: "place.domain.com auth", data: generateNonce(length: 64)?.data(using: .utf8))
        let operation2 = ManageDataOperation(sourceAccountId: serverKeyPair.accountId, name: "web_auth_domain", data: "api.stellar.org".data(using: .utf8))
        
        let txmemo = Memo.id(9189181222)
        
        let transaction = try! Transaction(sourceAccount: transactionAccount, operations: [operation1,operation2], memo: txmemo, timeBounds: timeBounds)
        try! transaction.sign(keyPair: serverKeyPair, network: .testnet)
        
        return """
                {
                "transaction": "\(try! transaction.encodedEnvelope())"
                }
                """
    }
    
    let requestError = """
    {
        "error": "The provided account has requested too many challenges recently. Try again later."
    }
    """
    
}
