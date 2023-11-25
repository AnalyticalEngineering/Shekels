//
//  BudgetListView.swift
//  Shekels
//
//  Created by J. DeWeese on 11/24/23.
//

import SwiftUI

struct BudgetListView: View {
    //MARK:  PROPERTIES
    let budgetList:  FetchedResults<BudgetList>
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            
            if budgetList.isEmpty {
                
                ContentUnavailableView{
                    Label("No Budgets created.\nPress + Button and make a plan.", systemImage: "tray.fill")
                        .foregroundStyle(.primary)
                        .font(.title3)
                        .fontWeight(.bold)
                }
                .offset(y: 125.0)
                
            } else {
               
                    ForEach(budgetList) { budgetList in
                        NavigationLink(value: budgetList){
                            VStack {
                                BudgetCard()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding([.leading], 5)
                                    .font(.title3)
                                
                            }
                        }
                        .listRowBackground(colorScheme == .dark ? .gray: Color.offWhite)
                    }
                    .scrollContentBackground(.hidden)
                    .navigationDestination(for: BudgetList.self) { budgetList in
                        BudgetListDetailView()
                            .navigationTitle(budgetList.name)
                    }
                }
            }
        }
    }
#Preview {
    HomeView()
}
