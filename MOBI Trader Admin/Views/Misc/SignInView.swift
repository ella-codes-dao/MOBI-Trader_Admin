//
//  SignInView.swift
//  MOBI Trader Admin
//
//  Created by BoiseITGuru on 8/4/22.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var authModel: AuthViewModel
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            TextField("Username", text: $username)
            SecureField("Password", text: $password)
            Button { authModel.signInEmail(email: username, password: password) } label: {
                Text("Sign In")
            }

        }
        .padding(10)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
