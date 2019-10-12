//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Blake Andrew Price on 10/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Codable, Equatable {
    var name: String
    var added: Bool = false
    
    init(name: String, added: Bool) {
        self.name = name
        self.added = false
    }
}
