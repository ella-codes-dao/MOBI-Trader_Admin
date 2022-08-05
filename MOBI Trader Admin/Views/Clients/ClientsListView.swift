//
//  ClientsListView.swift
//  MOBI Trader Admin
//
//  Created by BoiseITGuru on 8/4/22.
//

import SwiftUI

struct ClientsListView: View {
    @EnvironmentObject var authModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: Text("Client Details")) {
                    Text("Client 1")
                }
                NavigationLink(destination: Text("Client Details")) {
                    Text("Client 2")
                }
                NavigationLink(destination: Text("Client Details")) {
                    Text("Client 3")
                }
            }.listStyle(PlainListStyle())
        }
    }
}

struct ClientsListView_Previews: PreviewProvider {
    static var previews: some View {
        ClientsListView()
    }
}
