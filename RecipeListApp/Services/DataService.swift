//
//  DataService.swift
//  RecipeListApp
//
//  Created by Aoyu Chen on 5/16/21.
//

import Foundation

// If there are multiple view models, this is the single place where data fetching code can be found
class DataService {
    
    func getLocalData() -> [Recipe] {
        // Parse local json file
        
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard pathString != nil else {
            return [Recipe]()
        }
        // Create an url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                // Decode data into
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the unique IDs
                for recipe in recipeData {
                    recipe.id = UUID()
                }
                
                // Return the recipes
                return recipeData
            }
            catch {
                // error with decode
                print(error)
            }
        }
        catch {
            // error with getting data
            print(error)
        }
        return [Recipe]()
    }
}
