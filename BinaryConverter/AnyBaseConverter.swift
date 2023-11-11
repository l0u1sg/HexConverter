//
//  AnyBaseConverter.swift
//  BinaryConverter
//
//  Created by Louis Gallet on 06/11/2023.
//

import SwiftUI

struct AnyBaseConverter: View {
    @State private var sourceBasedNumber: String = ""
    @State private var basedNumber: String = ""
    @State private var destinationBasedNumber: String = ""
    @State private var resultConversion: String = ""
    var body: some View {
        Form {
            Section(header: Text("Source base")) {
                TextField("Enter the source base for the number", text: $sourceBasedNumber)
                    .keyboardType(.numberPad)
            }
            Section(header: Text("Destination base")) {
                TextField("Enter the arrival base",
                          text: $destinationBasedNumber)
                .keyboardType(.numberPad)
            }
            
            Section(header: Text("Number to convert")) {
                TextField("Enter the number that you want to convert",
                          text: $basedNumber)
                .keyboardType(.numberPad)
            }

            Section(header: Text("Result")) {
                Text("Your number in base \(destinationBasedNumber): \(resultConversion)")
                    .contextMenu(ContextMenu(menuItems: {
                        Button(action: {
                            let pasteboard = UIPasteboard.general
                            pasteboard.string = resultConversion
                        }, label: {
                            Label("Copy value", systemImage: "doc.on.doc")
                        })
                    }))
            }
            Button("Dismiss Keyboard") {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        }
        .onChange(of: basedNumber) { newValue in
            if (!(destinationBasedNumber == "" || sourceBasedNumber == "")) {
                resultConversion = convertFromAnyBaseToAnyBase(basedNumber, fromBase: Int(sourceBasedNumber)!, toBase: Int(destinationBasedNumber) ?? 0)
            }

        }

    }
}

#Preview {
    AnyBaseConverter()
}
