//
//  ContentView.swift
//  MOBI Trader Admin
//
//  Created by BoiseITGuru on 8/4/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authModel: AuthViewModel
    
    var body: some View {
        if authModel.signedIn {
            NavigationView {
                List {
                    NavigationLink(destination: Text("Dashboard"), isActive: $authModel.dashboardActive) {
                        Text("Dashboard")
                    }
                    HStack {
                        NavigationLink(destination: ClientsListView(), isActive: $authModel.clientsActive) {
                            Text("Clients")
                        }
                        NavigationLink(destination: NewClientView(), isActive: $authModel.newClientActive) { EmptyView() }
                        Spacer()
                        Button(action: { authModel.newClientActive.toggle() }) {
                            Image(systemName: "plus.circle")
                        }.buttonStyle(PlainButtonStyle())
                    }
                    NavigationLink(destination: Text("Settings")) {
                        Text("Settings")
                    }
                }.listStyle(SidebarListStyle())
                Button(action: { authModel.signOut() }) {
                    Text("Sign Out")
                }
            }
        } else {
            SignInView()
        }
    }
}
