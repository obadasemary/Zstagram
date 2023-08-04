//
//  UploadPostView.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 3.08.2023.
//

import PhotosUI
import SwiftUI

struct UploadPostView: View {
    
    @State private var isLoading: Bool = true
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    @State private var caption = ""
    @State private var imagePickerPresented = false
    @StateObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack(spacing: 8) {
                    if let image = viewModel.postImage {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: imageDimension, height: imageDimension)
                            .clipped()
                            .cornerRadius(8)
                    } else {
                        Image("instagram-logo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: imageDimension, height: imageDimension)
                            .clipped()
                            .redacted(reason: isLoading ? .placeholder : [])
                            .cornerRadius(8)
                    }
                    
                    TextField(
                        "Enter your caption...",
                        text: $caption,
                        axis: .vertical
                    )
                }
                .padding()
            }
            .navigationTitle("New Post")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        caption = ""
                        viewModel.selectedImage = nil
                        viewModel.postImage = nil
                        tabIndex = 0
                    } label: {
                        Image(systemName: "xmark.app")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.black)
                    }
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
        .onAppear {
            imagePickerPresented.toggle()
            if viewModel.postImage != nil {
                self.isLoading = false
            }
        }
        .photosPicker(
            isPresented: $imagePickerPresented,
            selection: $viewModel.selectedImage
        )
        .tint(.black)
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(tabIndex: .constant(0))
    }
}