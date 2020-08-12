//
//  Recipe.swift
//  RecipeBook
//
//  Created by Hiren on 12/08/20.
//

import Foundation

struct Recipe:Decodable {
    let publisher: String
    let title: String
    let recipe_id: String
    let image_url: String
    let social_rank: Double
    var ingredients: [String]? = []
}

struct RecipeList:Decodable {
    let count: Int
    let recipes: [Recipe]
}
