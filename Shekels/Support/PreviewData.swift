//
//  PreviewData.swift
//  Shekels
//
//  Created by J. DeWeese on 11/24/23.
//

import Foundation
import CoreData

class PreviewData {
    
    static var reminder: Reminder {
        let viewContext = CoreDataProvider.shared.persistentContainer.viewContext
        let request = Reminder.fetchRequest()
        return (try? viewContext.fetch(request).first) ?? Reminder(context: viewContext)
    }
    static var budgetList: BudgetList {
        let viewContext = CoreDataProvider.shared.persistentContainer.viewContext
        let request = BudgetList.fetchRequest()
        return (try? viewContext.fetch(request).first) ?? BudgetList()
    }
    
}
