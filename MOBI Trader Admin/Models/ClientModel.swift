//
//  ClientModel.swift
//  MOBI Trader Admin
//
//  Created by BoiseITGuru on 8/4/22.
//

import Foundation
import FirebaseFirestoreSwift

struct Client: Identifiable, Codable {
    @DocumentID var id: String?
    var firstName: String?
    var lastName: String?
    var displayName: String?
    var photoURL: URL?
    var email: String?
    var phoneNumber: String?
    var clientAddress: ClientAddress?
    var tradingLevel: ClientTradingLevel?
    
}

struct ClientAddress: Codable {
    var address1: String?
    var address2: String?
    var city: String?
    var state: String?
    var zip: String?
}

enum ClientTradingLevel: String, Codable {
    case founder = "Founding Member"
    case governor = "Governance Board Member"
    case earlyAdopter = "Early Investor/Adopter"
    case agent = "Trading Agent"
    case member = "DAO Member"
}
