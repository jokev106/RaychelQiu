//
//  Minigame4_Dinner.swift
//  RaychelQiu
//
//  Created by Jonathan Kevin on 09/11/22.
//

import SwiftUI

struct Minigame4_Dinner: View {
    
    @State var positionDinnerBox = CGPoint(x: 198, y: 635)
    @State var positionBorder = CGPoint(x: 198, y: 275)
    @State var positionBorderBG = CGPoint(x: 198, y: 400)
    @State var positionRaychelEat = CGPoint(x: 205, y: 170)
    @State var positionRaychelPickUp = CGPoint(x: 198, y: 185)
    @State var positionTable = CGPoint(x: 198, y: 455)
    @State var positionPlate = CGPoint(x: 198, y: 465)
    @State var positionDumplingLeft = CGPoint(x: 128, y: 665)
    @State var positionDumplingRight = CGPoint(x: 268, y: 595)
    @State var positionDumplingRight1 = CGPoint(x: 268, y: 570)
    @State var positionDumplingRight2 = CGPoint(x: 275, y: 580)
    @State var positionDumplingLeft1 = CGPoint(x: 127, y: 625)
    @State var positionDumplingLeft2 = CGPoint(x: 115, y: 640)
    @State var positionDumplingLeft3 = CGPoint(x: 140, y: 638)
    
    
    @State var moveableDumplingLeft1: Bool = false
    @State var moveableDumplingLeft2: Bool = false
    @State var moveableDumplingLeft3: Bool = false
    @State var moveableDumplingRight1: Bool = false
    @State var moveableDumplingRight2: Bool = false
    
    @State var eatLeft1:Bool = false
    @State var eatLeft2:Bool = false
    @State var eatLeft3:Bool = false
    @State var eatRight1:Bool = false
    @State var eatRight2:Bool = false
    
    @State var eatScene:Bool = false
    
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    @State var countdown: Int = 3
    @State var raychelEating: String? = nil

    var body: some View {
        
        //Dragable for Dumpling Left1
        let DumplingLeft1Drag = DragGesture(coordinateSpace: .local)
            .onChanged{ gesture in
                if eatScene == false {
                    if moveableDumplingLeft1 == false{
                        self.positionDumplingLeft1 = gesture.location
                    }
                }
            }
               .onEnded {gesture in
                       if self.positionDumplingLeft1.y > 435 && self.positionDumplingLeft1.y < 490 && self.positionDumplingLeft1.x > 130 && self.positionDumplingLeft1.x < 260 {
                           withAnimation(Animation.easeInOut(duration: 1)){
                               DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                   eatScene = true
                                   eatLeft1 = true
                                   DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                       eatScene = false
                                   }
                               }
                               moveableDumplingLeft1 = true
                               self.positionDumplingLeft1.x = 215.3
                               self.positionDumplingLeft1.y = 456.3
                           }
                       }
                   if self.positionDumplingLeft1.y < 435 || self.positionDumplingLeft1.y > 490 || self.positionDumplingLeft1.x < 130 || self.positionDumplingLeft1.x > 260 {
                       withAnimation(.default){
                           self.positionDumplingLeft1.x = 127
                           self.positionDumplingLeft1.y = 625
                       }
                   }
               }
        
        //Dragable for Dumpling Left2
        let DumplingLeft2Drag = DragGesture(coordinateSpace: .local)
            .onChanged{ gesture in
                if eatScene == false {
                    if moveableDumplingLeft2 == false{
                        self.positionDumplingLeft2 = gesture.location
                    }
                }
            }
               .onEnded {gesture in
                   if self.positionDumplingLeft2.y > 435 && self.positionDumplingLeft2.y < 490 && self.positionDumplingLeft2.x > 130 && self.positionDumplingLeft2.x < 260 {
                       withAnimation(.default){
                           DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                               eatScene = true
                               eatLeft2 = true
                               DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                   eatScene = false
                               }
                           }
                           moveableDumplingLeft2 = true
                           self.positionDumplingLeft2.x = 215.3
                           self.positionDumplingLeft2.y = 456.3
                       }
                   }
                   if self.positionDumplingLeft2.y < 435 || self.positionDumplingLeft2.y > 490 || self.positionDumplingLeft2.x < 130 || self.positionDumplingLeft2.x > 260 {
                       withAnimation(.default){
                           self.positionDumplingLeft2.x = 115
                           self.positionDumplingLeft2.y = 640
                       }
                   }

               }
        
        //Dragable for Dumpling Left3
        let DumplingLeft3Drag = DragGesture(coordinateSpace: .local)
            .onChanged{ gesture in
                if eatScene == false {
                    if moveableDumplingLeft3 == false{
                        self.positionDumplingLeft3 = gesture.location
                    }
                }
            }
               .onEnded {gesture in
                   if self.positionDumplingLeft3.y > 435 && self.positionDumplingLeft3.y < 490 && self.positionDumplingLeft3.x > 130 && self.positionDumplingLeft3.x < 260 {
                       withAnimation(.default){
                           DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                               eatScene = true
                               eatLeft3 = true
                               DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                   eatScene = false
                               }
                           }
                           moveableDumplingLeft3 = true
                           self.positionDumplingLeft3.x = 215.3
                           self.positionDumplingLeft3.y = 456.3
                       }
                   }
                   if self.positionDumplingLeft3.y < 435 || self.positionDumplingLeft3.y > 490 || self.positionDumplingLeft3.x < 130 || self.positionDumplingLeft3.x > 260 {
                       withAnimation(.default){
                           self.positionDumplingLeft3.x = 140
                           self.positionDumplingLeft3.y = 638
                       }
                   }

               }
        
        //Dragable for Dumpling Right1
        let DumplingRight1Drag = DragGesture(coordinateSpace: .local)
            .onChanged{ gesture in
                if eatScene == false {
                    if moveableDumplingRight1 == false{
                        self.positionDumplingRight1 = gesture.location
                    }
                }
            }
               .onEnded {gesture in
                   if self.positionDumplingRight1.y > 435 && self.positionDumplingRight1.y < 490 && self.positionDumplingRight1.x > 130 && self.positionDumplingRight1.x < 260 {
                       withAnimation(.default){
                           DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                               eatScene = true
                               eatRight1 = true
                               DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                   eatScene = false
                               }
                           }
                           moveableDumplingRight1 = true
                           self.positionDumplingRight1.x = 215.3
                           self.positionDumplingRight1.y = 456.3
                       }
                   }
                   if self.positionDumplingRight1.y < 435 || self.positionDumplingRight1.y > 490 || self.positionDumplingRight1.x < 130 || self.positionDumplingRight1.x > 260 {
                       withAnimation(.default){
                           self.positionDumplingRight1.x = 268
                           self.positionDumplingRight1.y = 570
                       }
                   }
               }
        //Dragable for Dumpling Right2
        let DumplingRight2Drag = DragGesture(coordinateSpace: .local)
            .onChanged{ gesture in
                if eatScene == false {
                    if moveableDumplingRight2 == false{
                        self.positionDumplingRight2 = gesture.location
                    }
                }
            }
               .onEnded {gesture in
                   if self.positionDumplingRight2.y > 435 && self.positionDumplingRight2.y < 490 && self.positionDumplingRight2.x > 130 && self.positionDumplingRight2.x < 260 {
                       withAnimation(.default){
                           DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                               eatScene = true
                               eatRight2 = true
                               DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                   eatScene = false
                               }
                           }
                           moveableDumplingRight2 = true
                           self.positionDumplingRight2.x = 215.3
                           self.positionDumplingRight2.y = 456.3
                       }
                   }
                   if self.positionDumplingRight2.y < 435 || self.positionDumplingRight2.y > 490 || self.positionDumplingRight2.x < 130 || self.positionDumplingRight2.x > 260 {
                       withAnimation(.default){
                           self.positionDumplingRight2.x = 275
                           self.positionDumplingRight2.y = 580
                       }
                   }
               }
        
        GeometryReader{geo in
            ZStack{
          
                //Border
                Group{
                    Image("RaychelBG")
                        .resizable()
                        .frame(width: 440, height: 960)
                        .position(self.positionBorderBG)
                    Image("RaychelBorder")
                        .resizable()
                        .frame(width: 330, height: 449.6)
                        .position(self.positionBorder)
                    
                    Image("DInnerBG")
                        .resizable()
                        .frame(width: 322, height: 219)
                        .position(self.positionDinnerBox)
                    Image("RaychelBorder")
                        .resizable()
                        .frame(width: 330, height: 224)
                        .position(self.positionDinnerBox)
                }
                
                //Raychel Eat
                Group{
                    Image("DInnerBG")
                        .resizable()
                        .frame(width: 324, height: 85)
                        .position(self.positionTable)
                    Image("Plate")
                        .resizable()
                        .frame(width: 130, height: 50)
                        .position(self.positionPlate)
                        .shadow(color: .black.opacity(0.3), radius: 1, x: 1, y: 1)
                }
                
                //Bowl
                Group{
                    //Dumpling  Right Bowl
                    Image("Bowl")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .position(self.positionDumplingRight)
                        .shadow(color: .black.opacity(0.2), radius: 1, x: 1, y: 1)
                    
                    //Dumpling left Bowl
                    Image("Bowl")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .position(self.positionDumplingLeft)
                        .shadow(color: .black.opacity(0.2), radius: 1, x: 1, y: 1)
                }
                
                //Dumplings
                Group{
                    if eatRight1 == false {
                        Image("Dumpling2")
                            .resizable()
                            .frame(width: 50, height: 30)
                            .position(self.positionDumplingRight1)
                            .gesture(DumplingRight1Drag)
                            .shadow(color: .black.opacity(0.1), radius: 1, x: 1, y: 1)
                    }
                    if eatRight2 == false {
                        Image("Dumpling2")
                            .resizable()
                            .frame(width: 50, height: 30)
                            .position(self.positionDumplingRight2)
                            .gesture(DumplingRight2Drag)
                            .shadow(color: .black.opacity(0.1), radius: 1, x: 1, y: 1)
                    }
                    if eatLeft1 == false {
                        Image("Dumpling")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .position(self.positionDumplingLeft1)
                            .gesture(DumplingLeft1Drag)
                            .shadow(color: .black.opacity(0.1), radius: 1, x: 1, y: 1)
                    }
                    if eatLeft3 == false {
                        Image("Dumpling")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .position(self.positionDumplingLeft3)
                            .gesture(DumplingLeft3Drag)
                            .shadow(color: .black.opacity(0.1), radius: 1, x: 1, y: 1)
                    }
                    if eatLeft2 == false {
                        Image("Dumpling")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .position(self.positionDumplingLeft2)
                            .gesture(DumplingLeft2Drag)
                            .shadow(color: .black.opacity(0.1), radius: 1, x: 1, y: 1)
                    }
                    
                }
                
                //Raychel Eat
                Group{
                    if eatScene == true {
                        Image("RaychelEat")
                            .resizable()
                            .frame(width: 215, height: 290)
                            .position(self.positionRaychelEat)
                            .scaledToFit()
                            .shadow(color: .black.opacity(0.3), radius: 1, x: 1, y: 1)
                    }
                    if eatScene == false {
                        Image("RaychelPickUp")
                            .resizable()
                            .frame(width: 230, height: 310)
                            .position(self.positionRaychelPickUp)
                            .scaledToFit()
                            .shadow(color: .black.opacity(0.3), radius: 1, x: 1, y: 1)
                    }
                }
            }
        }
    }
}

struct Minigame4_Dinner_Previews: PreviewProvider {
    static var previews: some View {
        Minigame4_Dinner()
    }
}
