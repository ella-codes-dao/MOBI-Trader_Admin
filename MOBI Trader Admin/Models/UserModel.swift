//
//  UserModel.swift
//  MOBI Trader Admin
//
//  Created by BoiseITGuru on 8/4/22.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable {
    @DocumentID var id: String?
    var displayName: String?
    var email: String?
    var photoURL: URL?
    var tenantID: String?
    var isAdmin = false
    var isAgent = false
}
