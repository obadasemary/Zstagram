//
//  EditProfileViewModel.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 15.08.2023.
//

import SwiftUI
import PhotosUI
import Firebase

@MainActor
class EditProfileViewModel: ObservableObject {
    
    @Published var user: User
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(fromItem: selectedImage)
            }
        }
    }
    @Published var profileImage: Image?
    
    @Published var fullname = ""
    @Published var bio = ""
    @Published var isLoading = false
    
    private var uiImage: UIImage?
    
    init(user: User) {
        self.user = user
        self.fullname = user.fullname ?? ""
        self.bio = user.bio ?? ""
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        
        isLoading = true
        
        if let uiImage = uiImage {
            let imageUrl = try? await ImageUploader.uploadImage(image: uiImage, uId: user.id, isProfileImage: true)
            user.profileImageUrl = imageUrl
        }
        
        if !fullname.isEmpty && user.fullname != fullname {
            user.fullname = fullname
        }
        
        if !bio.isEmpty && user.bio != bio {
            user.bio = bio
        }
        
        let user = User(
            id: user.id,
            username: user.username,
            profileImageUrl: user.profileImageUrl,
            fullname: user.fullname,
            bio: user.bio,
            email: user.email
        )
        
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(user.id).updateData(encodedUser)
        
        isLoading = false
    }
}
