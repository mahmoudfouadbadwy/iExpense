//
//  AddView.swift
//  iExpense
//
//  Created by Mahmoud Fouad on 7/3/21.
//

import SwiftUI

struct AddView: View {
    
    @State private var name = ""
    @State private var type = ExpenseType.personal
    @State private var amount = ""
    @ObservedObject var expenses: Expenses
    
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(ExpenseType.allCases, id: \.self) {
                        Text($0.text)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add new expense")
            .navigationBarItems(trailing:
                                    Button("Save") {
                                        if let actualAmount = Int(self.amount) {
                                            let item = ExpenseItem(name: self.name,
                                                                   type: self.type.text,
                                                                   amount: actualAmount)
                                            self.expenses.items.append(item)
                                            self.dismissView()
                                        }
                                    }
            )
        }
    }
    
    
    private func dismissView() {
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
