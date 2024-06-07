//
//  Prompt.swift
//  AI Prompt Generator
//
//  Created by Manhattan on 18/04/24.
//

import Foundation

final class Prompt: ObservableObject {
    
    //TODO: Fix the full prompt generation
    //TODO: Check Strings generation
    
    let intro: String = """
    Hello AI, I need your help.
    Below you will find all the necessary details, each instruction is defined by three ### hashtags.
    Please avoid repetition, do not make up information, and make sure that any data provided is verified and accurate where possible through Internet searches. Make the necessary checks while always complying with applicable regulations and tailoring the approach to the specific context of your requests. Use only reliable and recognized sources.\n
    """
    
    // Free text
    @Published var task: String = ""
    @Published var context: String = ""
    @Published var specificInput: String = ""
    @Published var inputRequisites: String = ""
    
    //Attributes list
    @Published var attributesSets = AttributesSets()
    
    // Free text
    @Published var limitations: String = ""
    @Published var successCriteria: String = ""
    
    
    func check(_ element: String, with title: String) -> String {
        return element.isEmpty ? "" : "### \(title)\n\(element)\n"
    }
    
    func checkAttributes() -> String {
        
        var att = ""
        for s in attributesSets.allSets {
            if !s.listOfActive.isEmpty {
                att.append("\(s.listOfActiveDescription())\n")
            }
        }
        return att
    }
    
    
    // Meh... solution!!!!
    
    func generatePrompt() -> String {
        return "\(intro)\(check(task, with: "Task Definition"))\(check(context, with: "Context"))\(check(specificInput, with: "Specific Input"))\(check(inputRequisites, with: "Output Requisites"))\(checkAttributes())\(check(limitations, with: "Limitations and constraints"))\(check(successCriteria, with: "Success Criteria"))"
    }
}
