//
//  FullPromptView.swift
//  AI Prompt Generator
//
//  Created by Manhattan on 23/05/24.
//

import SwiftUI

struct FullPromptView: View {
    
    //TODO: Complete the body layout
    //TODO: Create "Copy Prompt" button
    
    var fullPrompt: String
    
    var body: some View {
        NavigationStack{
            ScrollView {
                Text(fullPrompt)
                    .textSelection(.enabled)
            }
            .padding()
            
        }
        
    }
}

#Preview {
    FullPromptView(fullPrompt: "Your Full Prompt")
}
