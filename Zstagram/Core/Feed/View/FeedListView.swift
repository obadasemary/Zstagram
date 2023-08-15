//
//  FeedListView.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 26.07.2023.
//

import SwiftUI

struct FeedListView: View {
    
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    LazyVStack(spacing: 32) {
                        ForEach(viewModel.posts) { post in
                            FeedView(post: post)
                        }
                    }
                    .padding(.top, 8)
                    
                    if viewModel.isLoading {
                        LoadingView()
                    }
                }
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Zstagram")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .fontDesign(.monospaced)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "paperplane")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct FeedListView_Previews: PreviewProvider {
    static var previews: some View {
        FeedListView()
    }
}
