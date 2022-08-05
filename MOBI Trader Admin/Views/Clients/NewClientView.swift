//
//  NewClientView.swift
//  MOBI Trader Admin
//
//  Created by BoiseITGuru on 8/4/22.
//

import SwiftUI

struct NewClientView: View {
    @EnvironmentObject var authModel: AuthViewModel
    @ObservedObject var newClientModel = NewClientViewModel()
    @State private var isPerformingTask = false
    @State private var showError = false
    @State private var errorMsg = ""
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var phoneNumber = ""
    @State var address1 = ""
    @State var address2 = ""
    @State var city = ""
    @State var state = ""
    @State var zip = ""
    
    var body: some View {
        Form {
            Section("General Info") {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Email", text: $email)
                TextField("Mobile Number", text: $phoneNumber)
            }
            .padding(5)
            
            Section("Address") {
                TextField("Address 1", text: $address1)
                TextField("Address 2", text: $address2)
                TextField("City", text: $city)
                TextField("State", text: $state)
                TextField("Zip", text: $zip)
            }
            .padding(5)
            
            Section {
                VStack(alignment: .trailing) {
                    Button(action: {
                        isPerformingTask = true
                        Task {
                            await saveClient()
                            isPerformingTask = false
                        }
                    }) {
                        Text("Create Client")
                    }
                    .disabled(isPerformingTask)
                    .alert("Error", isPresented: $showError) {
                        Text(errorMsg)
                    }

                }
            }
        }
        .padding(10)
    }
    
    func saveClient() async {
        let clientAddress = ClientAddress(address1: address1, address2: address2, city: city, state: state, zip: zip)
        let client = Client(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber, clientAddress: clientAddress)
        
        let newclient = await newClientModel.createNewClient(client: client)
        
        if (newclient.status) {
            authModel.newClientActive = false
            authModel.clientsActive = true
        } else {
            errorMsg = newclient.msg ?? "Generic User Creation Error"
            showError = true
        }
    }
}
