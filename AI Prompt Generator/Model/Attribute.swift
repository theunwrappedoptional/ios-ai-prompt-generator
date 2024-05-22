//
//  Attribute.swift
//  AI Prompt Generator
//
//  Created by Manhattan on 20/05/24.
//

import Foundation

struct Attribute: Identifiable, Equatable {
    var id: String { name }
    var name = ""
    var isActive = false
}

struct AttributeSet {
    var title = ""
    var description = ""
    var numberOfAllowedAttributes = 0
    var list = [Attribute]()
    var intro = ""
    
    var listOfActive: [Attribute] {
        list.filter { a in
            a.isActive
        }
    }
    
    func listOfActiveDescription() -> String {
        if listOfActive.count != 0 {
            return intro + listOfActive.map{$0.name}.joined(separator: ", ") + "."
        }
        return ""
    }
    
    
}
