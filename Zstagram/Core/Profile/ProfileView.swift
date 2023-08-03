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
    
    var posts: [Post] {
        return Post.MOCK_POSTS.filter({ $0.user?.username == user.username })
    }
    
    var body: some View {
        ScrollView {
            ProfileHeaderView(user: user, postsCount: posts.count)
            
            PostGridView(posts: posts)
        }
        .redacted(reason: isLoading ? .placeholder : [])
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
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
                isFromSearchView: false
            )
        }
    }
}
