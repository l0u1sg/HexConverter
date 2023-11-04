//
//  UtilsFunctions.swift
//  BinaryConverter
//
//  Created by Louis Gallet on 04/11/2023.
//

import Foundation

extension BinaryInteger {
    var binaryDescription: String {
        /// Convert a given number to it's binary representation
        /// source: https://stackoverflow.com/questions/26181221/how-to-convert-a-decimal-number-to-binary-in-swift
        var binaryString = ""
        var internalNumber = self
        var counter = 0
        
        for _ in (1...self.bitWidth) {
            binaryString.insert(contentsOf: "\(internalNumber & 1)", at: binaryString.startIndex)
            internalNumber >>= 1
            counter += 1
            if counter % 4 == 0 {
                binaryString.insert(contentsOf: " ", at: binaryString.startIndex)
            }
        }
        return binaryString
    }
}
