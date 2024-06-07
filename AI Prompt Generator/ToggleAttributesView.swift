//
//  PersonaView.swift
//  AI Prompt Generator
//
//  Created by Manhattan on 20/05/24.
//

import SwiftUI

struct ToggleAttributesView: View {
    
    // TODO: Verify Toolbar button
    // TODO: "Add attribute" option???
    
    @State var promptPreview = ""
    @State var disabled = false
    @Binding var attributesSet: AttributeSet
    
    var body: some View {
        
        NavigationStack{
            Form{
                Section(content: {
                    List($attributesSet.list) { $persona in
                        Toggle(isOn: $persona.isActive, label: {
                            Text("\(persona.name)")
                        })
                        .disabled(persona.isActive ? false : disabled)
                    }
                }, header: {
                    Text(attributesSet.description)
                        .minimumScaleFactor(0.5)
                }, footer: {
                    HStack(alignment: .center){
                        Spacer()
                        Text("You've reached the maximum number of options")
                            .foregroundStyle(.red)
                        Spacer()
                    }
                    .opacity(attributesSet.listOfActive.count == attributesSet.numberOfAllowedAttributes ? 1 : 0)
                })
                .textCase(nil)
                
                Section(header: Text("Prompt Preview")){
                    Text(promptPreview)
                }
            }
            .navigationTitle(attributesSet.title)
        }
        .onChange(of: attributesSet.list) { _, _ in
            if attributesSet.listOfActive.count >= attributesSet.numberOfAllowedAttributes {
                disabled = true
            } else {
                disabled = false
            }
            promptPreview = attributesSet.listOfActiveDescription()
        }
        .onAppear(){
            promptPreview = attributesSet.listOfActiveDescription()
        }
    }
}

#Preview {
    
    ToggleAttributesView(attributesSet: .constant(Prompt().attributesSets.personas))
}
