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
            return """
                ### \(title)
                \(intro)
                \(listOfActive.map{$0.name}.joined(separator: ", ")).
                """
        }
        return ""
    }
    
    func listOfActiveDescriptionInForm() -> String {
            return "Your selection: \(listOfActive.map{$0.name}.joined(separator: ", "))."
    }
}

struct AttributesSets {
    
    var allSets: [AttributeSet] {
       return [
        personas,
        voiceTone,
        writingStyle,
        targetAudience
       ]
    }
    
    var personas: AttributeSet = AttributeSet(
        title: "Personas",
        description: "Select the professions, maximum two, that the system will represent when generating the prompt.",
        numberOfAllowedAttributes: 2,
        list: [
            Attribute(name: "Lawyer"),
            Attribute(name: "Social Media Manager"),
            Attribute(name: "Financial Advisor"),
            Attribute(name: "Real Estate Consultant"),
            Attribute(name: "IT Manager"),
            Attribute(name: "Privacy Expert"),
            Attribute(name: "Copywriter"),
            Attribute(name: "Teacher"),
            Attribute(name: "Mechanichal Engineer")
        ],
        intro: "You must act as: "
    )
    
    var voiceTone: AttributeSet = AttributeSet(
        title: "VoiceTone",
        description: "Choose the most appropriate tone of voice for the target audience. You can select a maximum of three options.",
        numberOfAllowedAttributes: 3,
        list: [
            Attribute(name: "Formal"),
            Attribute(name: "Informal"),
            Attribute(name: "Neutral"),
            Attribute(name: "Tech"),
            Attribute(name: "Literate"),
            Attribute(name: "Conversational")
        ],
        intro: "The voice tone must be: "
    )
    
    var writingStyle: AttributeSet = AttributeSet(
        title: "Writing Style",
        description: "Choose the writing style most suited to your target audience. Maximum three options.",
        numberOfAllowedAttributes: 3,
        list: [
            Attribute(name: "Informaitve"),
            Attribute(name: "Instructive"),
            Attribute(name: "Argomentative"),
            Attribute(name: "Descriptive"),
            Attribute(name: "Expositive"),
            Attribute(name: "Legal"),
            Attribute(name: "Technical"),
            Attribute(name: "Persuasive"),
            Attribute(name: "Conversational"),
            Attribute(name: "Humoristic")
        ],
        intro: "The selected writing style is: "
    )
    
    var targetAudience: AttributeSet = AttributeSet(
        title: "Target Audicence",
        description: "Choose your primary target audience. You can select a maximum of three options.",
        numberOfAllowedAttributes: 3,
        list: [
            Attribute(name: "Private Clients"),
            Attribute(name: "Companies and corparations"),
            Attribute(name: "Lawyers"),
            Attribute(name: "Financial institutions"),
            Attribute(name: "Government institutions"),
            Attribute(name: "ONG"),
            Attribute(name: "General public")
        ],
        intro: "You must talk to: "
    )
}
