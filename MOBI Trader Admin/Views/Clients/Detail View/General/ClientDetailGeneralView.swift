//
//  ClientDetailGeneralView.swift
//  MOBI Trader Admin
//
//  Created by BoiseITGuru on 8/5/22.
//

import SwiftUI

struct ClientDetailGeneralView: View {
    @State var client: Client
    @State var edit = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 10) {
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
                VStack(alignment: .leading) {
                    HStack {
                        Text(client.displayName!)
                            .font(.title)
                            .lineLimit(1)
                        Spacer()
                        Button(action: { edit.toggle() }) {
                            if edit {
                                Text("Edit")
                            } else {
                                Text("Save")
                            }
                        }
                    }
                    .padding(.trailing, 10)
                    Form {
                        HStack(spacing:10) {
                            TextField("First Name:", text: Binding($client.firstName, replacingNilWith: ""))
                            TextField("Last Name:", text: Binding($client.lastName, replacingNilWith: ""))
                        }
                    }
                    .disabled(edit)
                }
                .padding(.trailing, 10)
            }
        }
        .border(.bar, width: 10)
        .padding(10)
    }
}

