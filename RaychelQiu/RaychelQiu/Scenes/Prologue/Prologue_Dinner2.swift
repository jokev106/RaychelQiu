//
//  Prologue_Dinner2.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 08/11/22.
//

import SwiftUI

struct Prologue_Dinner2: View {
    
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
    @State var raychel_stand_opac = 0.0
    @State var raychel_stand_x = 0.0
    @State var raychel_back_opac = 1.0
    
    var body: some View {
        
        GeometryReader{ geometry in
            ZStack{
                Image("Border")
                    .resizable()
//                    .scaledToFit()
//                    .scaleEffect(0.92)
//                    .offset(y: -geometry.size.height * 0.151)
                    .frame(width: 361, height: 491)
                    .offset(y: -114)
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
                        if scene == 2 || scene == 3 || scene == 4 {
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
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
                                            scene += 1
                                        }
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
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.7) {
                                        onTap = true
                                    }
                                }
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
                                .opacity(raychel_back_opac)
                                .onAppear{
                                    prologue_dinner_scene4_in()
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 10.7) {
                                        mainOnTap = true
                                    }
                                }
                            Image("Dinner_Raychel_Stand")
                                .resizable()
                                .scaledToFit()
                                .opacity(raychel_stand_opac)
                                .offset(x: raychel_stand_x)
                        }
                        
                    }
                    
                    
                }
                .mask {
                    Image("Day")
                        .resizable()
                        .scaledToFit()
                }
                .scaleEffect(geometry.size.width * 0.00356)
                .offset(y: geometry.size.height * 0.026)
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

    }
    
    func prologue_dinner_scene3_out(){
        parent_visible_x = -250.0
        raychel_back_x = 250.0
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 1.5)) {
                law_y += 100
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 1.5)) {
                raychel_visible_x += 250
            }
        }

    }
    
    func prologue_dinner_scene4_in(){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
            withAnimation(.easeOut(duration: 1.5)) {
                table_shadow_opac += 1.0
                table_shadow_y -= 150
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeOut(duration: 1.5)) {
                parent_visible_x += 250.0
                raychel_back_x -= 250.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
            withAnimation(.easeInOut(duration: 1.5)) {
                raychel_stand_opac += 1.0
                raychel_back_opac -= 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 8.0) {
            withAnimation(.easeInOut(duration: 1.5)) {
                raychel_stand_opac -= 1.0
                raychel_stand_x += 100
            }
        }
    }
    
}

struct Prologue_Dinner2_Previews: PreviewProvider {
    static var previews: some View {
        Prologue_Dinner2(mainOnTap: .constant(false), parent_visible_x: .constant(0.0))
    }
}
