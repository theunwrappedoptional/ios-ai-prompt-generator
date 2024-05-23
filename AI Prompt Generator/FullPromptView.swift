//
//  FullPromptView.swift
//  AI Prompt Generator
//
//  Created by Manhattan on 23/05/24.
//

import SwiftUI

struct FullPromptView: View {
    
    //TODO: Complete the body layout
    
    var fullPrompt: String
    
    var body: some View {
        NavigationStack{
            Text(fullPrompt)
        }
        
    }
}

#Preview {
    FullPromptView(fullPrompt: "Your Full Prompt")
}
