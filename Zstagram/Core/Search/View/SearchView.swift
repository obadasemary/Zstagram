//
//  SearchView.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 28.07.2023.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    LazyVStack(spacing: 12) {
                        ForEach(viewModel.users) { user in
                            NavigationLink(value: user) {
                                UserImageWithNameView(user: user)
                            }
                        }
                    }
                    .padding(.top, 8)
                    .searchable(text: $searchText, prompt: "Search...")
                    
                    if viewModel.isLoading {
                        LoadingView()
                    }
                }
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
