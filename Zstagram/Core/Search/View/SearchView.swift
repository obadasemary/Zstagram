//
//  SearchView.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 28.07.2023.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(User.MOCK_USERS) { user in
                        NavigationLink(value: user) {
                            UserImageWithNameView(
                                image: user.profileImageUrl ?? "awsAI",
                                name: user.username,
                                fullName: user.fullname ?? nil
                            )
                        }
                    }
                }
                .padding(.top, 8)
                .searchable(text: $searchText, prompt: "Search...")
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(
                    user: user,
                    isFromSearchView: true
                )
                .navigationBarBackButtonHidden()
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
