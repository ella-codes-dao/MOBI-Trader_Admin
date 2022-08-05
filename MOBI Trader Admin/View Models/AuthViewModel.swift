//
//  AuthViewModel.swift
//  MOBI Trader Admin
//
//  Created by BoiseITGuru on 8/4/22.
//

import Firebase

class AuthViewModel: ObservableObject {
    @Published var dashboardActive = true
    @Published var clientsActive = false
    @Published var newClientActive = false
    @Published var settingsActive = false
    
    @Published var signedIn: Bool = false
    @Published var userInfo: User = User()
    @Published var authError: String?
    @Published var showAuthError: Bool = false
    
    private var authEventHandler: AuthStateDidChangeListenerHandle?

    init() {
        Auth.auth().addStateDidChangeListener { [self] auth, user in
            if let user = user {
                //Get User Info
                Firestore.firestore().collection("users").document(user.uid).addSnapshotListener { documentSnapshot, error in
                    guard let document = documentSnapshot else {
                        print("Error fetching document: \(error!)")
                        self.authError = error?.localizedDescription
                        self.showAuthError = true
                        self.signOut()
                        return
                    }
                    
                    do {
                        let data = try document.data(as: User.self)

                        // Check if User is an Admin or Agent, otherwise signout with error
                        if !data.isAgent {
                            print("not agent or admin")
                            self.authError = "You must me an Agent to use this application"
                            self.showAuthError = true
                            self.signOut()
                            return
                        }

                        // Set User Display Information
                        self.userInfo = data
                        self.signedIn = true
                    } catch {
                        print("Error parsing document: \(error)")
                        self.authError = error.localizedDescription
                        self.showAuthError = true
                        self.signOut()
                        return
                    }
                }
            } else {
                self.userInfo.displayName = nil
                self.userInfo.email = nil
                self.userInfo.photoURL = nil
                self.userInfo.tenantID = nil
                self.userInfo.isAgent = false
                self.userInfo.isAdmin = false
                self.signedIn = false
            }
        }
    }
    
    func signInEmail(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
            if let error = error {
                strongSelf.authError = error.localizedDescription
                strongSelf.showAuthError = true
                print(error.localizedDescription)
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
