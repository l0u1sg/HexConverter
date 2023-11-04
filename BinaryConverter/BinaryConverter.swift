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
            }
        }
//        .onChange(of: decimalNumber) {
//            [decimalNumber] newValue in
//            if newValue != decimalNumber {
//                binaryNumber = convertToBinary(newValue)
//            }
//        }
        .onChange(of: decimalNumber, initial: true, {
            oldDecimalNumber, NewDecimalNumber in
            if (oldDecimalNumber != NewDecimalNumber) {
                binaryNumber = convertToBinary(NewDecimalNumber)
            }
        })
    }
    func convertToBinary(_ decimalString: String) -> String {
        if let decimal = Int(decimalString) {
            // Perform your base conversion logic here
            return String(decimal, radix: 2)
        } else {
            return "Invalid Input"
        }
    }
}

#Preview {
    BinaryConverter()
}
