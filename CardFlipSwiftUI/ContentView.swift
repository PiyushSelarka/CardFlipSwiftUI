//
//  ContentView.Swift
//  CardFlipSwiftUI
//
//  Created by mac-00017 on 23/02/22.
//

import SwiftUI
import AVFoundation

// User Model
struct UserModel : Hashable {
    let id = UUID()
    let name: String
    let color1: String
    let color2: String
}

var results = [
    UserModel(name: "Pish Patel",   color1: "Color-9", color2: "Color-10"),
    UserModel(name: "Anita Bath",   color1: "Color-1", color2: "Color-2"),
    UserModel(name: "Bea Mine",     color1: "Color-1", color2: "Color-2"),
    UserModel(name: "Dee End",      color1: "Color-3", color2: "Color-4"),
    UserModel(name: "Ben Dover",    color1: "Color-5", color2: "Color-6"),
    UserModel(name: "Dave Allippa", color1: "Color-1", color2: "Color-2"),
    UserModel(name: "Dee Zynah",    color1: "Color-1", color2: "Color-2"),
    UserModel(name: "Reeve Ewer",   color1: "Color-7", color2: "Color-8"),
    UserModel(name: "Tex Ryta",     color1: "Color-9", color2: "Color-10"),
    UserModel(name: "Faye Clether", color1: "Color-1", color2: "Color-2")
]

struct ContentView: View {
    
    // GridItem
    var gridItemLayout = [GridItem(.flexible(minimum: (CScreenWidth * 180) / 390, maximum: (CScreenWidth * 180) / 390)),GridItem(.flexible(minimum: (CScreenWidth * 180) / 390, maximum: (CScreenWidth * 180) / 390))]
    
    var body: some View {
        
        ZStack {
            // ScrollView vertical
            ScrollView(.vertical) {
                // LazyVGrid Grid Item Layout
                LazyVGrid(columns: gridItemLayout) {
                    ForEach(results, id: \.self) { dict in
                        CardView(name: dict.name,color1: dict.color1,color2: dict.color2)
                    }
                }
            }
        }
    }
}

struct CardView: View {
    
    @State var flipped: Bool = false
    @State var flashcardRotation = 0.0
    @State var contentRotation = 0.0
    let name: String
    let color1: String
    let color2: String
    
    var body: some View {
        
        ZStack {
            if flipped {
                FrontView(color1: color1, color2: color2)
            } else {
                BackView(name: name,color1: color1, color2: color2)
            }
            Button(action: {
                AudioServicesPlaySystemSound(1109) // sound
                UINotificationFeedbackGenerator().notificationOccurred(.success) // short vibrations
                flipFlashcard()
            }) {
                SideButton(imageName: flipped ? "chevron.left.2" : "chevron.right.2")
            }.offset(x: (CScreenWidth * 70) / 390, y: (CScreenWidth * -70) / 390)
        }
        // roted content and card
        .rotation3DEffect(.degrees(contentRotation), axis: (x: 0, y: 1, z: 0))
        .rotation3DEffect(.degrees(flashcardRotation), axis: (x: 0, y: 1, z: 0))
        
    }
    // Animation 
    func flipFlashcard() {
        withAnimation(Animation.linear(duration: 0.5)) {
            flipped ? (flashcardRotation -= 180) : (flashcardRotation += 180)
        }
        
        withAnimation(Animation.linear(duration: 0.001).delay(0.5 / 2)) {
            contentRotation += 180
            flipped.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
