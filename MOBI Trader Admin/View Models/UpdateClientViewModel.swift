//
//  UpdateClientViewModel.swift
//  MOBI Trader Admin
//
//  Created by BoiseITGuru on 8/8/22.
//

import Firebase
import FirebaseFunctions

class UpdateClientViewModel: ObservableObject {
    @Published var edit = true
    
    func updateClient(client: Client) async -> CreateClientResponse {
        do {
            let clientData = try Firestore.Encoder().encode(client)
            let jsonData: [String:Any] = [
                "id": client.id ?? "",
                "info": clientData
            ]
            _ = try await Functions.functions().httpsCallable("admin-clients-updateClient").call(jsonData)
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
