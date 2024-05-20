//
//  Prompt.swift
//  AI Prompt Generator
//
//  Created by Manhattan on 18/04/24.
//

import Foundation

final class Prompt: ObservableObject {
    
    let intro: String = """
    Hello AI, I need your help.
    Below you will find all the necessary details, each instruction is defined by three ### hashtags.
    Please avoid repetition, do not make up information, and make sure that any data provided is verified and accurate where possible through Internet searches. Make the necessary checks while always complying with applicable regulations and tailoring the approach to the specific context of your requests. Use only reliable and recognized sources
    """
    
    @Published var task: String = ""
    @Published var context: String = ""
    @Published var specificInput = ""
    @Published var inputRequisites = ""
    
    @Published var personas: [Attribute] = [
        Attribute(name: "Lawyer"),
        Attribute(name: "Social Media Manager"),
        Attribute(name: "Financial Advisor"),
        Attribute(name: "Real Estate Consultant"),
        Attribute(name: "IT Manager"),
        Attribute(name: "Privacy Expert"),
        Attribute(name: "Copywriter"),
        Attribute(name: "Teacher"),
        Attribute(name: "Mechanichal Engineer")
    ]
    
    @Published var voice: [Attribute] = [
        Attribute(name: "Formal"),
        Attribute(name: "Informa"),
        Attribute(name: "Neutral"),
        Attribute(name: "Tech"),
        Attribute(name: "Literate"),
        Attribute(name: "Conversational"),
    ]
    
    func check(_ element: String, with title: String) -> String {
        
        guard element != "" else{
            return ""
        }
        
        return """
        ### \(title)
        \(element)
        """
    }
    
    func check(_ attributes: [Attribute]) -> String {
        
        
//        guard element != "" else{
//            return ""
//        }
//        
//        return """
//        ### \(title)
//        \(element)
//        """
        
        return "attributes"
    }
    
    func generatePrompt() -> String {
        
        return """
        \(check(task, with: "Task Definition"))
        \(check(context, with: "Context"))
        \(check(specificInput, with: "Specific Input"))
        \(check(inputRequisites, with: "Output Requisites"))
        """
    }
}
