//
//  UIExtension.swift
//  Shekels
//
//  Created by J. DeWeese on 11/24/23.
//

import SwiftUI

enum Inter: String {
    case regular = "Inter-Regular"
    case medium = "Inter-Medium"
    case semibold = "Inter-SemiBold"
    case bold = "Inter-Bold"
}

extension Font {
    
    static func customfont(_ font: Inter, fontSize: CGFloat) -> Font {
        custom(font.rawValue, size: fontSize)
    }
}

extension CGFloat {
    
    static var screenWidth: Double {
        return UIScreen.main.bounds.size.width
    }
    
    static var screenHeight: Double {
        return UIScreen.main.bounds.size.height
    }
    
    static func widthPer(per: Double) -> Double {
        return screenWidth * per
    }
    
    static func heightPer(per: Double) -> Double {
        return screenHeight * per
    }
    
}

extension Color {
    
    static let theme = ColorTheme( )
    static let launch = LaunchTheme( )
    static let darkGray = Color(red: 27/255, green: 27/255, blue: 30/255) // dark gray
    static let offWhite = Color(red: 242/255, green: 242/255, blue: 246/255) // offwhite
    static let vaguelyOrange = Color(red: 255/39, green: 216/43, blue: 146/100)
    static let rust = Color(red: 255/18, green:179/43, blue: 146/100)
    }



struct ColorTheme {
    
    let colorAccent = Color("AccentColor")
    let colorSecondaryText = Color("SecondaryTextColor")
    let colorGreen = Color("Green")
    let colorRed = Color("Red")
    let colorOrange = Color("Orange")
    let colorBlue = Color("Blue")
    let colorGrey = Color("Grey")
    let colorGray = Color("Gray")
    let colorBlack = Color("Black")
    let colorBackground = Color("ColorBackground")
    
}

struct LaunchTheme {
    
    let accent = Color("LaunchAccentColor")
    let background = Color("LaunchBackgroundColor")
    
}



