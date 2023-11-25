//
//  TabModel.swift
//  Shekels
//
//  Created by J. DeWeese on 11/24/23.
//

import SwiftUI

/// App Tab's
enum Tab: String, CaseIterable {
    case money = "Money"
    case budget = "Budget"
   
    
    var systemImage: String {
        switch self {
        case .budget:
            return "list.clipboard.fill"
        case .money:
            return "dollarsign"
        }
    }
    
    var index: Int {
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
}


