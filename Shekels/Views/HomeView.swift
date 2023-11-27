//
//  HomeView.swift
//  Shekels
//
//  Created by J. DeWeese on 11/24/23.
//

import SwiftUI

struct HomeView: View {
    //MARK:  PROPERTIES
    @FetchRequest(sortDescriptors: [])
    private var budgetListResults: FetchedResults<BudgetList>
    
    @FetchRequest(sortDescriptors: [])
    private var searchResults: FetchedResults<Reminder>
    
    @FetchRequest(fetchRequest: ReminderService.remindersByStatType(statType: .today))
    private var todayResults: FetchedResults<Reminder>
    
    @FetchRequest(fetchRequest: ReminderService.remindersByStatType(statType: .scheduled))
    private var scheduledResults: FetchedResults<Reminder>
    
    @FetchRequest(fetchRequest: ReminderService.remindersByStatType(statType: .all))
    private var allResults: FetchedResults<Reminder>
    
    @FetchRequest(fetchRequest: ReminderService.remindersByStatType(statType: .completed))
    private var completedResults: FetchedResults<Reminder>
    
    
    @State private var isPresented: Bool = false
    @State private var search: String = ""
    @State private var searching: Bool = false
    
    private var reminderStatsBuilder = ReminderStatsBuilder()
    @State private var reminderStatsValues = ReminderStatsValues()
    
    //MARK:  VIEW
    var body: some View {
        
        NavigationStack {
            Spacer()
            VStack {
                //MARK:  BILL COUNT STAT BOARD
                Text("Bill Count")
                    .offset(y: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                    .offset(x: -120)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.primary)
                    .padding(.horizontal)
                //    MARK:  Due Today / Scheduled Links
                HStack(spacing:  4) {
                    
                    NavigationLink {
                        ReminderListView()
                    } label: {
                        ReminderStatView(icon: "calendar", title: "Due Now", count: reminderStatsValues.todayCount, iconColor: .green)
                        
                    } .background(.gray)
                        .padding([.leading, .trailing], 4)
                        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    
                    NavigationLink {
                        ReminderListView()
                    } label: {
                        ReminderStatView(icon: "calendar.circle.fill", title: "Upcoming", count: reminderStatsValues.scheduledCount, iconColor: .red)
                    }
                    .background(.gray)
                    .padding([.leading, .trailing], 4)
                    .clipShape(RoundedRectangle(cornerRadius: 15.0))
                }
                .padding([.leading, .trailing], 10)
                VStack{
                    ScrollView{
                        Text("Budgets")
                            .offset(y: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                            .offset(x: -120)
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundStyle(.primary)
                            .padding(.horizontal)
                        
                        //MARK:  BUDGET LIST VIEW
                        BudgetListView( budgetList: budgetListResults)
                    }  .listStyle(.plain)
                }
            }.navigationTitle("Budgets & Bills")
                .toolbar{
                    //MARK:  TOOL BAR
                    ToolbarItem( placement: .topBarTrailing) {
                        Button {
                            isPresented = true
                        } label: {
                            ZStack{
                                Circle()
                                Image(systemName: "plus")
                                    .foregroundStyle(.white)
                            }
                            .font(.title3)
                            .fontWeight(.bold)
                            .frame(width: 30, height: 30)
                        }
                    }
                }
                .toolbar{
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            HapticManager.notification(type: .success)
                            print("menu")
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .fontDesign(.serif)
                                .font(.title3)
                                .fontWeight(.bold)
                        }
                    }
                }
        }
        .searchable(text: $search)
        .sheet(isPresented: $isPresented) {
            NavigationView {
                AddNewBudgetListView { name, icon, color in
                    
                    do {
                        try ReminderService.saveBudgetList(name, icon: icon, color )
                    } catch {
                        print(error)
                    }
                }
                
            }
            .presentationDetents([
                .height(300),   // 100 points
                .fraction(0.4), // 20% of the available height
                .medium,        // Takes up about half the screen
                .large])        // The previously default sheet size
            .edgesIgnoringSafeArea(.all)
        }
    
        .onChange(of: search, perform: { searchTerm in
            searching = !searchTerm.isEmpty ? true: false
            searchResults.nsPredicate = ReminderService.getRemindersBySearchTerm(search).predicate
        })
        .overlay(alignment: .center, content: {
            ReminderListView()
                .opacity(searching ? 1.0: 0.0)
        })
        .onAppear {
            reminderStatsValues = reminderStatsBuilder.build(budgetListResults: budgetListResults)
        }
        .padding()
        .navigationTitle("Budgets & Bills")
    }
    }

    
 struct HomeView_Previews: PreviewProvider {
     static var previews: some View {
         HomeView()
             .environment(\.managedObjectContext, CoreDataProvider.shared.persistentContainer.viewContext)
     }
 }
