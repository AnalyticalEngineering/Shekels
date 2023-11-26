//
//  BudgetPicker.swift
//  Shekels
//
//  Created by J. DeWeese on 11/26/23.
//

import SwiftUI



//MARK:   ENUM CATEGORY CASES
enum BudgetCategory: CaseIterable, Identifiable, Hashable{
    case Transportation
    case Rent
    case Groceries
    case Savings
    
    var id: Self {self}
}
//MARK:    CATEGORY EXTENSION
extension BudgetCategory{
    var title: String {
        switch self {
        case .Transportation:
            return "Transportation Expenses"
        case .Rent:
            return "Mortgage & Rent"
        case .Groceries:
            return "Grocery Expenses"
        case .Savings:
            return "Savings & Investments "
        }
    }
}
struct BudgetPicker: View {
    @State var name: BudgetCategory = BudgetCategory.allCases.first!
    
    private let BudgetCategories: [BudgetCategory] = BudgetCategory.allCases
    
    var body: some View {
        //MARK:  CATEGORY PICKER
        HStack {
            Picker("Budget Name:", selection: $name) {
                ForEach(BudgetCategories) { item in
                    Text(item.title)
                        .tag(item)
                }
            }
            .pickerStyle(.menu)
        }
    }
}
#Preview {
    BudgetPicker()
}
