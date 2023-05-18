//
//  DessertModel.swift
//  Desserts
//
//  Created by Abdallah Derbala on 5/18/23.
//

import Foundation

struct Dessert: Codable, Identifiable {
    let id: String
    let name: String
    let imageURL: String
    let ingredients: [Ingredient]?
    let instructions: String?
    let youtubeURL: String
    
    var favoriteKey: String {
            "favorite_\(id)"
        }
    
    func isFavorite() -> Bool {
            UserDefaults.standard.bool(forKey: favoriteKey)
        }
    
    mutating func toggleFavorite() {
            let isFavorite = UserDefaults.standard.bool(forKey: favoriteKey)
            UserDefaults.standard.set(!isFavorite, forKey: favoriteKey)
        }
    
    var recentKey: String {
            "recent_\(id)"
        }
    
    func isrecent() -> Bool {
            UserDefaults.standard.bool(forKey: recentKey)
        }
    
    func setRecent() {
            UserDefaults.standard.set(true, forKey: recentKey)
        }
    
    func clearRecent() {
            UserDefaults.standard.set(false, forKey: recentKey)
        }
}
