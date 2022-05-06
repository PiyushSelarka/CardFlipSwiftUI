//
//  FrontView.swift
//  CardFlipSwiftUI
//
//  Created by mac-00017 on 23/02/22.
//

import SwiftUI

struct FrontView: View {
    
    var color1 : String = ""
    var color2 : String = ""
    
    var body: some View{
        
        ZStack() {
            // Card
            Rectangle()
                .overlay(
                    LinearGradient(gradient: Gradient(colors: [Color(color1), Color(color2)]),startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .clipShape(CustomShape(
                    corner: [.bottomRight,.topLeft,.bottomLeft,.topRight], radii: (CScreenWidth * 18) / 390
                ))
                .frame(width: (CScreenWidth * 180) / 390, height: (CScreenWidth * 180) / 390, alignment: .center)
           // Skills Text
            VStack {
                HStack{
                    Text("Skills")
                        .font(.custom("Poppins-SemiBold", size: (CScreenWidth * 20) / 390))
                        .foregroundColor(Color.white)
                }
                Spacer().frame(width: 0, height: (CScreenWidth * 10) / 390, alignment: .center)
                
                HStack {
                    SkillTitle(title:"Unity3D")
                    SkillTitle(title:"Android")
                    SkillTitle(title:"iOS")
                }.padding()
                // Social images
                HStack {
                    SocialImage(imageName: "fb")
                    SocialImage(imageName: "instagram")
                    SocialImage(imageName: "link")
                }
            }
        }
    }
}

struct FrontView_Previews: PreviewProvider {
    static var previews: some View {
        FrontView()
    }
}
