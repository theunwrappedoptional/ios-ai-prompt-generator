//
//  ContentView.swift
//  AI Prompt Generator
//
//  Created by Manhattan on 18/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var prompt: Prompt
    var customFont = Font.system(.body)
        
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("### Task")){
                    TextField("Specify the action or task that the AI should perform", text: $prompt.task, axis: .vertical)
                        .lineLimit(5, reservesSpace: true)
                }
                
                Section(header: Text("### Context")){
                    TextField("Provide complementary information that helps structure the request in the appropriate context", text: $prompt.context, axis: .vertical)
                        .lineLimit(5, reservesSpace: true)
                }
                
                Section(header: Text("### Specific Input")){
                    TextField("Include concrete data or details for the AI to use in formulating or refining its response.", text: $prompt.specificInput, axis: .vertical)
                        .lineLimit(5, reservesSpace: true)
                }
                
                Section(header: Text("### Output requisites")){
                    TextField("Specifies size, length and other details.", text: $prompt.inputRequisites, axis: .vertical)
                        .lineLimit(5, reservesSpace: true)
                }
                
                // Section "Personas"
                AttributesFormSection(set: $prompt.attributesSets.personas)
                
                //Section "Voice tone"
                AttributesFormSection(set: $prompt.attributesSets.voiceTone)
                
                //Section "Writing Style"
                AttributesFormSection(set: $prompt.attributesSets.writingStyle)
               
                //Section "Target Audience"
                AttributesFormSection(set: $prompt.attributesSets.targetAudience)
                
                Section(header: Text("###Limitations and constraints")){
                    TextField("Enter any legal, ethical or privacy restrictions that you must abide by.", text: $prompt.limitations, axis: .vertical)
                        .lineLimit(5, reservesSpace: true)
                }
                
                Section(header: Text("### Success Criteria")){
                    TextField("Describe the criteria that will determine the effectiveness of the provided response.", text: $prompt.successCriteria, axis: .vertical)
                        .lineLimit(5, reservesSpace: true)
                }
                
                // TODO: Stylize the button
                
                Section() {
                    NavigationLink(destination: FullPromptView(fullPrompt: prompt.generatePrompt())) {
                        Text("SEE THE FULL PROMPT")
                    }
                }
                .disabled(prompt.task == "")
            }
            .navigationTitle("✎ Prompt generator")
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Prompt())
}
