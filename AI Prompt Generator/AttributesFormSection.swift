//
//  SwiftUIView.swift
//  AI Prompt Generator
//
//  Created by Manhattan on 07/06/24.
//

import SwiftUI

struct AttributesFormSection: View {
    
    @Binding var set:AttributeSet
    
    var body: some View {
        Section(footer:
            VStack(alignment: .leading){
                Text(set.description)
                if set.listOfActive.count != 0 {
                    Text(set.listOfActiveDescriptionInForm())
                    .foregroundStyle(.black)
                }
            }) {
            NavigationLink(destination: ToggleAttributesView(attributesSet: $set)) {
                Text("\(set.title)")
            }
        }
    }
}

//#Preview {
//    AttributesFormSection()
//}
