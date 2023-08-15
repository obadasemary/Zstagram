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
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    PhotosPicker(selection: $selectedImage) {
                        VStack {
                            Image("instagram-logo")
                                .resizable()
                                .scaledToFill()
                                .frame(
                                    width: CGFloat.imageDimension(),
                                    height: CGFloat.imageDimension()
                                )
                                .background(.gray)
                                .clipShape(Circle())
                                .redacted(reason: isLoading ? .placeholder : [])
                            
                            Text("Edit profile picture")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            
                            Divider()
                        }
                    }
                    .padding(.vertical, 8)
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
