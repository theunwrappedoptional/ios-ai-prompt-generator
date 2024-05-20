//
//  PersonaView.swift
//  AI Prompt Generator
//
//  Created by Manhattan on 20/05/24.
//

import SwiftUI

struct ToggleAttributesView: View {
    
    // TODO: Add description
    // TODO: Add variable number of allowed items
    // TODO: Add preview of message with selected options
    
    var title: String
    @State var disabled = false
    @Binding var attributes: [Attribute]
    
    var n: Int {
        attributes.filter { a in
            a.isActive
        }.count
    }
    
    var body: some View {
        NavigationStack {
            Section{
                List($attributes) { $persona in
                    Toggle(isOn: $persona.isActive, label: {
                        Text("\(persona.name)")
                    })
                    .disabled(persona.isActive ? false : disabled)
                }
            }
            .navigationTitle(title)
        }
        .onChange(of: attributes) { oldValue, newValue in
            if n >= 3 {
                disabled = true
            } else {
                disabled = false
            }
        }
    }
}

#Preview {
    
    ToggleAttributesView(title: "Attributes", attributes: .constant(Prompt().personas))
}
