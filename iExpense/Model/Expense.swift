//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Mahmoud Fouad on 7/3/21.
//

import Foundation


class Expenses: ObservableObject {
    
    @Published var items = [ExpenseItem]() {
        didSet {
            saveInDefault(items: items)
        }
    }
    
    init() {
        getFromDefault()
    }
    
    private func getFromDefault() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
            }
        }
    }
    
    private func saveInDefault(items: [ExpenseItem]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(items) {
            UserDefaults.standard.set(encoded, forKey: "Items")
        }
    }
}

struct ExpenseItem: Identifiable, Codable {
    
    var id = UUID()
    let name: String
    let type: String
    let amount: Int
}
