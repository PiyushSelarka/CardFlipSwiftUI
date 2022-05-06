//
//  SideButton.swift
//  CardFlipSwiftUI
//
//  Created by mac-00017 on 23/02/22.
//

import SwiftUI

struct SideButton: View {
    
    var imageName : String = ""
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: (CScreenWidth * 35) / 390, height: (CScreenWidth * 35) / 390, alignment: .center)
                .foregroundColor(.clear)
                .shadow(radius: (CScreenWidth * 7) / 390)
            
            ZStack{
                Image(systemName:imageName)
                    .resizable()
                    .foregroundColor(Color.white)
                    .frame(width: (CScreenWidth * 17) / 390, height: (CScreenWidth * 17) / 390, alignment: .center)
            }
        }
    }
}
struct SideButton_Previews: PreviewProvider {
    static var previews: some View {
        SideButton()
    }
}
