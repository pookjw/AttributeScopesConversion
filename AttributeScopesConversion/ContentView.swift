//
//  ContentView.swift
//  AttributeScopesConversion
//
//  Created by Jinwoo Kim on 12/20/23.
//

import SwiftUI
import Target

struct ContentView: View {
    var body: some View {
        Color.clear
            .onAppear {
                var attributedString: AttributedString = .init(stringLiteral: "Hello World!")
                attributedString.foregroundColor = .red
                
                // red
                print(attributedString.foregroundColor ?? "nil")
                
                // nil
                Target.printForegroundColor(attributedString: attributedString)
            }
    }
}
