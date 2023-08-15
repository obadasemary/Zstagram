//
//  EditProfileView.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 15.08.2023.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var selectedImage: PhotosPickerItem?
    @State private var isLoading: Bool = true
    @State private var fullname = ""
    @State private var bio = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    PhotosPicker(selection: $selectedImage) {
                        VStack {
                            Image(systemName: "person")
                                .resizable()
                                .scaledToFill()
                                .frame(
                                    width: CGFloat.imageDimension(),
                                    height: CGFloat.imageDimension()
                                )
                                .foregroundColor(.white)
                                .background(.gray)
                                .clipShape(Circle())
                            
                            Text("Edit profile picture")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            
                            Divider()
                        }
                    }
                    .padding(.vertical, 8)
                    
                    VStack {
                        EditProfileRowView(
                            title: "Name",
                            placeholder: "Enter your name...",
                            text: $fullname
                        )
                        
                        EditProfileRowView(
                            title: "Bio",
                            placeholder: "Enter you bio...",
                            text: $bio
                        )
                    }
                }
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "square.and.arrow.down")
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
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
