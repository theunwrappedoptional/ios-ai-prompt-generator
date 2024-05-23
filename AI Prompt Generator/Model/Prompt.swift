//
//  Prompt.swift
//  AI Prompt Generator
//
//  Created by Manhattan on 18/04/24.
//

import Foundation

final class Prompt: ObservableObject {
    
    //TODO: Fix the full prompt generation
    
    let intro: String = """
    Hello AI, I need your help.
    Below you will find all the necessary details, each instruction is defined by three ### hashtags.
    Please avoid repetition, do not make up information, and make sure that any data provided is verified and accurate where possible through Internet searches. Make the necessary checks while always complying with applicable regulations and tailoring the approach to the specific context of your requests. Use only reliable and recognized sources
    """
    
    @Published var task: String = ""
    @Published var context: String = ""
    @Published var specificInput = ""
    @Published var inputRequisites = ""
    @Published var limitations = ""
    @Published var successCriteria = ""
    
    @Published var personas: AttributeSet = AttributeSet(
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
    
    @Published var voiceTone: AttributeSet = AttributeSet(
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
    
    @Published var writingStyle: AttributeSet = AttributeSet(
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
    
    @Published var targetAudience: AttributeSet = AttributeSet(
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
            Attribute(name: "Genral public")
        ],
        intro: "You must talk to: "
    )
    
    func check(_ element: String, with title: String) -> String {
        
        guard element != "" else{
            return ""
        }
        
        return """
        ### \(title)
        \(element)
        """
    }
    
    func checkAttributes() -> String {
        
        var att = ""
        
        if !personas.listOfActive.isEmpty {
            att.append(personas.listOfActiveDescription())
            att.append("\n")
        }
        
        if !voiceTone.listOfActive.isEmpty {
            att.append(voiceTone.listOfActiveDescription())
            att.append("\n")
        }
        
        if !writingStyle.listOfActive.isEmpty {
            att.append(writingStyle.listOfActiveDescription())
            att.append("\n")
        }
        
        if !targetAudience.listOfActive.isEmpty {
            att.append(targetAudience.listOfActiveDescription())
            att.append("\n")
        }
        
        return att
    }
    
    func generatePrompt() -> String {
        
        return """
        \(check(task, with: "Task Definition"))
        \(check(context, with: "Context"))
        \(check(specificInput, with: "Specific Input"))
        \(check(inputRequisites, with: "Output Requisites"))
        \(check(inputRequisites, with: "Output Requisites"))
        \(checkAttributes())
        """
    }
}
