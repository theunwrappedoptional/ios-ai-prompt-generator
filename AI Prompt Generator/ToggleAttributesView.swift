//
//  PersonaView.swift
//  AI Prompt Generator
//
//  Created by Manhattan on 20/05/24.
//

import SwiftUI

struct ToggleAttributesView: View {
    
    @State var promptPreview = ""
    @State var disabled = false
    @Binding var attributeSet: AttributeSet
    
    var body: some View {
        
        NavigationStack{
            Form{
                
                Section(content: {
                    List($attributeSet.list) { $persona in
                        Toggle(isOn: $persona.isActive, label: {
                            Text("\(persona.name)")
                        })
                        .disabled(persona.isActive ? false : disabled)
                    }
                }, header: {
                    Text(attributeSet.description)
                }, footer: {
                    HStack(alignment: .center){
                        Spacer()
                        Text("You've reached the maximum number of options")
                            .foregroundStyle(.red)
                        Spacer()
                    }
                    .opacity(attributeSet.listOfActive.count == attributeSet.numberOfAllowedAttributes ? 1 : 0)
                })
                .textCase(nil)
                
                Section(header: Text("Prompt Preview")){
                    Text(promptPreview)
                }
            }
            .navigationTitle(attributeSet.title)
        }
        .onChange(of: attributeSet.list) { _, _ in
            if attributeSet.listOfActive.count >= attributeSet.numberOfAllowedAttributes {
                disabled = true
            } else {
                disabled = false
            }
            
            promptPreview = attributeSet.listOfActiveDescription()
        }
    }
}

#Preview {
    
    ToggleAttributesView(attributeSet: .constant(Prompt().personas))
}
