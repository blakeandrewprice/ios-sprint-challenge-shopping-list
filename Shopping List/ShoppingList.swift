//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Blake Andrew Price on 10/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingList: Codable {
    var items: [ShoppingItem] = [
    ShoppingItem(name: "Apple"),
    ShoppingItem(name: "Grapes"),
    ShoppingItem(name: "Milk"),
    ShoppingItem(name: "Muffin"),
    ShoppingItem(name: "Popcorn"),
    ShoppingItem(name: "Soda"),
    ShoppingItem(name: "Strawberries")
    ]
    
    
    //MARK: - Persistent
    private var shoppingListURL: URL? {
        let fileManager = FileManager.default
        guard let documents = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            else { return nil }
        
        return documents.appendingPathComponent("items.plist")
    }
    
    func saveToPersistentStore() {
        guard let url = shoppingListURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(items)
            try data.write(to: url)
        } catch {
            print("Error saving books data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        guard let url = shoppingListURL else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedItems = try decoder.decode([ShoppingItem].self, from: data)
            items = decodedItems
        } catch  {
            print("Error loading books data: \(error)")
        }
    }
}
