//
//  NewClientViewModel.swift
//  MOBI Trader Admin
//
//  Created by BoiseITGuru on 8/4/22.
//

import Firebase
import FirebaseFunctions

class NewClientViewModel: ObservableObject {
    func createNewClient(client: Client) async {
        do {
            print("creating client")
            let jsondata = try Firestore.Encoder().encode(client)
            let newClient = try await Functions.functions().httpsCallable("admin-clients-createClient").call(jsondata)
            print("client created")
        } catch {
        if let error = error as NSError? {
            if error.domain == FunctionsErrorDomain {
                let code = FunctionsErrorCode(rawValue: error.code)
                let message = error.localizedDescription
                let details = error.userInfo[FunctionsErrorDetailsKey]
                
                print("Error: \(String(describing: code)) - \(message). Detail: \(details ?? "")")
            }
        }
        }
    }
}
