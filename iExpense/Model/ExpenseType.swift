//
//  ExpenseType.swift
//  iExpense
//
//  Created by Mahmoud Fouad on 7/19/21.
//

import Foundation

enum ExpenseType: Int, CaseIterable {
    case personal = 0
    case business = 1
    
    init(type: Int) {
    
        switch type {
        case 0:
            self = .personal
        case 1:
            self = .business
        default:
            self = .personal
        }
    }
    
    var text: String {
        switch self {
        case .personal:
            return  "Personal"
        case .business:
            return "Business"
        }
    }
    
    
}
