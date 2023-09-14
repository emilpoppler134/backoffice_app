//
//  LoginView.swift
//  MyFirstApp
//
//  Created by Emil Poppler on 2022-12-24.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    
    @Binding var isLoggedIn: Bool
        
    var body: some View {
        VStack(alignment: .leading) {
            Image("logo")
                .resizable()
                .frame(width: 150, height: 88)
            Text("Login")
                .font(.system(size: 30))
                .fontWeight(.semibold)
            Text("Med ditt 50Archive konto")
                .foregroundColor(Color.black.opacity(0.5))
                .padding(.bottom, 12)
            TextField("Användarnamn", text: $username)
                .padding()
                .frame(width: 350, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .padding(.bottom, 12)
            SecureField("Lösenord", text: $password)
                .padding()
                .frame(width: 350, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .padding(.bottom, 18)
            Button(action: {
                Task {
                    await login(username: username, password: password)
                    
                    if LocalStorage.loggedIn {
                        self.isLoggedIn = true
                    }
                }
            }) {
                Text("LOGIN")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 50)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .frame(height: 500)
    }
}
