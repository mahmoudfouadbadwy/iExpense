//
//  ContentView.swift
//  iExpense
//
//  Created by Mahmoud Fouad on 7/3/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var shwoingAddExpense = false
    @ObservedObject var expenses = Expenses()
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                            Text(item.type)
                        }
                        Spacer()
                        Text("\(item.amount)")
                    }
                }
                .onDelete(perform: removeItems(at:))
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(leading:  EditButton(),
                                trailing:
                                    Button(action: {
                                        self.shwoingAddExpense = true
                                    }) {
                                        Image(systemName: "plus")
                                    }
            )
        }
        .sheet(isPresented: $shwoingAddExpense) {
            AddView(expenses: self.expenses)
        }
    }
    
    
    private func removeItems(at offsets: IndexSet) {
        self.expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
