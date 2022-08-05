//
//  NewClientViewModel.swift
//  MOBI Trader Admin
//
//  Created by BoiseITGuru on 8/4/22.
//

import Firebase
import FirebaseFunctions

class NewClientViewModel: ObservableObject {
    func createNewClient(client: Client) async -> CreateClientResponse {
        do {
            let jsondata = try Firestore.Encoder().encode(client)
            _ = try await Functions.functions().httpsCallable("admin-clients-createClient").call(jsondata)
        } catch {
            if let error = error as NSError? {
                if error.domain == FunctionsErrorDomain {
                    let code = FunctionsErrorCode(rawValue: error.code)
                    let message = error.localizedDescription
                    let details = error.userInfo[FunctionsErrorDetailsKey]
                    
                    return CreateClientResponse(status: false, msg: message)
                }
            }
        }
        
        return CreateClientResponse(status: true, msg: "")
    }
}
