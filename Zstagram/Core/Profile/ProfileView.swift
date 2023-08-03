//
//  ProfileView.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 26.07.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    let user: User
    @State var isFromSearchView: Bool
    @State var isLoading: Bool = true
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Image(user.profileImageUrl ?? "awsAI")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .redacted(reason: isLoading ? .placeholder : [])
                    
                    Spacer()
                    
                    HStack(spacing: 8) {
                        UserStateView(value: 3, title: "Posts")
                        UserStateView(value: 12, title: "Followers")
                        UserStateView(value: 24, title: "Following")
                    }
                    .redacted(reason: isLoading ? .placeholder : [])
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom, 4)
                
                VStack(alignment: .leading, spacing: 4) {
                    if let fullname = user.fullname {
                        Text(fullname)
                            .fontWeight(.semibold)
                            .redacted(reason: isLoading ? .placeholder : [])
                    }
                    
                    if let bio = user.bio {
                        Text(bio)
                            .redacted(reason: isLoading ? .placeholder : [])
                    }
                }
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                Button {
                    
                } label: {
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(
                            width: 360,
                            height: 32
                        )
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.gray, lineWidth: 1)
                        )
                        .redacted(reason: isLoading ? .placeholder : [])
                }
                .redacted(reason: isLoading ? .placeholder : [])
                
                Divider()
            }
            
            LazyVGrid(columns: gridItems, spacing: 1) {
                ForEach(0 ... 12, id: \.self) { item in
                    Image("Obada")
                        .resizable()
                        .scaledToFill()
                        .redacted(reason: isLoading ? .placeholder : [])
                }
            }
        }
        .navigationTitle(user.username)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                if isFromSearchView {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                    Image(
                        systemName: isFromSearchView ?
                        "person.text.rectangle" : "line.3.horizontal"
                    )
                        .foregroundColor(.black)
                }
                
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.isLoading = false
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProfileView(
                user: User.MOCK_USERS[0],
                isFromSearchView: true
            )
        }
    }
}
