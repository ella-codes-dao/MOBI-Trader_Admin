//
//  ClientListViewModel.swift
//  MOBI Trader Admin
//
//  Created by BoiseITGuru on 8/4/22.
//

import Firebase

class ClientListViewModel: ObservableObject {
    @Published var clients: [Client] = []
    
    func getClients(tenantID: String) {
        print("getting clients")
        Firestore.firestore().collection("users").whereField("tenantID", isEqualTo: tenantID).addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(error!)")
                return
            }
            
            self.clients = documents.compactMap { queryDocumentSnapshot -> Client? in
                return try? queryDocumentSnapshot.data(as: Client.self)
            }
        }
    }
}
