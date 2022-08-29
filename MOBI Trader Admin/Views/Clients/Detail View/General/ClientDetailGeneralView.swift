//
//  ClientDetailGeneralView.swift
//  MOBI Trader Admin
//
//  Created by BoiseITGuru on 8/5/22.
//

import SwiftUI

struct ClientDetailGeneralView: View {
    @ObservedObject var model = UpdateClientViewModel()
    @State var client: Client
    @State var clientAddress: ClientAddress
    @State private var showError = false
    @State private var errorMsg = ""
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Spacer()
                Button(action: { Task { await save() } }) {
                    if model.edit {
                        Text("Edit")
                    } else {
                        Text("Save")
                    }
                }
            }
            .padding(.top, 10)
            .padding(.trailing, 10)
            Form {
                Section("General") {
                    TextField("First Name:", text: Binding($client.firstName, replacingNilWith: ""))
                    TextField("Last Name:", text: Binding($client.lastName, replacingNilWith: ""))
                    TextField("Email:", text: Binding($client.email, replacingNilWith: ""))
                    TextField("Mobile Number", text: Binding($client.phoneNumber, replacingNilWith: ""))
                }
                
                Section("Address") {
                    TextField("Address", text: Binding($clientAddress.address1, replacingNilWith: ""))
                    TextField("Address 2", text: Binding($clientAddress.address1, replacingNilWith: ""))
                    TextField("City", text: Binding($clientAddress.address1, replacingNilWith: ""))
                    TextField("State", text: Binding($clientAddress.address1, replacingNilWith: ""))
                    TextField("Zip", text: Binding($clientAddress.address1, replacingNilWith: ""))
                }
                
                Section("Member Info") {
                    Picker("Trading Level", selection: Binding($client.tradingLevel, replacingNilWith: .member)) {
                        Text(ClientTradingLevel.founder.rawValue).tag(ClientTradingLevel.founder)
                        Text(ClientTradingLevel.governor.rawValue).tag(ClientTradingLevel.governor)
                        Text(ClientTradingLevel.earlyAdopter.rawValue).tag(ClientTradingLevel.earlyAdopter)
                        Text(ClientTradingLevel.agent.rawValue).tag(ClientTradingLevel.agent)
                        Text(ClientTradingLevel.member.rawValue).tag(ClientTradingLevel.member)
                    }
                }
            }
            .disabled(model.edit)
            .alert("Error", isPresented: $showError) {
                Text(errorMsg)
            }
            .padding(10)
        }
        .border(.bar, width: 10)
    }
    
    func save() async {
        if model.edit {
            model.edit = false
        } else {
            client.clientAddress = clientAddress
            let updateClient = await model.updateClient(client: client)
            
            if (updateClient.status) {
                model.edit = true
            } else {
                errorMsg = updateClient.msg ?? "Generic User Creation Error"
                showError = true
            }
        }
    }
}

