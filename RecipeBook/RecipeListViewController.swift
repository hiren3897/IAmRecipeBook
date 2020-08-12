//
//  ViewController.swift
//  RecipeBook
//
//  Created by Hiren on 12/08/20.
//

import UIKit

class RecipeListViewController: UIViewController {
    
    @IBOutlet weak var recipeListTable: UITableView!
    
    let viewModel = RecipeViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getViewRecipe {
            DispatchQueue.main.async {
                self.recipeListTable.reloadData()
            }
        }
    }
}


extension RecipeListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.recipeList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? RecipeCell else {
            return UITableViewCell()
        }
        guard let recipe = viewModel.recipeList?.recipes[indexPath.row] else{
            return UITableViewCell()
        }
        cell.configureCell(recipe)
        return cell
    }
}

extension RecipeListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let recipe = viewModel.recipeList?.recipes[indexPath.row] else{
            return
        }
        
        self.performSegue(withIdentifier: "seguedetail", sender: recipe.recipe_id)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let obj = segue.destination as? RecipeDetailViewController{
            obj.id = sender as? String
        }
    }
}

