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
    
    @State var placeholderString = "###"
    
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
                Section(footer: Text("\(prompt.personas.description)")) {
                    NavigationLink(destination: ToggleAttributesView(attributeSet: $prompt.personas)) {
                        Text("\(prompt.personas.title)")
                    }
                }
                
                //Section "Voice tone"
                Section(footer: Text("\(prompt.voiceTone.description)")) {
                    NavigationLink(destination: ToggleAttributesView(attributeSet: $prompt.voiceTone)) {
                        Text("\(prompt.voiceTone.title)")
                    }
                }
                
                //Section "Writing Style"
                Section(footer: Text("\(prompt.writingStyle.description)")) {
                    NavigationLink(destination: ToggleAttributesView(attributeSet: $prompt.writingStyle)) {
                        Text("\(prompt.writingStyle.title)")
                    }
                }
                
                //Section "Target Audience"
                
                Section(footer: Text("\(prompt.targetAudience.description)")) {
                    NavigationLink(destination: ToggleAttributesView(attributeSet: $prompt.targetAudience)) {
                        Text("\(prompt.targetAudience.title)")
                    }
                }
                
                Section(header: Text("###Limitations and constraints")){
                    TextField("Enter any legal, ethical or privacy restrictions that you must abide by.", text: $prompt.limitations, axis: .vertical)
                        .lineLimit(5, reservesSpace: true)
                }
                
                Section(header: Text("### Success Criteria")){
                    TextField("Describe the criteria that will determine the effectiveness of the provided response.", text: $prompt.successCriteria, axis: .vertical)
                        .lineLimit(5, reservesSpace: true)
                }
                
                // TODO: Stylize the button
                
//                Button {
//                    print(prompt.generatePrompt())
//                } label: {
//                    HStack{
//                        Text("GENERATE THE PROMPT")
//                    }
//                }
                
                Section() {
                    NavigationLink(destination: FullPromptView(fullPrompt: prompt.generatePrompt())) {
                        Text("SEE THE FULL PROMPT")
                    }
                }
                .disabled(prompt.task == "")
//               .buttonStyle(.bordered)
            }
            .navigationTitle("✎ Prompt generator")
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Prompt())
}
