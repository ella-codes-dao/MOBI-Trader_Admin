//
//  ClientModel.swift
//  MOBI Trader Admin
//
//  Created by BoiseITGuru on 8/4/22.
//

import Foundation
import FirebaseFirestoreSwift

struct Client: Codable {
    @DocumentID var id: String?
    var firstName: String?
    var lastName: String?
    var preferredName: String?
    var photoURL: URL?
    var email: String?
    var phoneNumber: String?
    var clientAddress: ClientAddress?
    
}

struct ClientAddress: Codable {
    var address1: String?
    var address2: String?
    var city: String?
    var state: String?
    var zip: String?
}
