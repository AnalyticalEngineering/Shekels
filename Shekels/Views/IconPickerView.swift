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
    let icon = ["car.circle.fill","house.circle.fill","graduationcap.circle.fill","fork.knife.circle.fill","dollarsign.circle.fill","wifi.circle.fill","phone.circle.fill","play.circle.fill","stethoscope.circle.fill","cross.circle.fill","figure.run.circle.fill"
    ]
    @Binding var selectedColor: Color

    var body: some View {
        VStack {
            HStack {
                //MARK:  ICON PICK
                Picker("Icons:", selection: $selectedIcon){
                    ForEach(icon, id: \.self) { icon in
                        Image(systemName: icon)
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



