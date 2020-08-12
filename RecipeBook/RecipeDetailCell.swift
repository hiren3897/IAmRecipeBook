//
//  RecipeDetailCell.swift
//  RecipeBook
//
//  Created by Hiren on 12/08/20.
//

import Foundation
import UIKit
class RecipeDetailCell: UITableViewCell {
    
    
    @IBOutlet weak var items: UILabel!
    
    func configureCell(_ ingredient: String) -> Void {
        items.text = ingredient
    }
    
}
