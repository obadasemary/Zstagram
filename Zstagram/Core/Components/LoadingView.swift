//
//  LoadingView.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 14.08.2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 150, height: 150)
                .foregroundColor(.white)
                .cornerRadius(20)
                .shadow(radius: 20)
            ProgressView("Loading")
                .tint(.black)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
