//
//  Extension.swift
//  Mail Client
//
//  Created by 中筋淳朗 on 2020/12/10.
//

import SwiftUI


extension Color {
    
    static let bgBlack = Color("bgBlack")
    
    static let lightOrange = Color("lightOrange")
    static let darkOrange = Color("darkOrange")
    
    static let lightGreen = Color("lightGreen")
    static let darkGreen = Color("darkGreen")
    
    static let itemBg = Color("itemBg")
    
    static let darkPink = Color("darkPink")
    static let lightPink = Color("lightPink")
    
    static let readGreen = Color("readGreen")
    static let deleteRed = Color("deleteRed")
    
    
    static let orangeGradient = LinearGradient(gradient: Gradient(colors: [Color.lightOrange, Color.darkOrange]), startPoint: .top, endPoint: .bottom)
    
    static let greenGradient = LinearGradient(gradient: Gradient(colors: [Color.darkGreen, Color.lightGreen]), startPoint: .top, endPoint: .bottom)
    
    static let pinkGradient = LinearGradient(gradient: Gradient(colors: [Color.lightPink, Color.darkPink]), startPoint: .topLeading, endPoint: .bottomTrailing)
}


extension UIScreen {
    
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
}


extension CGFloat {
    
    static let bottomShapeSize = UIScreen.screenWidth - 40
    
    static let mailWidth = UIScreen.screenWidth - 20
    static let mailHeight: CGFloat = 130
}
