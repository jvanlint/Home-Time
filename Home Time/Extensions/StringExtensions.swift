//
//  StringExtensions.swift
//  HomeTime
//
//  Created by Jason van Lint on 7/2/21.
//

import Foundation

extension String {


    /// Converts UNIX/POSIX style date string into a Swift Date type.
    /// - Returns: A translated Swift Date object.
    func dateFromDotNetFormattedDateString() -> Date! {
        guard let startRange = self.range(of: "("), let endRange = self.range(of: "+") else { return nil }
        let lowBound = self.index(startRange.lowerBound, offsetBy: 1)
        let range = lowBound..<endRange.lowerBound
        let dateAsString = self[range]
        guard let time = Double(dateAsString) else { return nil }
        let unixTimeInterval = time / 1000
        return Date(timeIntervalSince1970: unixTimeInterval)
    }
}
