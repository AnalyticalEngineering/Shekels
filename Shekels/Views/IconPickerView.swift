//
//  IconPickerView.swift
//  Shekels
//
//  Created by J. DeWeese on 11/25/23.
//

import SwiftUI
import CoreData

struct IconPickerView: View {
    //MARK:  PROPERTIES
    @Binding var selectedIcon: String
    let icon = ["car.circle.fill",
                "car.fill",
                "house.circle.fill",
                "house.fill",
                "bolt.circle.fill",
                "power.circle.fill",
                "lightbulb.circle.fill",
                "graduationcap.circle.fill",
                "graduationcap.fill",
                "fork.knife.circle.fill",
                "cart.fill",
                "cart.circle.fill",
                "dollarsign.circle.fill",
                "dollarsign",
                "fuelpump.fill",
                "fuelpump.circle.fill",
                "wifi.circle.fill",
                "tv.badge.wifi",
                "phone.circle.fill",
                "smartphone",
                "play.circle.fill",
                "stethoscope.circle.fill",
                "cross.circle.fill",
                "figure.run.circle.fill",
                "figure.child.circle.fill",
                "figure.and.child.holdinghands",
                "figure.2.and.child.holdinghands",
                "lightbulb.fill",
                "pawprint.circle.fill",
                "pawprint.fill",
                "dog.circle.fill",
                "cat.circle.fill",
                "cross.case.fill",
                "cross.fill",
                "cross.circle.fill",
                "banknote.fill",
                "network.badge.shield.half.filled",
                "network",
                ]
    @Binding var selectedColor: Color

    var body: some View {
        VStack {
            HStack {
                //MARK:  ICON PICK
                Picker("Icons:", selection: $selectedIcon){
                    ForEach(icon, id: \.self) { icon in
                        Image(systemName: icon)
                            .frame(width: 40, height: 40)
                            .tag(icon)
                    }
                }
                .pickerStyle(.menu)
                .tint(selectedColor)
                .padding(.horizontal)
                //MARK:  COLOR PICKER
                ColorPicker("Color:", selection: $selectedColor)
            }.padding(.horizontal)
        }
    }
}

struct IconPicker_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddNewBudgetListView(onSave: { (_, _, _) in })
        }
    }
}



