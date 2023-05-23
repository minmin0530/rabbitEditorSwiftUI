//
//  ContentView.swift
//  rabbitEditorSwiftUI
//
//  Created by 泉芳樹 on 2023/05/19.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    var body: some View {
        VStack {
            Spacer().frame(height: 100)
            
            TextEditor(text: $name)
                .fontWeight(.regular)
                .padding(.leading, 0.0)
                .frame(width: 206)
                .font( .system(size: 11.2))
                .lineSpacing( 10.0)
                
            Text(getAttributedString(name))
                .fontWeight(.regular)
                .multilineTextAlignment(.leading)
                .padding(.top, -216.0)
                .padding(.leading, 2.0)
                .frame(width: 200, height: 200, alignment: .leading)
                .font(.system(size: 11.2))
                .lineSpacing( 10.0)

            Spacer()
        }
    }
    
    func getAttributedString(_ str: String) -> AttributedString {
        
        var attributedString = AttributedString(str)

//        attributedString.font = .system(size: 11.2)

        if let range = attributedString.range(of: "class") {
            attributedString[range].foregroundColor = NSColor(red: 1.0, green: 0.5, blue: 0.8, alpha: 1.0)  // AttributeScopes.SwiftUIAttributes.ForegroundColorAttribute.Value.
        }
        if let range = attributedString.range(of: "var") {
            attributedString[range].foregroundColor = .red
//            attributedString[range].font = .system(size: 17, weight: .bold)
        }
        if let range = attributedString.range(of: "func") {
            attributedString[range].foregroundColor = .blue
//            attributedString[range].font = .system(size: 17, weight: .bold)
        }
        if let range = attributedString.range(of: "//") {
            attributedString[range].foregroundColor = .green
//            attributedString[range].font = .system(size: 17, weight: .bold)
        }

        return attributedString
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
