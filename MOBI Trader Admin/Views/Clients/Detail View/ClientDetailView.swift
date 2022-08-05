//
//  ClientDetailView.swift
//  MOBI Trader Admin
//
//  Created by BoiseITGuru on 8/5/22.
//

import SwiftUI

struct ClientDetailView: View {
    @State var client: Client
    
    var body: some View {
        VStack(spacing: 15) {
            ClientDetailGeneralView(client: client)
            ClientExchangeConnectionsView(client: client)
        }
    }
}
