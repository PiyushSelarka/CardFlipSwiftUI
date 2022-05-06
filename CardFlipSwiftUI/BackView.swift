//
//  BackView.swift
//  CardFlipSwiftUI
//
//  Created by mac-00017 on 23/02/22.
//

import SwiftUI

struct BackView: View {
    
    var name : String = ""
    var color1 : String = ""
    var color2 : String = ""
    
    var body: some View {
        ZStack {
            // Card 
            Rectangle()
                .overlay(
                    LinearGradient(gradient: Gradient(colors: [Color(color1), Color(color2)]),startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .clipShape(CustomShape(
                    corner: [.bottomRight,.topLeft,.bottomLeft,.topRight], radii: (CScreenWidth * 18) / 390
                ))
                .frame(width: (CScreenWidth * 180) / 390, height: (CScreenWidth * 180) / 390, alignment: .center)
            
            // User Details
            VStack(spacing:8){
                Image("mainwizard")
                    .resizable()
                    .frame(width: (CScreenWidth * 80) / 390, height: (CScreenWidth * 80) / 390, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: (CScreenWidth * 2) / 390))
                
                Text(name)
                    .font(.custom("Poppins-SemiBold", size: (CScreenWidth * 18) / 390))
                    .foregroundColor(Color.white)
            
                Text("Mobile Developer")
                    .font(.custom("Poppins-Regular", size: (CScreenWidth * 14) / 390))
                    .foregroundColor(Color.white)
            }
        }
    }
}

struct BackView_Previews: PreviewProvider {
    static var previews: some View {
        BackView(name: "Piyush")
    }
}
