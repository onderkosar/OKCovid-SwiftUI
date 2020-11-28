//
//  DataType+Ext.swift
//  OKCovid SwiftUI
//
//  Created by Önder Koşar on 23.10.2020.
//

import Foundation

extension Int {
    func numberFormat() -> String {
        let formatter                       = NumberFormatter()
        
        formatter.numberStyle               = .decimal
        formatter.minimumFractionDigits     = 0
        formatter.groupingSeparator         = "."
        
        return formatter.string(from: NSNumber(value: self))!
    }
}

extension String {
    func replaceSpace(with: String) -> String {
        let strWithoutSpace = self.replacingOccurrences(of: " ", with: "\(with)")
        
        return strWithoutSpace
    }
}

extension Date {
    func convertToMonthYearFormat() -> String {
        let dateFormatter           = DateFormatter()
        dateFormatter.dateFormat    = "MMM d"
        
        return dateFormatter.string(from: self)
    }
}

extension Double {
    func rounded(by places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    func getDateFromTimeStamp() -> String {
        let dateFromServer  = NSDate(timeIntervalSince1970: self)
        let dateFormatter   = DateFormatter()
        
        dateFormatter.doesRelativeDateFormatting = true
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .short
        
        let string = dateFormatter.string(from: dateFromServer as Date)
        
        
        return string
    }
}
