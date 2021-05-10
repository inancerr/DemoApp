//
//  File.swift
//  
//
//  Created by İnanç Er on 10.05.2021.
//

import class Foundation.NumberFormatter

public extension Double {
    private static let priceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.currencyDecimalSeparator = ","
        formatter.currencySymbol = "TL"
        formatter.positiveFormat = "0 ¤"
        formatter.numberStyle = .currency
        return formatter
    }()
    
    var formattedAsPrice: String {
        return Double.priceFormatter.string(for: self) ?? ""
    }
}
