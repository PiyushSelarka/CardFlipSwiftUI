//
//  CardFlipSwiftUIApp.swift
//  CardFlipSwiftUI
//
//  Created by mac-00017 on 23/02/22.
//

import SwiftUI

@main
struct CardFlipSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct CustomShape: Shape {
    var corner : UIRectCorner
    var radii : CGFloat
    
    func path(in rect : CGRect) -> Path{
        return Path(UIBezierPath(roundedRect : rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radii, height: radii)).cgPath)
    }
}
