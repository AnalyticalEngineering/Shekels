//
//  ReminderService.swift
//  Shekels
//
//  Created by J. DeWeese on 11/24/23.
//

import Foundation
import CoreData
import UIKit


class ReminderService {
    
    static var viewContext: NSManagedObjectContext {
        CoreDataProvider.shared.persistentContainer.viewContext
    }
    
    static func save() throws {
        try viewContext.save()
    }
    
    static func saveBudgetList(_ name: String,  icon: String,  _ color: UIColor) throws {
        let budgetList = BudgetList(context: viewContext)
        budgetList.name = name
        budgetList.icon = icon
        budgetList.color = color
        try save()
    }
    
    static func updateReminder(reminder: Reminder, editConfig: ReminderEditConfig) throws -> Bool {
        
        let reminderToUpdate = reminder
        reminderToUpdate.isCompleted = editConfig.isCompleted
        reminderToUpdate.title = editConfig.title
        reminderToUpdate.note = editConfig.note
        reminderToUpdate.reminderDate = editConfig.hasDate ? editConfig.reminderDate: nil
        reminderToUpdate.reminderTime = editConfig.hasTime ? editConfig.reminderTime: nil
        
        try save()
        return true
    }
    //MARK:  DELETE REMINDER
    static func deleteReminder(_ reminder: Reminder) throws {
        viewContext.delete(reminder)
        try save()
    }
   
    
    static func getRemindersBySearchTerm(_ searchTerm: String) -> NSFetchRequest<Reminder> {
        let request = Reminder.fetchRequest()
        request.sortDescriptors = []
        request.predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchTerm)
        return request
    }
    
    static func saveReminderToBudgetList(budgetList: BudgetList, reminderTitle: String) throws {
        let reminder = Reminder(context: viewContext)
        reminder.title = reminderTitle
        budgetList.addToReminders(reminder)
        try save()
    }
    static func remindersByStatType(statType: ReminderStatType) -> NSFetchRequest<Reminder> {
        
        let request = Reminder.fetchRequest()
        request.sortDescriptors = []
        
        switch statType {
        case .all:
            request.predicate = NSPredicate(format: "isCompleted = false")
        case .today:
            let today = Date()
            let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: today)
            request.predicate = NSPredicate(format: "(reminderDate >= %@) AND (reminderDate < %@)", today as NSDate, tomorrow! as NSDate)
        case .scheduled:
            request.predicate = NSPredicate(format: "(reminderDate != nil OR reminderTime != nil) AND isCompleted = false")
        case .completed:
            request.predicate = NSPredicate(format: "isCompleted = true")
        }
        
        return request
    }


    
    static func getRemindersByList(budgetList: BudgetList) -> NSFetchRequest<Reminder> {
        let request = Reminder.fetchRequest()
        request.sortDescriptors = []
        request.predicate = NSPredicate(format: "list = %@ AND isCompleted = false", budgetList)
        return request
    }
    
}


