//
//  MiniGame2_MomBubbleChat.swift
//  RaychelQiu
//
//  Created by Jonathan Kevin on 01/11/22.
//

import SwiftUI

struct MiniGame2_MomBubbleChat: View {
    // Drag gesture bool for text box
    @State var textBox_1: Bool = false
    @State var moveableTextBox_1: Bool = false
    @State var textBox_2: Bool = false
    @State var moveableTextBox_2: Bool = false
    @State var textBox_3: Bool = false
    @State var moveableTextBox_3: Bool = false
    @State var textBox_4: Bool = false
    @State var moveableTextBox_4: Bool = false
    @State var textBox_5: Bool = false
    @State var moveableTextBox_5: Bool = false
    
    // Position items
    @State var positionTextBox_1 = CGPoint(x: 295, y: 203)
    @State var positionTextBox_2 = CGPoint(x: 290, y: 203)
    @State var positionTextBox_3 = CGPoint(x: 253, y: 179)
    @State var positionTextBox_4 = CGPoint(x: 267, y: 179)
    @State var positionTextBox_5 = CGPoint(x: 295, y: 222)
    @Binding var positionRaychelAnger: CGPoint
    @State var positionHeart = CGPoint(x: 198, y: 635)
    @State var positionHeartBox = CGPoint(x: 198, y: 635)
    @State var positionBorder = CGPoint(x: 198, y: 270)
    
    // Heart Bool Visible
    @State var isHeartFull: Bool = true
    @State var isHeartBroken_1: Bool = false
    @State var isHeartBroken_2: Bool = false
    @State var isHeartBroken_3: Bool = false
    @State var isHeartBroken_4: Bool = false
    @State var isHeartBroken_5: Bool = false
    @State var isHeartBroken_6: Bool = false
    
    @State var isTextBox_1: Bool = true
    @State var isTextBox_2: Bool = false
    @State var isTextBox_3: Bool = false
    @State var isTextBox_4: Bool = false
    @State var isTextBox_5: Bool = false
    
    @State var shakes: Int = 0
    
    // Timer
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    @State var countdown: Int = 2
    @Binding var heartBrokenMax: String?
    
    var body: some View {
        // Dragable for textBox 1
        let textBoxDrag_1 = DragGesture(coordinateSpace: .local)
            .onChanged { gesture in
                if moveableTextBox_1 == false {
                    self.positionTextBox_1 = gesture.location
                }
            }
            .onEnded { _ in
                if self.positionTextBox_1.y > 575 {
                    self.moveableTextBox_1 = true
                    textBox_1 = true
                    isTextBox_2 = true
                    isHeartFull = false
                    isHeartBroken_1 = true
                    isTextBox_1 = false
                    withAnimation(Animation.easeInOut(duration: 0.5)) {
                        self.shakes += 1
                    }
                }
            }
        
        // Dragable for textBox 2
        let textBoxDrag_2 = DragGesture(coordinateSpace: .local)
            .onChanged { gesture in
                if moveableTextBox_2 == false {
                    self.positionTextBox_2 = gesture.location
                }
            }
            .onEnded { _ in
                if self.positionTextBox_2.y > 575 {
                    self.moveableTextBox_2 = true
                    textBox_2 = true
                    isTextBox_3 = true
                    isHeartBroken_1 = false
                    isHeartBroken_2 = true
                    isTextBox_2 = false
                    withAnimation(Animation.easeInOut(duration: 0.5)) {
                        self.shakes += 1
                    }
                }
            }
        
        // Dragable for textBox 3
        let textBoxDrag_3 = DragGesture(coordinateSpace: .local)
            .onChanged { gesture in
                if moveableTextBox_3 == false {
                    self.positionTextBox_3 = gesture.location
                }
            }
            .onEnded { _ in
                if self.positionTextBox_3.y > 575 {
                    self.moveableTextBox_3 = true
                    textBox_3 = true
                    isTextBox_4 = true
                    isHeartBroken_2 = false
                    isHeartBroken_3 = true
                    isTextBox_3 = false
                    withAnimation(Animation.easeInOut(duration: 0.5)) {
                        self.shakes += 1
                    }
                }
            }
        
        // Dragable for textBox 4
        let textBoxDrag_4 = DragGesture(coordinateSpace: .local)
            .onChanged { gesture in
                if moveableTextBox_4 == false {
                    self.positionTextBox_4 = gesture.location
                }
            }
            .onEnded { _ in
                if self.positionTextBox_4.y > 575 {
                    self.moveableTextBox_4 = true
                    textBox_4 = true
                    isTextBox_5 = true
                    isHeartBroken_3 = false
                    isHeartBroken_4 = true
                    isTextBox_4 = false
                    withAnimation(Animation.easeInOut(duration: 0.5)) {
                        self.shakes += 1
                    }
                }
            }
        
        // Dragable for textBox5
        let textBoxDrag_5 = DragGesture(coordinateSpace: .local)
            .onChanged { gesture in
                if moveableTextBox_5 == false {
                    self.positionTextBox_5 = gesture.location
                }
            }
            .onEnded { _ in
                if self.positionTextBox_5.y > 575 {
                    self.moveableTextBox_5 = true
                    textBox_5 = true
                    isHeartBroken_4 = false
                    isHeartBroken_5 = true
                    isTextBox_5 = false
                    withAnimation(Animation.easeInOut(duration: 0.5)) {
                        self.shakes += 1
                    }
                }
            }
        
        GeometryReader { _ in
            ZStack {
                Image("Border")
                    .resizable()
                    .frame(width: 330, height: 449.6)
//                    .position(self.positionBorder)
                    .offset(y: -114)
                
                Image("RaychelAnger")
                    .resizable()
                    .frame(width: 190, height: 290)
                    .position(self.positionRaychelAnger)
               
                Image("HeartBox")
                    .resizable()
                    .frame(width: 330, height: 224)
//                        .position(self.positionHeartBox)
                    .offset(y: 250)
                
                // Broken Heart Group
                Group {
                    if isHeartFull == true {
                        Image("HeartFull")
                            .resizable()
                            .frame(width: 175, height: 150)
                            .position(self.positionHeart)
                            .modifier(Shake(animatableData: CGFloat(shakes)))
                            .shadow(color: .black.opacity(0.3), radius: 2, x: 2, y: 2)
                    }
                    if isHeartBroken_1 == true {
                        Image("HeartBroken_1")
                            .resizable()
                            .frame(width: 175, height: 150)
                            .position(self.positionHeart)
                            .modifier(Shake(animatableData: CGFloat(shakes)))
                            .shadow(color: .black.opacity(0.3), radius: 2, x: 2, y: 2)
                    }
                    if isHeartBroken_2 == true {
                        Image("HeartBroken_2")
                            .resizable()
                            .frame(width: 175, height: 150)
                            .position(self.positionHeart)
                            .modifier(Shake(animatableData: CGFloat(shakes)))
                            .shadow(color: .black.opacity(0.3), radius: 2, x: 2, y: 2)
                    }
                    if isHeartBroken_3 == true {
                        Image("HeartBroken_3")
                            .resizable()
                            .frame(width: 175, height: 150)
                            .position(self.positionHeart)
                            .modifier(Shake(animatableData: CGFloat(shakes)))
                            .shadow(color: .black.opacity(0.3), radius: 2, x: 2, y: 2)
                    }
                    if isHeartBroken_4 == true {
                        Image("HeartBroken_4")
                            .resizable()
                            .frame(width: 175, height: 150)
                            .position(self.positionHeart)
                            .modifier(Shake(animatableData: CGFloat(shakes)))
                            .shadow(color: .black.opacity(0.3), radius: 2, x: 2, y: 2)
                    }
                    if isHeartBroken_5 == true {
                        Image(heartBrokenMax ?? "HeartBroken_5")
                            .resizable()
                            .frame(width: 175, height: 150)
                            .position(self.positionHeart)
                            .modifier(Shake(animatableData: CGFloat(shakes)))
                            .shadow(color: .black.opacity(0.3), radius: 2, x: 2, y: 2)
                            
                    }
                }.onReceive(timer) { _ in
                    if isHeartBroken_5 == true {
                        timer.upstream.connect().cancel()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                self.shakes += 1
                                heartBrokenMax = "HeartBroken_6"
                            }
                        }
                    }
                }
                
                // Text Box Group
                Group {
                    // TextBox
                    if isTextBox_1 == true {
                        Image("TextBoxAnger")
                            .resizable()
                            .frame(width: 100, height: 60)
                            .position(self.positionTextBox_1)
                            .gesture(textBoxDrag_1)
                            .shadow(color: .black.opacity(0.3), radius: 2, x: 2, y: 2)
                    }
                    if isTextBox_2 == true {
                        Image("TextBoxAnger")
                            .resizable()
                            .frame(width: 100, height: 60)
                            .position(self.positionTextBox_2)
                            .gesture(textBoxDrag_2)
                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                            .shadow(color: .black.opacity(0.3), radius: 2, x: 2, y: 2)
                    }
                    if isTextBox_3 == true {
                        Image("TextBoxAnger")
                            .resizable()
                            .frame(width: 130, height: 70)
                            .position(self.positionTextBox_3)
                            .gesture(textBoxDrag_3)
                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                            .shadow(color: .black.opacity(0.3), radius: 2, x: 2, y: 2)
                    }
                    if isTextBox_4 == true {
                        Image("TextBoxAnger")
                            .resizable()
                            .frame(width: 120, height: 70)
                            .position(self.positionTextBox_4)
                            .gesture(textBoxDrag_4)
                            .shadow(color: .black.opacity(0.3), radius: 2, x: 2, y: 2)
                    }
                    if isTextBox_5 == true {
                        Image("TextBoxAnger")
                            .resizable()
                            .frame(width: 100, height: 60)
                            .position(self.positionTextBox_5)
                            .gesture(textBoxDrag_5)
                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                            .shadow(color: .black.opacity(0.3), radius: 2, x: 2, y: 2)
                    }
                }
            }
        }
    }
}

struct MiniGame2_MomBubbleChat_Previews: PreviewProvider {
    static var previews: some View {
        MiniGame2_MomBubbleChat(positionRaychelAnger: .constant(CGPoint(x: 198, y: 342)), heartBrokenMax: .constant(nil))
    }
}

struct Shake: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
            amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
            y: 0))
    }
}
