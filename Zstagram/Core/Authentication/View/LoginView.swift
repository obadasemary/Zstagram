//
//  LoginView.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 29.07.2023.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Spacer(minLength: UIScreen.main.bounds.height / 5)
                    
                    Text("Zstagram")
                        .font(.title2)
                        .fontWeight(.bold)
                        .fontDesign(.monospaced)
                    
                    VStack {
                        TextField("Enter your email", text: $viewModel.email)
                            .autocapitalization(.none)
                            .autocorrectionDisabled()
                            .modifier(IGTextFieldModifier())
                        
                        SecureField("Password", text: $viewModel.password)
                            .autocorrectionDisabled()
                            .modifier(IGTextFieldModifier())
                    }
                    
                    Button {
                        viewModel.signOut()
                    } label: {
                        Text("Forgot Password?")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .padding(.top)
                            .padding(.trailing, 28)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    ZStack {
                        Button {
                            Task {
                                try await viewModel.signIn()
                            }
                        } label: {
                            Text("Login")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: 360, height: 44)
                                .background(Color(.systemBlue))
                                .cornerRadius(8)
                        }
                        .padding(.vertical)
                        
                        if viewModel.isLoading {
                            LoadingView()
                        }
                    }
                    
                    HStack {
                        Rectangle()
                            .frame(
                                width: (UIScreen.main.bounds.width / 2) - 40 ,
                                height: 0.5
                            )
                        
                        Text("OR")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Rectangle()
                            .frame(
                                width: (UIScreen.main.bounds.width / 2) - 40 ,
                                height: 0.5
                            )
                    }
                    .foregroundColor(.gray)
                    
                    Button {
                        print("Continue with Instagram")
                    } label: {
                        HStack {
                            Image("instagram-logo")
                                .resizable()
                                .frame(width: 20, height: 20)
                            
                            Text("Continue with Instagram")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                        }
                        .padding(.top, 8)
                    }
                    
                    Spacer(minLength: UIScreen.main.bounds.height / 4)
                    
                    Divider()
                    
                    NavigationLink {
                        AddEmailView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        HStack(spacing: 3) {
                            
                            Text("Don't have an account?")
                            Text("Sign Up")
                                .fontWeight(.semibold)
                        }
                        .font(.footnote)
                    }
                    .padding(.vertical, 16)
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(LoginViewModel())
    }
}
