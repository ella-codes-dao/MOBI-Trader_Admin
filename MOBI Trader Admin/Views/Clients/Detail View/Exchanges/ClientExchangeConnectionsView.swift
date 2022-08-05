//
//  ClientExchangeConnectionsView.swift
//  MOBI Trader Admin
//
//  Created by BoiseITGuru on 8/5/22.
//

import SwiftUI

struct ClientExchangeConnectionsView: View {
    @State var client: Client
    
    var body: some View {
        VStack(spacing: 15) {
            HStack(spacing: 10) {
                Button(action: {}) {
                    Image("kucoin")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            HStack(spacing: 10) {
                
                Button(action: {}) {
                    Image("coinbase")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
        }
        .frame(maxWidth: 100)
        .padding(.trailing, 15)
    }
}
