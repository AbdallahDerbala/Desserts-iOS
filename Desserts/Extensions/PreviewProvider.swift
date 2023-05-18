//
//  PreviewProvider.swift
//  Desserts
//
//  Created by Abdallah Derbala on 5/18/23.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() {
        initializeDessert()
    }
    
    let desserts = HomeViewModel()
    var dessert: Dessert?
    
    private func initializeDessert() {
        dessert = desserts.allMeals?.first
    }
}
