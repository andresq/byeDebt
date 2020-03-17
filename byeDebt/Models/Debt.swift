//
//  Debt.swift
//  byeDebt
//
//  Created by Andres Quintero on 2/21/20.
//  Copyright © 2020 Andres Quintero. All rights reserved.
//

import Foundation

class Debt: Comparable {
    
    
    var name: String
    var balance: Double
    var minPayment: Double
    var rate: Double
    var dailyRate: Double
    
    required init(name: String, balance: Double, minPayment: Double, rate: Double) {
        self.name = name
        self.balance = balance
        self.minPayment = minPayment
        self.rate = rate
        self.dailyRate = rate/365
    }
    
    required init() {
        self.name = ""
        self.balance = 0.0
        self.minPayment = 0.0
        self.rate = 0.0
        self.dailyRate = rate/365
    }
    
    func calculateDailyRate(rate: Double) -> Double {
        // Change rate calculation
        return 365/rate
    }
    
    func calculateInterestCharge(rate: Double) -> Double {
        // Change rate calculation
        return dailyRate * balance * 30
    }
    
    
    // MARK: Static Functions
    // Double to proper currenct String
    // eg 10.0 returns $10.00
    static func getStringCurrency(of doubleValue: Double) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        return  currencyFormatter.string(from: NSNumber(value: doubleValue))!
    }
    static func stringToDouble(_ string: String) -> Double? {
        let input = string
        let doubleValue = Double(input)
        return doubleValue
    }
    
    // Check if Name is max length 27 or empty
    static func checkNameString(of string: String?) -> String {
        if let string = string {
            if (string.count == 0) {
                return "Credit Card"
            } else if(string.count <= 27){
                return string
            } else {
                let startingIndex = string.index(string.startIndex, offsetBy: 0)
                let endIndex = string.index(string.startIndex, offsetBy: 26)
                let newString = String(string[startingIndex...endIndex])
                return newString
            }
        } else{
            return "Credit Card"
        }
    }
    
    // Check if string contains other than decimalPad inputs
    // Return a float
//    static func checkBalanceString(of string: String?) -> Float {
//        if let string = string {
//            if(string.contains(StringProtocol())
//
//
//
//
//
//        } else {
//            return 00.00
//        }
//    }
//    static func check rateString()
    
    // MARK: Comparable Protocols
    //       wrt to rate
    static func < (lhs: Debt, rhs: Debt) -> Bool {
        return lhs.rate < rhs.rate //Highest rate in first position
    }
    
    static func == (lhs: Debt, rhs: Debt) -> Bool {
        return lhs.name == rhs.name
    }
}
