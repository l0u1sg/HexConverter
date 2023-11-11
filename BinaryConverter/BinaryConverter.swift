//
//  BinaryConverter.swift
//  BinaryConverter
//
//  Created by Louis Gallet on 04/11/2023.
//

import SwiftUI

struct BinaryConverter: View {
    @State private var decimalNumber: String = ""
    @State private var binaryNumber: String = ""
    var body: some View {
        Form {
            Section(header: Text("Base 10")) {
                TextField("Enter the base 10 number here", text: $decimalNumber)
                    .keyboardType(.numberPad)
            }
            Section(header: Text("Base 2")) {
                Text("Your number in base 2: \(binaryNumber)")
                    .contextMenu(ContextMenu(menuItems: {
                        Button(action: {
                            let pasteboard = UIPasteboard.general
                            pasteboard.string = binaryNumber
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
            binaryNumber = convertToBinary(newValue)
        }
    }
}

#Preview {
    BinaryConverter()
}
