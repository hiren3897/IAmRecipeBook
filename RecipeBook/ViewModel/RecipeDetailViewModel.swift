//
//  RecipeDetailViewModel.swift
//  RecipeBook
//
//  Created by Hiren on 12/08/20.
//

import Foundation

class RecipeDetailViewModel {
    
    var recipeDetails: RecipeDetailModel?
    let network = Network()

    init() {
        
    }

    func getViewDetail(_ id: String, completionHandler: @escaping () -> Void) -> Void {
        network.getRecipeDetail(id) { (recipeDetailObj) in
            self.recipeDetails = recipeDetailObj
            completionHandler()
        }
    }
    
}


