//
//  BudgetListModel.swift
//  Shekels
//
//  Created by J. DeWeese on 11/24/23.
//

import Foundation
import CoreData
import UIKit

extension BudgetList {
   
    @nonobjc public class func fetchRequest() -> NSFetchRequest<BudgetList> {
        return NSFetchRequest<BudgetList>(entityName: "BudgetList")
    }

    @NSManaged public var name: String
    @NSManaged public var icon: String
    @NSManaged public var color: UIColor
    @NSManaged public var reminders: NSSet?
}

extension BudgetList: Identifiable {
    
}

// MARK: Generated accessors for notes
extension BudgetList {
    
    @objc(addRemindersObject:)
    @NSManaged public func addToReminders(_ value: Reminder)

    @objc(removeRemindersObject:)
    @NSManaged public func removeFromReminders(_ value: Reminder)

    @objc(addReminders:)
    @NSManaged public func addToReminders(_ values: NSSet)

    @objc(removeReminders:)
    @NSManaged public func removeFromReminders(_ values: NSSet)}

    

