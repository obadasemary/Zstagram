//
//  LoginView.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 29.07.2023.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
//
//                Spacer()
//
                Text("Zstagram")
                    .font(.title2)
                    .fontWeight(.bold)
                    .fontDesign(.monospaced)
                
                VStack {
                    TextField("Enter your email", text: $email)
                        .autocorrectionDisabled()
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                    
                    SecureField("Password", text: $password)
                        .autocorrectionDisabled()
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                }
            

            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
