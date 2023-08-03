//
//  FeedListView.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 26.07.2023.
//

import SwiftUI

struct FeedListView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(Post.MOCK_POSTS) { post in
                        FeedView(post: post)
                    }
                }
                .padding(.top, 8)
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
