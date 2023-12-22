//
//  ContentView.swift
//  AttributeScopesConversion
//
//  Created by Jinwoo Kim on 12/20/23.
//

import SwiftUI
import UIKit
import Target

struct ContentView: View {
    var body: some View {
        Color.clear
            .onAppear {
                var container: AttributeContainer = try! .init(
                    [
                        .font: UIFont.systemFont(ofSize: 30.0),
                        .foregroundColor: UIColor.red,
                    ],
                    including: \.uiKit
                )
                
                container.swiftUI.foregroundColor = .red
                container.swiftUI.kern = 30.0
                
                /*
                 (label: Optional("storage"), value: {
                     NSColor = UIExtendedSRGBColorSpace 1 0 0 1
                     NSFont = <UICTFont: 0x10270a7d0> font-family: ".SFUI-Regular"; font-weight: normal; font-style: normal; font-size: 30.00pt
                     SwiftUI.ForegroundColor = red
                     SwiftUI.Kern = 30.0
                 })
                 */
                Mirror(reflecting: container)
                    .children
                    .forEach { child in
                        print(child)
                    }
                
                var attributedString: AttributedString = .init(stringLiteral: "Hello World!")
                attributedString.foregroundColor = .red
                
                // red
                print(attributedString.foregroundColor ?? "nil")
                
                // nil
                Target.printForegroundColor(attributedString: attributedString)
            }
    }
}
