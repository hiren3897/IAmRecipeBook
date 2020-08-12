//
//  Network.swift
//  RecipeBook
//
//  Created by Vishal on 12/08/20.
//

import Foundation

class Network {
    func getRecipe(completionHandler: @escaping (RecipeList) -> Void ) -> Void {
        guard let url = URL(string: "https://forkify-api.herokuapp.com/api/search?q=pizza") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error accessing swapi.co: \(error.localizedDescription)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            if let data = data{
                do{
                    let recipe = try! JSONDecoder().decode(RecipeList.self, from: data)
                    completionHandler(recipe)
                }catch{
                    print(error.localizedDescription)
                }
            }
            
            
        })
        
        task.resume()
    }
    
    func getRecipeDetail(_ id: String, completionHandler: @escaping (RecipeDetailModel) -> Void ) {
        
        guard let url = URL(string: "https://forkify-api.herokuapp.com/api/get?rId=\(id)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error accessing swapi.co: \(error.localizedDescription)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            if let data = data{
                do{
                    let recipeDetail = try! JSONDecoder().decode(RecipeDetailModel.self, from: data)
                    completionHandler(recipeDetail)
                }catch{
                    print(error.localizedDescription)
                }
            }
            
            
        })
        
        task.resume()
        
    }
}
