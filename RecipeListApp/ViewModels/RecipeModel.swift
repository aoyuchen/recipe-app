//
//  RecipeModel.swift
//  RecipeListApp
//
//  Created by Aoyu Chen on 5/16/21.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        // Create an instance of data service and get the data
        let service = DataService()
        
        // Set the recipes property
        self.recipes = service.getLocalData()
    }
}
