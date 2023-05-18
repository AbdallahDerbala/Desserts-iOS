//
//  AsyncImageView.swift
//  Desserts
//
//  Created by Abdallah Derbala on 5/18/23.
//

import SwiftUI

struct AsyncImageView: View {
    @StateObject private var imageLoader = ImageLoader()
    @Binding var urlString: String?
    @State private var isVisible = false
    
    init(urlString: Binding<String?>) {
        self._urlString = urlString
    }
    
    var body: some View {
        image
            .onAppear {
                isVisible.toggle()
                loadImageIfNeeded(imageLoader: imageLoader, isVisible: isVisible, urlString: urlString)
            }
            .onDisappear {
                isVisible.toggle()
            }
            .onChange(of: urlString) { _ in
                loadImageIfNeeded(imageLoader: imageLoader, isVisible: isVisible, urlString: urlString)
            }
    }
    
    @ViewBuilder
    private var image: some View {
        if isVisible {
            Group {
                if let image = imageLoader.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                } else {
                    Text("No Image")
                }
            }
        } else {
            Color.clear
        }
    }
}


struct AsyncImageView_Previews: PreviewProvider {
    
    @State static var urlString: String? = dev.dessert?.imageURL
    
    static var previews: some View {
        AsyncImageView(urlString: $urlString)
    }
}

