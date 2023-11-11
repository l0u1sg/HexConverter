//
//  HexaConverter.swift
//  BinaryConverter
//
//  Created by Louis Gallet on 04/11/2023.
//

import SwiftUI

struct HexaConverter: View {
    @State private var decimalNumber: String = ""
    @State private var HexadecimalNumber: String = ""
    var body: some View {
        Form {
            Section(header: Text("Base 10")) {
                TextField("Enter the base 10 number here", text: $decimalNumber)
                    .keyboardType(.numberPad)
            }
            Section(header: Text("Base 16")) {
                Text("Your number in base 16: \(HexadecimalNumber)")
                    .contextMenu(ContextMenu(menuItems: {
                        Button(action: {
                            let pasteboard = UIPasteboard.general
                            pasteboard.string = HexadecimalNumber
                            
                        }, label: {
                            Label("Copy value", systemImage: "doc.on.doc")
                        })
                    }))
            }
            Button("Dismiss Keyboard") {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        }
        .onChange(of: decimalNumber) { newValue in
            HexadecimalNumber = convertToHex(newValue)
        }

    }
    
}

#Preview {
    HexaConverter()
}
