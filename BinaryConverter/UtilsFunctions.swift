//
//  UtilsFunctions.swift
//  BinaryConverter
//
//  Created by Louis Gallet on 04/11/2023.
//

import Foundation

/// Convert a given number to its binary form
/// - Parameter decimalString: Your number in base10 in String format
/// - Returns: Return the number in base2 in String format or return "Invalid Input" if the input is not valid
func convertToBinary(_ decimalString: String) -> String {
    if let decimal = Int(decimalString) {
        return String(decimal, radix: 2)
    } else {
        return "Invalid Input"
    }
}

/// Convert a given number to its hexadeciam form
/// - Parameter decimalString: Your number in base10 in String format
/// - Returns: Return the number in base16 in String format or return "Invalid Input" if the input is not valid
func convertToHex(_ decimalString: String) -> String {
    if let number = Int(decimalString) {
        let hexString = String(number, radix: 16)
        return hexString.uppercased()
    } else {
        return "Invalid Input"
    }
}

/// Converts a number from the source base to the destination base
/// - Parameters:
///   - decimalString: The number that you want to convert
///   - fromBase: The base of the number that you want to convert
///   - toBase: The destination base
/// - Returns: Return the number in toBase base or return "Invalid Input" if the input is not valid
func convertFromAnyBaseToAnyBase(_ decimalString: String, fromBase: Int, toBase: Int) -> String {
    if let number = Int(decimalString, radix: fromBase) {
        return String(number, radix: toBase)
    } else {
        return "Invalid Input"
    }
}
