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
                
                // TODO: TextEditor Style Modifier
                
                Section(header: Text("### Task")) {
                    TextEditor(text: $prompt.task)
                        .foregroundColor(Color.gray)
                        .font(customFont)
                }
                Section(header: Text("### Context")) {
                    TextEditor(text: $prompt.context)
                        .foregroundColor(Color.gray)
                        .font(customFont)
                }
                Section(header: Text("### Specific Input"), footer: Text("Include concrete data or details for the AI to use in formulating or refining its response.")) {
                    TextEditor(text: $prompt.specificInput)
                        .foregroundColor(Color.gray)
                        .font(customFont)
                }
                Section(header: Text("### Output requisites"), footer: Text("Specifies size, length and other details.")) {
                    TextEditor(text: $prompt.inputRequisites)
                        .foregroundColor(Color.gray)
                        .font(customFont)
                }
                
                // TODO: Stylize the button
                
                Button {
                    print(prompt.generatePrompt())
                } label: {
                    HStack{
                        Text("GENERATE THE PROMPT")
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
