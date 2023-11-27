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
    case Income
    case Taxes
    case Utilities
    case Household
    case Insurance
    case Medical
    case Subscriptions
    case ChildCare
    case PetCare
    case Entertainment
    case Deductions
    var id: Self {self}
}
//MARK:    CATEGORY EXTENSION
extension BudgetCategory{
    var title: String {
        switch self {
        case .Transportation:
            return "Transportation Expenses"
        case .Rent:
            return "Rent & Mortgage"
        case .Groceries:
            return "Grocery"
        case .Savings:
            return "Savings and Investments"
        case .Income:
            return "Personal Income"
        case .Taxes:
            return "Taxes"
        case .Utilities:
            return "Utilities"
        case .Household:
            return "Household Expenses"
        case .Insurance:
            return "Insurance Expenses"
        case .Medical:
            return "Medical Expenses"
        case .Subscriptions:
            return "Recurring Subscriptions"
        case .ChildCare:
            return "Child Care"
        case .PetCare:
            return "Pet Care"
        case .Entertainment:
            return "Entertainment"
        case .Deductions:
            return "Deductions & Garnishments"
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
