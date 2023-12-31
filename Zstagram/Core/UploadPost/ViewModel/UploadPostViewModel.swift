//
//  UploadPostViewModel.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 4.08.2023.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase

@MainActor
class UploadPostViewModel: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(fromItem: selectedImage)
            }
        }
    }
    @Published var postImage: Image?
    @Published var isLoading = false
    
    private var uiImage: UIImage?
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.postImage = Image(uiImage: uiImage)
    }
    
    func uploadPost(caption: String) async throws {
        
        isLoading = true
        
        guard let uid = Auth.auth().currentUser?.uid else {
            isLoading = false
            return
        }
        
        guard let uiImage = uiImage else {
            isLoading = false
            return
        }
        
        let postRef = Firestore.firestore().collection("posts").document()
        guard let imageUrl = try await ImageUploader.uploadImage(
            image: uiImage,
            uId: uid,
            isProfileImage: false
        ) else {
            isLoading = false
            return
        }
        
        let post = Post(
            id: postRef.documentID,
            ownerUid: uid,
            caption: caption,
            likes: 0,
            imageUrl: imageUrl,
            timestamp: Timestamp()
        )
        
        guard let encodedPost = try? Firestore.Encoder().encode(post) else {
            isLoading = false
            return
        }
        try await postRef.setData(encodedPost)
        
        isLoading = false
    }
}
