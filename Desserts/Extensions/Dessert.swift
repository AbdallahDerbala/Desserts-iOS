//
//  Dessert.swift
//  Desserts
//
//  Created by Abdallah Derbala on 5/18/23.
//

import Foundation

extension Dessert {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let mealDictionary = try container.decode([String: String?].self)
        
        var index = 1
        var ingredients: [Ingredient] = []
        
        while
            let ingredient = mealDictionary["strIngredient\(index)"] as? String,
            let measure = mealDictionary["strMeasure\(index)"] as? String,
            !ingredient.isEmpty, !measure.isEmpty
        {
            ingredients.append(.init(name: ingredient, measure: measure))
            index += 1
        }
        self.ingredients = ingredients
        id = mealDictionary["idMeal"] as? String ?? ""
        name = mealDictionary["strMeal"] as? String ?? ""
        imageURL = mealDictionary["strMealThumb"] as? String ?? ""
        instructions = mealDictionary["strInstructions"] as? String ?? ""
        youtubeURL = mealDictionary["strYoutube"] as? String ?? ""
    }
}
