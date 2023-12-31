//
//  ProfileHeaderView.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 3.08.2023.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    let user: User
    @State private var showEditProfile = false
    
    var body: some View {
        VStack {
            HStack {
                CircularProfileImageView(user: user, size: .large)
                
                Spacer()
                
                HStack(spacing: 8) {
                    UserStateView(value: 13, title: "Posts")
                    UserStateView(value: 12, title: "Followers")
                    UserStateView(value: 24, title: "Following")
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.bottom, 4)
            
            VStack(alignment: .leading, spacing: 4) {
                if let fullname = user.fullname {
                    Text(fullname)
                        .fontWeight(.semibold)
                }
                
                if let bio = user.bio {
                    Text(bio)
                }
            }
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            Button {
                if user.isCurrentUser {
                    showEditProfile.toggle()
                } else {
                    print("Follow user...")
                }
                
            } label: {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
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
            }
            
            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: user)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {        
            ProfileHeaderView(user: User.MOCK_USERS[0])
        }
    }
}
