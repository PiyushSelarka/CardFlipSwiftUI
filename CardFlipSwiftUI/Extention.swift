//
//  Extention.swift
//  CardFlipSwiftUI
//
//  Created by mac-00017 on 24/02/22.
//

import SwiftUI

struct SocialImage: View
{
    let imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: (CScreenWidth * 30) / 390, height: (CScreenWidth * 30) / 390, alignment: .center)
    }
}
struct SkillTitle: View
{
    let title: String

    var body: some View {
        ZStack {
            Text(title)
                .foregroundColor(.white)
                .font(.custom("Poppins-Regular", size: (CScreenWidth * 14) / 390))
                .underline()
        }
    }
}

let CMainScreen = UIScreen.main
let CBounds = CMainScreen.bounds

let CScreenSize = CBounds.size
let CScreenWidth = CScreenSize.width
let CScreenHeight = CScreenSize.height
