//
//  PostGridView.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 3.08.2023.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    
    @StateObject var viewModel: PostGridViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: PostGridViewModel(user: user))
    }
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        ZStack {
            LazyVGrid(columns: gridItems, spacing: 1) {
                ForEach(viewModel.posts) { post in
                    KFImage(URL(string: post.imageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(
                            width: CGFloat.imageDimension(),
                            height: CGFloat.imageDimension()
                        )
                        .clipped()
                }
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            PostGridView(user: User.MOCK_USERS[0])
        }
    }
}
