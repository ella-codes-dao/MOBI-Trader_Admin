//
//  ClientsListView.swift
//  MOBI Trader Admin
//
//  Created by BoiseITGuru on 8/4/22.
//

import SwiftUI

struct ClientsListView: View {
    @EnvironmentObject var authModel: AuthViewModel
    @ObservedObject var clientsModel = ClientListViewModel()
    
    var body: some View {
        NavigationView {
            List(clientsModel.clients) { client in
                NavigationLink(destination: ClientDetailView(client: client)) {
                    Text(client.displayName ?? "Error Getting Name")
                }
            }.listStyle(PlainListStyle())
        }
        .onAppear {
            clientsModel.getClients(tenantID: authModel.userInfo.tenantID!)
        }
    }
}

struct ClientsListView_Previews: PreviewProvider {
    static var previews: some View {
        ClientsListView()
    }
}
