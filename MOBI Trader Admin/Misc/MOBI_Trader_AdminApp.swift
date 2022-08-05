//
//  MOBI_Trader_AdminApp.swift
//  MOBI Trader Admin
//
//  Created by BoiseITGuru on 8/4/22.
//

import SwiftUI
import Firebase
import FirebaseFunctions

@main
struct MOBI_Trader_AdminApp: App {
    @StateObject var authModel = AuthViewModel()
    
    init() {
        let providerFactory = AppCheckDebugProviderFactory()
        AppCheck.setAppCheckProviderFactory(providerFactory)
        
        FirebaseApp.configure()
        
//        Auth.auth().useEmulator(withHost: "localhost", port: 9099)
//        Firestore.firestore().useEmulator(withHost: "localhost", port: 8088)
//        Functions.functions().useEmulator(withHost: "localhost", port: 5001)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authModel)
        }
    }
}
