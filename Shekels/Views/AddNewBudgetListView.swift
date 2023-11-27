//
//  AddNewBudgetListView.swift
//  Shekels
//
//  Created by J. DeWeese on 11/24/23.
//

import SwiftUI
import CoreData

struct AddNewBudgetListView: View {
    //MARK:  PROPERTIES
    @Environment(\.dismiss) private var dismiss
    
    @State private var totAmount = 0.0
    @State private var name: String = ""
    @State private var selectedIcon: String = "figure.run.circle.fill"
    @State private var selectedColor: Color = .orange
    
    let onSave: (String,String, UIColor) -> Void
    
    
    
    var body: some View {
                
                Form{
                    BudgetPicker()
                        .padding(.horizontal)
                   
                  
                    IconPickerView(selectedIcon: $selectedIcon, selectedColor: $selectedColor)
                       
                     
                    TextField("Enter total amount for budget", value: $totAmount, format: .currency(code:Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(.roundedBorder)
                        .font(.system(size: 24))
                        .padding(.horizontal)
                        .foregroundStyle(.secondary)

                }
                .font(.headline)
                //TODO:  Make this into a form
        
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("New Budget")
                            .font(.headline)
                    }
                    //MARK:  CANCEL
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            HapticManager.notification(type: .success)
                            dismiss()
                        }
                        .fontDesign(.serif)
                        .font(.title3)
                        .fontWeight(.bold)
                        .tint(.red)
                    }
                    //MARK:  SAVE
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Save") {
                            HapticManager.notification(type: .success)
                            // save the list
                            onSave(name, selectedIcon, UIColor(selectedColor))
                            dismiss()
                        }
                        .fontDesign(.serif)
                        .font(.title3)
                        .fontWeight(.bold)
                        .tint(.green)
                    }
                }
        }
    }

struct AddNewListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddNewBudgetListView(onSave: { (_, _, _) in })
        }
    }
}
