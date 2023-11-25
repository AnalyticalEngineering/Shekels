//
//  BudgetList+CoreDataClass.swift
//  Shekels
//
//  Created by J. DeWeese on 11/24/23.
//

import Foundation
import CoreData

@objc(BudgetList)
public class BudgetList: NSManagedObject {
    var remindersArray: [Reminder] {
        reminders?.allObjects.compactMap { ($0 as! Reminder) } ?? []
    }
}
