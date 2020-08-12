//
//  RecipeDetailViewController.swift
//  RecipeBook
//
//  Created by Vishal on 12/08/20.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var publisher: UILabel!
    @IBOutlet weak var socialRank: UILabel!
    
    @IBOutlet weak var ingredients: UITableView!
    var id: String?
    
    let recipeDetailViewModel = RecipeDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        recipeDetailViewModel.getViewDetail(id ?? "") {
            DispatchQueue.main.async {
                self.recipeName.text = self.recipeDetailViewModel.recipeDetails?.recipe.title
                self.publisher.text = self.recipeDetailViewModel.recipeDetails?.recipe.publisher
                self.socialRank.text = "\(self.recipeDetailViewModel.recipeDetails?.recipe.social_rank ?? 0.0)"
                self.image.downloaded(from: self.recipeDetailViewModel.recipeDetails?.recipe.image_url ?? "")
                self.ingredients.reloadData()
            }
        }
    }
}

extension RecipeDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeDetailViewModel.recipeDetails?.recipe.ingredients?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1") as? RecipeDetailCell else {
            return UITableViewCell()
        }
        guard let ingredient = recipeDetailViewModel.recipeDetails?.recipe.ingredients?[indexPath.row] else {
            return UITableViewCell()
        }
        cell1.configureCell(ingredient)
        
        return cell1
    }
}


