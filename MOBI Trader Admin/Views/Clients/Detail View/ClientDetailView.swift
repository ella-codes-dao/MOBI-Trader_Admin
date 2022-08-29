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
        ScrollView {
            VStack(alignment: .leading,spacing: 15) {
                HStack {
                    if client.photoURL != nil {
                        AsyncImage(url: client.photoURL, scale: 2) { image in
                            image
                              .resizable()
                              .clipShape(Circle())
                              .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            ProgressView()
                                .progressViewStyle(.circular)
                        }
                            .frame(width: 80, height: 80)
                            .padding(10)
                    } else {
                        Image("profile")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .padding(10)
                    }
                    Text(client.displayName!)
                        .font(.title)
                        .lineLimit(1)
                }
                .padding(.trailing, 10)
                ClientDetailGeneralView(client: client, clientAddress: client.clientAddress ?? ClientAddress())
                ClientExchangeConnectionsView(client: client)
            }
            .padding(.horizontal, 10)
        }
    }
}
