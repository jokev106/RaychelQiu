//
//  Prologue_Room.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 04/11/22.
//

import SwiftUI

struct Prologue_Room: View {
    
    @Binding var mainOnTap: Bool
    @State var onTap = false
    @State var scene = 2
    
    //Scene1
    @State var door_scale = 1.0
    @State var door_y = 0.0
    @State var door_opac = 1.0
    
    //Scene2
    @State var scene2_opac = 1.0
    
    //Scene3
    @State var scene3_scale = 2.2
    @State var scene3_opac = 0.0
    @State var scene3_x = 140.0
    @State var scene3_y = 325.0
    @State var moon_x = 0.0
    @State var moon_y = 0.0
    @State var sun_x = -120.0
    @State var sun_y = 100.0
    @State var light_opac = 0.5
    @State var lamp_x = 0.0
    @State var table_x = 0.0
    @State var day_opac = 0.0
    
    @Binding var scene_change_x: Double
    
    var body: some View {
        GeometryReader{geometry in
            ZStack{
                Image("Border")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 330, height: 448)
                    .offset(y: -102)
                
                ZStack{
                    Image("Prologue_Door_BG")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                                 
                    //Scene2
                    ZStack{
                        Image("Prologue_Room_Table")
                            .resizable()
                            .scaledToFit()
                        Image("Prologue_Room_Paper")
                            .resizable()
                            .scaledToFit()
                        Image("Prologue_Room_Raychel")
                            .resizable()
                            .scaledToFit()
                        Image("Prologue_Room_Pen")
                            .resizable()
                            .scaledToFit()
                        Image("Prologue_Room_Books")
                            .resizable()
                            .scaledToFit()
                        Image("Prologue_Room_Light")
                            .resizable()
                            .scaledToFit()
                        Image("Prologue_Room_Lamp")
                            .resizable()
                            .scaledToFit()
                    }
                    .opacity(scene2_opac)
                    .onTapGesture{
                        if onTap == true{
                            onTap = false
                            scene += 1
                        }
                    }

                    //Scene1
                    ZStack{
                        Image("Prologue_Door_BG")
                            .resizable()
                            .scaledToFit()
                            .opacity(door_opac)
                        Image("Prologue_Door")
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(door_scale)
                            .offset(y: door_y)
                            .opacity(door_opac)
                            .onAppear{
                                prologue_room_scene1_in()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 4.2) {
                                    onTap = true
                                }
                            }
                    }
                    
                    //Scene3
                        if scene == 3{
                            ZStack{
                                ZStack{
                                    Image("Prologue_Room2_Window")
                                        .resizable()
                                        .scaledToFit()
                                    Image("Prologue_Room2_Night")
                                        .resizable()
                                        .scaledToFit()
                                    Image("Prologue_Room2_Day")
                                        .resizable()
                                        .scaledToFit()
                                        .opacity(day_opac)
                                    Image("Prologue_Room2_Moon")
                                        .resizable()
                                        .scaledToFit()
                                        .offset(x: moon_x, y: moon_y)
                                    Image("Prologue_Room2_Sun")
                                        .resizable()
                                        .scaledToFit()
                                        .offset(x: sun_x, y:sun_y)
                                }
                                .offset(x: scene_change_x)
                                Image("Prologue_Room2_Table")
                                    .resizable()
                                    .scaledToFit()
                                    .offset(x: scene_change_x)
                                Image("Prologue_Room2_Books")
                                    .resizable()
                                    .scaledToFit()
                                    .offset(x: scene_change_x)
                                Image("Prologue_Room2_Paper")
                                    .resizable()
                                    .scaledToFit()
                                    .offset(x: scene_change_x)
                                Image("Prologue_Room2_Raychel")
                                    .resizable()
                                    .scaledToFit()
                                    .offset(x: scene_change_x)
                                Image("Prologue_Room2_Pen")
                                    .resizable()
                                    .scaledToFit()
                                    .offset(x: scene_change_x)
                                Image("Prologue_Room_Light")
                                    .resizable()
                                    .scaledToFit()
                                    .opacity(light_opac)
                                    .offset(x: scene_change_x)
                                Image("Prologue_Room_Lamp")
                                    .resizable()
                                    .scaledToFit()
                                    .offset(x: scene_change_x)
                                
                            }
                            .scaleEffect(scene3_scale)
                            .offset(x:scene3_x, y:scene3_y)
                            .opacity(scene3_opac)
                            .onAppear{
                                prologue_room_scene3_in()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 7.2) {
                                    onTap = true
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 7.7) {
                                    prologue_room_scene3_transition()
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 12.6) {
                                    mainOnTap = true
                                }
                            }
//                            .onTapGesture{
//                                if onTap == true{
//                                    onTap = false
//                                    prologue_room_scene3_transition()
//                                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.7) {
//                                        mainOnTap = true
//                                    }
//                                }
//                            }
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
    
    func prologue_room_scene1_in(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeIn(duration: 2.0)) {
                door_y += 250
                door_scale += 1.5
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            withAnimation(.easeIn(duration: 2.0)) {
                SFXManager.instance.playSFX(sound: .doorOpen)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            withAnimation(.easeIn(duration: 0.5)) {
                door_opac -= 1
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
            withAnimation(.easeIn(duration: 2.0)) {
                SFXManager2.instance.playSFX(sound: .drawing)
            }
        }
    }
    
    func prologue_room_scene3_in(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeInOut(duration: 2.0)) {
                scene3_opac += 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.7) {
            scene2_opac = 0.0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            withAnimation(.easeInOut(duration: 4.0)) {
                scene3_scale -= 1.2
                scene3_x -= 140
                scene3_y -= 325
            }
        }
    }
    
    func prologue_room_scene3_transition(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeIn(duration: 2.0)) {
                moon_y -= 100
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeIn(duration: 2.0)) {
                moon_x += 120
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeIn(duration: 2.0)) {
                day_opac += 1.0
                light_opac -= 0.5
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            withAnimation(.easeInOut(duration: 2.0)) {
                sun_x += 120
                sun_y -= 100
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            withAnimation(.easeIn(duration: 2.0)) {
                SFXManager2.instance.playSFX(sound: .birds1)
            }
        }
    }
}

struct Prologue_Room_Previews: PreviewProvider {
    static var previews: some View {
        Prologue_Room(mainOnTap: .constant(false), scene_change_x: .constant(0))
    }
}
