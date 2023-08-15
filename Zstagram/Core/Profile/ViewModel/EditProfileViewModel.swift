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
    
    init(user: User) {
        self.user = user
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        
        if !fullname.isEmpty && user.fullname != fullname {
            print("DEBUG: Update fullname \(fullname)")
            user.fullname = fullname
        }
        
        if !bio.isEmpty && user.bio != bio {
            print("DEBUG: Update bio \(bio)")
            user.bio = bio
        }
        
        let user = User(
            id: user.id,
            username: user.username,
            fullname: user.fullname,
            bio: user.bio,
            email: user.email
        )
        
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(user.id).updateData(encodedUser)
    }
}
