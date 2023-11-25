//
//  ReminderStatView.swift
//  Shekels
//
//  Created by J. DeWeese on 11/24/23.
//

import SwiftUI

struct ReminderStatView: View {
    
    let icon: String
    let title: String
    var count: Int?
    var iconColor: Color = .blue
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Image(systemName: icon)
                        .foregroundColor(iconColor)
                        .font(.title)
                    Text(title)
                        .opacity(0.8)
                }
                Spacer()
                if let count {
                    Text("\(count)")
                        .font(.largeTitle)
                }
            }.padding()
                .frame(maxWidth: .infinity)
            
                .foregroundColor(.primary)
                .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
        }
    }
}

struct ReminderStatsView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderStatView(icon: "calendar", title: "Today", count: 9)
    }
}
