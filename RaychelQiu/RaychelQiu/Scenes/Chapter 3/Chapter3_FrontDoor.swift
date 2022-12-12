//
//  Chapter3_FrontDoor.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 17/11/22.
//

import SwiftUI

struct Chapter3_FrontDoor: View {
    
    @Binding var mainOnTap: Bool
    @State var onTap = false
    @State var scene = 1
    
    //Scene1
    @State var scene1_x = -66.0
    @State var scene1_x2 = -70.0
    @State var scene1_raychel_opac = 0.0
    @State var scene1_raychel_x = 79.0
    @State var scene1_raychel_y = 76.0
    @State var scene1_raychel_scale = 1.4
    @State var scene2_opac = 0.0
    @State var frontDoor_opac = 1.0
    
    //Scene2
    @State var button_opac = 0.0
    @State var hand_opac = 0.0
    @State var hand_x = 160.0
    @State var hand_y = 50.0
    @State var hand_rotation = 0.0
    
    //Scene3
    @Binding var scene3_x: Double
    
    var body: some View {
        GeometryReader{geometry in
            ZStack{
                Image("Border")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 330, height: 448)
                    .offset(y: -102)
                
                ZStack{
                    Group{
                        Image("Chapter3_Open_BG")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .offset(x: scene1_x2)
                    }
                    .offset(x: scene3_x)
                    
                    //Scene1
                    if scene == 3 || scene == 4 {
                        ZStack{
                            Image("Chapter3_Open_Door")
                                .resizable()
                                .scaledToFit()
                                .offset(x: scene3_x, y: -3)
                                .scaleEffect(0.98)
                            Image("Chapter3_Open_Inside")
                                .resizable()
                                .scaledToFit()
                                .offset(x: scene3_x,y: -3)
                                .scaleEffect(1)
                            Image("Chapter3_Open_Friend")
                                .resizable()
                                .scaledToFit()
                                .offset(x: scene3_x,y: 1)
                                .mask{
                                    Image("Chapter3_Open_Inside")
                                        .resizable()
                                        .scaledToFit()
                                        .offset(x: scene3_x,y: -3)
                                        .scaleEffect(1)
                                }
                            Image("Chapter3_Open_DoorSide")
                                .resizable()
                                .scaledToFit()
                                .offset(x: scene3_x,y: -3)
                                .scaleEffect(0.98)
                            Image("Chapter3_Open_DoorOpen")
                                .resizable()
                                .scaledToFit()
                                .offset(x: scene3_x,y: -4)
//                                .scaleEffect(0.98)
                            Group{
                                Group{
                                    Image("Chapter3_FrontDoor")
                                        .resizable()
                                        .scaledToFit()
                                        .scaleEffect(0.85)
                                        .opacity(frontDoor_opac)
                                }
                                .offset(x: scene1_x,y: -8)
                                Image("Chapter3_Open_Raychel")
                                    .resizable()
                                    .scaledToFit()
                                    .offset(x: scene1_raychel_x,y: scene1_raychel_y)
                                    .scaleEffect(scene1_raychel_scale)
                                    .opacity(scene1_raychel_opac)
                                Image("Chapter3_FrontDoor_Bell")
                                    .resizable()
                                    .scaledToFit()
                                    .offset(x: scene1_x2, y: 1)
                                Image("Chapter3_FrontDoor_Lamp")
                                    .resizable()
                                    .scaledToFit()
                                    .offset(x: scene1_x2, y: 1)
                            }
                            .offset(x: scene3_x)
                        }
                        .onAppear{
                            chapter3_frontDoor_scene3_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4.2) {
                                scene += 1
//                                mainOnTap = true
                            }
                        }
                        .onTapGesture{
                            
                        }
                    }
                    
                    if scene == 4 || scene == 5 {
                        ZStack{
                            Image("Chapter3_FrontDoor_Lamp")
                                .resizable()
                                .scaledToFit()
                                .offset(x: scene1_x2, y: 1)
                        }
                        .offset(x: scene3_x)
                        .onAppear{
                            mainOnTap = true
                        }
                    }
                    
                    //Scene1
                    if scene == 1 || scene == 2{
                        ZStack{
                            Group{
                                Image("Chapter3_FrontDoor")
                                    .resizable()
                                    .scaledToFit()
                                    .scaleEffect(0.85)
                                    .opacity(frontDoor_opac)
                            }
                            .offset(x: scene1_x,y: -8)
                            Image("Chapter3_Open_Raychel")
                                .resizable()
                                .scaledToFit()
                                .offset(x: scene1_raychel_x,y: scene1_raychel_y)
                                .scaleEffect(scene1_raychel_scale)
                                .opacity(scene1_raychel_opac)
                            Image("Chapter3_FrontDoor_Bell")
                                .resizable()
                                .scaledToFit()
                                .offset(x: scene1_x2, y: 1)
                            Image("Chapter3_FrontDoor_Lamp")
                                .resizable()
                                .scaledToFit()
                                .offset(x: scene1_x2, y: 1)
                            
                               
                        }
                        .onAppear{
                            chapter3_frontDoor_scene1_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4.7) {
                                onTap = true
                            }
                        }
                        .onTapGesture{
                            if onTap == true{
                                onTap = false
                                scene += 1
                            }
                        }
                    }
                    
                    //Scene2
                    if scene == 2 || scene == 3 {
                        ZStack{
                            Image("Chapter3_Bell_BG")
                                .resizable()
                                .scaledToFit()
                                .offset(x: 20)
                                .scaleEffect(2.0)
                                .opacity(button_opac)
                            Image("Chapter3_Bell")
                                .resizable()
                                .scaledToFit()
                                .offset(x: 30)
                                .opacity(button_opac)
                            Image("Chapter3_Bell_Hand")
                                .resizable()
                                .scaledToFit()
                                .opacity(hand_opac)
                                .offset(x: hand_x, y: hand_y)
                            
                            
                               
                        }
                        .onAppear{
                            chapter3_frontDoor_scene2_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 7.2) {
                                onTap = true
                            }
                        }
                        .onTapGesture{
                            if onTap == true{
                                onTap = false
                                scene += 1
                            }
                        }
                    }
                }
                .mask {
                    Image("Day")
                        .resizable()
                        .scaledToFit()
                }
                .scaleEffect(1.27)
                .offset(y: 20)
            }
            
            
        }
    }
    
    func chapter3_frontDoor_scene1_in(){
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 2.0)) {
                scene1_x += 70.0
                scene1_x2 += 70.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            withAnimation(.easeInOut(duration: 1.0)) {
                scene1_raychel_opac += 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            withAnimation(.easeOut(duration: 2.0)) {
                scene1_raychel_x -= 20
                scene1_raychel_y -= 40
            }
        }

    }
    
    func chapter3_frontDoor_scene2_in(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeInOut(duration: 1.5)) {
                button_opac += 1.0
                hand_opac += 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            withAnimation(.easeOut(duration: 2.0)) {
                hand_x -= 130
                hand_y -= 50
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            withAnimation(.easeIn(duration: 2.0)) {
                hand_x += 130
                hand_y += 50
            }
        }
    }
    
    func chapter3_frontDoor_scene3_in(){
        scene1_raychel_x = 0
        scene1_raychel_y = 0
        scene1_raychel_scale = 1.0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeInOut(duration: 1.5)) {
                button_opac -= 1.0
                hand_opac -= 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            withAnimation(.easeInOut(duration: 1.5)) {
                frontDoor_opac -= 1.0
            }
        }
    }
}

struct Chapter3_FrontDoor_Previews: PreviewProvider {
    static var previews: some View {
        Chapter3_FrontDoor(mainOnTap: .constant(false), scene3_x: .constant(0.0))
    }
}
