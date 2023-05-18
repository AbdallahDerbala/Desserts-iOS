//
//  AsyncImage.swift
//  Desserts
//
//  Created by Abdallah Derbala on 5/18/23.
//

import Foundation
import SwiftUI

extension AsyncImageView {
    func loadImageIfNeeded(imageLoader: ImageLoader, isVisible: Bool, urlString: String?) {
        if isVisible,
           let urlString = urlString,
           let url = URL(string: urlString) {
            imageLoader.url = url
            imageLoader.load()
        }
    }
}
