//
//  Prologue_Room_Mad.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 09/11/22.
//

import SwiftUI

struct Prologue_Room_Mad: View {
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
    @State var nyfw_opacity = 1.0
    @State var nyfw_scale = 0.0
    @State var nyfw_y = 0.0
    @State var nyfw_x = 0.0
    @State var nyfw_blur = 0.0
    @State var nyfw_paper_opac = 1.0
    
    //Scene4
    @State var raychel_normal_opac = 0.0
    @State var raychel_papers_opac = 1.0
    @State var raychel_laptop_opac = 0.0
    
    var body: some View {
        GeometryReader{geometry in
            ZStack{
                Image("Border")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 330, height: 449.6)
                    .offset(y: -114)
                
                
                ZStack{
                    Image("Prologue_Door_BG")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    
                    //Scene2
                    if scene == 2 || scene == 3 || scene == 4{
                        ZStack{
                            Group{
                                Image("Prologue_Room_Table")
                                    .resizable()
                                    .scaledToFit()
                                Image("Prologue_Room_Paper_Multiple")
                                    .resizable()
                                    .scaledToFit()
                                    .opacity(raychel_papers_opac)
                                Image("Prologue_Room_NYFW_Book")
                                    .resizable()
                                    .scaledToFit()
                                    .opacity(nyfw_paper_opac)
                                Image("Prologue_Room_Raychel_Mad")
                                    .resizable()
                                    .scaledToFit()
                                    .opacity(raychel_papers_opac)
                                Image("Prologue_Room_Normal")
                                    .resizable()
                                    .scaledToFit()
                                    .opacity(raychel_normal_opac)
                                Image("Prologue_Room_Laptop")
                                    .resizable()
                                    .scaledToFit()
                                    .opacity(raychel_normal_opac)
                            }
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
                        .blur(radius: nyfw_blur)
                        .onTapGesture{
                            if scene == 2 {
                                if onTap == true{
                                    onTap = false
                                    scene += 1
                                }
                            }
                            
                            if scene == 4{
                                if onTap == true {
                                    onTap = false
                                    prologue_room_scene4_out()
                                }
                            }
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
                    if scene == 3 || scene == 4{
                        ZStack{
                            Image("Prologue_Room_NYFW")
                                .resizable()
                                .scaledToFit()
                                .scaleEffect(nyfw_scale)
                                .offset(x: nyfw_x, y: nyfw_y)
                                .opacity(nyfw_opacity)
                        }
                        .onAppear{
                            prologue_room_scene3_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4.7) {
                                onTap = true
                            }
                        }
                        .onTapGesture{
                            if onTap == true{
                                onTap = false
                                prologue_room_scene4_in()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
                                    scene += 1
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
                .scaleEffect(geometry.size.width * 0.00324)
                .offset(y: geometry.size.height * 0.011)
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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            withAnimation(.easeIn(duration: 0.5)) {
                door_opac -= 1
            }
        }
    }
    
    func prologue_room_scene3_in(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(.easeInOut(duration: 1.0)) {
                nyfw_paper_opac -= 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            withAnimation(.easeInOut(duration: 2.0)) {
                nyfw_scale += 0.45
                nyfw_y -= 95
                nyfw_blur += 5
            }
        }
    }
    
    func prologue_room_scene4_in(){
        raychel_normal_opac = 1.0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(.easeInOut(duration: 1.0)) {
                raychel_papers_opac -= 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeInOut(duration: 2.0)) {
                nyfw_scale -= 0.45
                nyfw_y += 95
                nyfw_blur -= 5.0
            }
        }
    }
    
    func prologue_room_scene4_out(){
        raychel_normal_opac = 1.0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(.easeInOut(duration: 1.0)) {
                raychel_papers_opac += 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeInOut(duration: 2.0)) {
                nyfw_scale += 0.45
                nyfw_y -= 95
                nyfw_blur += 5.0
                raychel_normal_opac += 1.0
            }
        }
    }
}

struct Prologue_Room_Mad_Previews: PreviewProvider {
    static var previews: some View {
        Prologue_Room_Mad(mainOnTap: .constant(false))
    }
}
