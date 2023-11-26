//
//  SelectListView.swift
//  Shekels
//
//  Created by J. DeWeese on 11/25/23.
//

import SwiftUI

struct SelectListView: View {
    
    @FetchRequest(sortDescriptors: [])
    private var myListsFetchResults: FetchedResults<BudgetList>
    @Binding var selectedList: BudgetList?
    
    var body: some View {
        List(myListsFetchResults) { budgetList in
            HStack {
                HStack {
                    Image(systemName: budgetList.icon)
                        .foregroundColor(Color(budgetList.color))
                    Text(budgetList.name)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .contentShape(Rectangle())
                .onTapGesture {
                    self.selectedList = budgetList
                }
                
                Spacer()
                
                if selectedList == budgetList {
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}

struct SelectListView_Previews: PreviewProvider {
    static var previews: some View {
        SelectListView(selectedList: .constant(PreviewData.budgetList))
            .environment(\.managedObjectContext, CoreDataProvider.shared.persistentContainer.viewContext)
    }
}
