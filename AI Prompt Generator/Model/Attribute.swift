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
