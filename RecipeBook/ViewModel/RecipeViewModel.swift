//
//  RecipeViewModel.swift
//  RecipeBook
//
//  Created by Hiren on 12/08/20.
//

import Foundation

class RecipeViewModel {
    var recipeList: RecipeList?
    let network = Network()
    
    init() {
        
    }
    
    func getViewRecipe(completionHandler: @escaping () -> Void) -> Void {
        network.getRecipe { (recipelist) in
            self.recipeList = recipelist
            completionHandler()
        }
    }
}
