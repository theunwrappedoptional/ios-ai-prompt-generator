//
//  TestView.swift
//  AI Prompt Generator
//
//  Created by Manhattan on 20/05/24.
//

import SwiftUI

struct TestView: View {
    @State private var notes = ""
    @State private var bio = ""
    
    
    var body: some View {
        NavigationStack {
            Form{
//                TextEditor(text: $notes)
//                    .navigationTitle("Notes")
//                    .padding()
                
                TextField("Describe yourself", text: $bio, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(5, reservesSpace: true)
                
//                Text(bio)
                Spacer()
            }
            
        }
        .padding()
    }
}

#Preview {
    TestView()
}
