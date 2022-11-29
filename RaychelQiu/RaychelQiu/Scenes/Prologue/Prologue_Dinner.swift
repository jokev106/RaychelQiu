//
//  Prologue_Dinner.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 03/11/22.
//

import SwiftUI

struct Prologue_Dinner: View {
    
    @Binding var mainOnTap: Bool
    
    @State var scene = 1
    @State var onTap = false
    
    @State var table_shadow_opac = 1.0
    @State var table_shadow_y = 0.0
    
    //Scene1
    @State var raychel_initial_back_x = -80.0
    @State var parent_initial_visible_x = -50.0
    
    //Scene2
    @State var raychel_visible_x = -270.0
    @State var raychel_visible_opac = 1.0
    @State var parent_back_x = 270.0
    @State var parent_back_y = 0.0
    @State var parent_back_opac = 1.0
    
    //Scene3
    @State var law_y = 80.0
    @State var hand_y = 80.0
    @State var raychel_akward_opac = 0.0
    @State var raychel_akward_x = 0.0
    
    //Scene4
    @State var raychel_back_x = 250.0
    @Binding var parent_visible_x: Double
    
    //Dinner Game
    @State var positionDinnerBox = CGPoint(x: 198, y: 635)
    @State var positionBorder = CGPoint(x: 198, y: 270)
    @State var positionBorderBG = CGPoint(x: 198, y: 390)
    @State var positionRaychelEat = CGPoint(x: 205, y: 165)
    @State var positionRaychelPickUp = CGPoint(x: 198, y: 180)
    @State var positionTable = CGPoint(x: 198, y: 450)
    @State var positionPlate = CGPoint(x: 198, y: 460)
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
    
    @State var eatLeft1Done:Bool = false
    @State var eatLeft2Done:Bool = false
    @State var eatLeft3Done:Bool = false
    @State var eatRight1Done:Bool = false
    @State var eatRight2Done:Bool = false
    
    @State var eatScene:Bool = false
    
    //Game Opacity
    @State var animSceneOpac = 1.0
    @State var gameSceneOpac = 0.0
    
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
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
                                       eatLeft1Done = true
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
                                   eatLeft2Done = true
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
                                   eatLeft3Done = true

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
                                   eatRight1Done = true
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
                                   eatRight2Done = true
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
        
        GeometryReader{ geometry in
            ZStack{
                Image("Border")
                    .resizable()
//                    .scaledToFit()
//                    .scaleEffect(0.92)
//                    .offset(y: -geometry.size.height * 0.151)
                    .frame(width: 330, height: 449.6)
                    .offset(y: -114)
                    .opacity(animSceneOpac)
                ZStack{
                    Image("Dinner_BG")
                        .resizable()
                        .scaledToFit()
                    
                    ZStack{
                        
                        Image("Dinner_Table")
                            .resizable()
                            .scaledToFit()
                        Image("Dinner_Table_Shadow")
                            .resizable()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .opacity(table_shadow_opac)
                            .offset(y: table_shadow_y)
                        
                        //Scene1
                        if scene == 1{
                            Image("Dinner_Parent_Visible_2")
                                .resizable()
                                .scaledToFit()
                                .offset(x: parent_initial_visible_x)
                            Image("Dinner_Raychel_Back_Sit")
                                .resizable()
                                .scaledToFit()
                                .offset(x: raychel_initial_back_x)
                                .onAppear{
                                    prologue_dinner_scene1_in()
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
                                        onTap = true
                                    }
                                }
                                .onTapGesture{
                                    if onTap == true{
                                        onTap = false
                                        prologue_dinner_scene1_out()
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                            scene += 1
                                        }
                                    }
                                }
                        }
                        
                        //Scene2
                        if scene == 2 || scene == 3 {
                            Image("Dinner_Raychel_Visible")
                                .resizable()
                                .scaledToFit()
                                .offset(x: raychel_visible_x)
                                .opacity(raychel_visible_opac)
                            Image("Dinner_Parent_Back")
                                .resizable()
                                .scaledToFit()
                                .offset(x: parent_back_x, y: parent_back_y)
                                .opacity(parent_back_opac)
                                .onAppear{
                                    prologue_dinner_scene2_in()
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.7) {
                                        onTap = true
                                    }
                                }
                                .onTapGesture{
                                    if onTap == true{
                                        onTap = false
                                        prologue_dinner_scene2_out()
                                        prologue_dinner_gamescene_in()
//                                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
//                                            scene += 1
//                                        }
                                    }
                                }
                        }
                        
                        //Scene3 Law
                        if scene == 3 {
                            Image("Dinner_Law")
                                .resizable()
                                .scaledToFit()
                                .offset(y: law_y)
                            Image("Dinner_Hand")
                                .resizable()
                                .scaledToFit()
                                .offset(y: hand_y)
                                .onAppear{
                                    prologue_dinner_scene3_in()
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.2) {
                                        onTap = true
                                    }
                                }
                            Image ("Dinner_Raychel_Visible_Akward")
                                .resizable()
                                .scaledToFit()
                                .opacity(raychel_akward_opac)
                                .offset(x: raychel_akward_x)
                                .onTapGesture{
                                    if onTap == true{
                                        onTap = false
                                        prologue_dinner_scene3_out()
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
                                            scene += 1
                                        }
                                    }
                                }
                        }
                        
                        //Scene4
                        if scene == 4 {
                            Image("Dinner_Parent_Visible_1")
                                .resizable()
                                .scaledToFit()
                                .offset(x: parent_visible_x)
                            Image("Dinner_Raychel_Back_Sit")
                                .resizable()
                                .scaledToFit()
                                .offset(x: raychel_back_x)
                                .opacity(0.0)
                                .onAppear{
                                    prologue_dinner_scene4_in()
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.7) {
                                        mainOnTap = true
                                    }
                                }
                        }
                        
                    }
                    
                    
                }
                .mask {
                    Image("Day")
                        .resizable()
                        .scaledToFit()
                }
                .opacity(animSceneOpac)
                .scaleEffect(geometry.size.width * 0.00324)
                .offset(y: geometry.size.height * 0.011)
                
                //Game Scene
                ZStack{
              
                    //Border
                    Group{
                        Image("RaychelBG")
                            .resizable()
                            .frame(width: 440, height: 970)
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
                }.opacity(gameSceneOpac)
                    .onTapGesture{
                        if eatLeft1Done == true && eatLeft2Done == true && eatLeft3Done == true && eatRight1Done == true && eatRight2Done == true {
                            prologue_dinner_gamescene_out()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
                                scene += 1
                            }
                        }
                    }
            }
        }
    }
    
    func prologue_dinner_scene1_in(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
            withAnimation(.easeInOut(duration: 2.0)) {
                parent_initial_visible_x += 50.0
                raychel_initial_back_x += 80.0
            }
        }
    }
    
    func prologue_dinner_scene1_out(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(.easeIn(duration: 1.5).speed(1.5)) {
                parent_initial_visible_x += 250.0
                raychel_initial_back_x -= 250.0
            }
        }
    }
    
    func prologue_dinner_scene2_in(){
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeOut(duration: 1.5)) {
                raychel_visible_x += 270.0
                parent_back_x -= 270.0
            }
        }
    }
    
    func prologue_dinner_scene2_out(){
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeIn(duration: 3)) {
                parent_back_y += 300
//                parent_back_opac -= 1.0
                table_shadow_opac -= 1.0
                table_shadow_y += 150
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeIn(duration: 2)) {
                parent_back_opac -= 1.0
            }
        }
    }
    
    func prologue_dinner_scene3_in(){
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 1.5)) {
                law_y -= 80
                hand_y -= 80
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeInOut(duration: 1.5)) {
                hand_y += 80
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            withAnimation(.easeInOut(duration: 1.0)) {
                raychel_akward_opac += 1
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.5) {
            withAnimation(.easeInOut(duration: 0.5)) {
                raychel_visible_opac -= 1
            }
        }

    }
    
    func prologue_dinner_scene3_out(){
        parent_visible_x = -250.0
//        raychel_back_x = 250.0
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 1.5)) {
                law_y += 100
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 1.5)) {
                raychel_akward_x += 250
            }
        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
//            withAnimation(.easeInOut(duration: 1.0)) {
//                table_shadow_opac += 1.0
//            }
//        }
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
//            withAnimation(.easeInOut(duration: 2.0)) {
//                table_shadow_y -= 150
//            }
//        }

    }
    
    func prologue_dinner_scene4_in(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeOut(duration: 1.5)) {
                parent_visible_x += 250.0
//                raychel_back_x -= 250.0
            }
        }
    }
    
    func prologue_dinner_gamescene_in(){
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeOut(duration: 3)) {
                animSceneOpac -= 1
                gameSceneOpac += 1
            }
        }
    }

    func prologue_dinner_gamescene_out(){
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeOut(duration: 1.5)) {
                animSceneOpac += 1
                gameSceneOpac -= 1.0
            }
        }
    }

}

struct Prologue_Dinner_Previews: PreviewProvider {
    static var previews: some View {
        Prologue_Dinner(mainOnTap: .constant(false), parent_visible_x: .constant(0.0))
    }
}
