//
//  CreatePasswordView.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 31.07.2023.
//

import SwiftUI

struct CreatePasswordView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                Text("Create a password")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Text("Your password must be at least 6 characters in length.")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                
                SecureField("Password", text: $viewModel.password)
                    .autocorrectionDisabled()
                    .modifier(IGTextFieldModifier())
                    .padding(.top)
                
                NavigationLink {
                    CompleteSignUpView()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Next")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(8)
                }
                .padding(.vertical)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct CreatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePasswordView()
    }
}
