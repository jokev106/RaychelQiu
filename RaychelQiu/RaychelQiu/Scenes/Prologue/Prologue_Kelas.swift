//
//  Chapter1_Kelas.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 08/11/22.
//

import SwiftUI

struct Prologue_Kelas: View {
    
    @State var scene = 1
    @State var onTap = false
    @Binding var mainOnTap: Bool
    
    //Scene1
    @State var raychel_1_x = 300.0
    @State var raychel_1_y = 0.0
    @State var raychel_1_opac = 1.0
    @State var table_1_opacity = 0.0
    @State var table_1_y = 0.0
    @State var bulletin_1_opacity = 0.0
    @State var paper_1_opacity = 1.0
    @State var paper_1_x = -115.0
    @State var paper_1_y = 60.0
    
    //Scene2
    @State var raychel_nunduk_opac = 0.0
    @State var raychel_ndangak_opac = 0.0
    @State var raychel_hi_opac = 0.0
    
    //Scene3
    @State var item_scale = 1.0
    @State var item_y = 0.0
    @State var item_x = 0.0
    @State var item_opac = 1.0
    @State var raychel_small_opac = 0.0
    @State var friend_1_x = 120.0
    @State var bulletin_scale = 1.32
    @State var bulletin_x = 40.0
    @State var bulletin_2_opac = 0.0
    
    //Scene4
    @State var friend_1_opac = 1.0
    @State var friend_2_opac = 0.0
    @Binding var friend_2_x: Double
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                Image("Border")
                    .resizable()
//                    .scaledToFit()
//                    .scaleEffect(0.92)
                    .frame(width: 330, height: 449.6)
                    .offset(y: -102)
                ZStack{
                    Image("School_BG")
                        .resizable()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    
                    //Scene1
                    if scene == 1 || scene == 2 || scene == 3 || scene == 4{
                        ZStack{
                            Image("School_Bulletin")
                                .resizable()
                                .scaledToFit()
                                .opacity(bulletin_1_opacity)
                            Image("School_Bulletin_Small")
                                .resizable()
                                .scaledToFit()
                                .opacity(bulletin_2_opac)
//                                .scaleEffect(bulletin_scale)
                                .offset(x: friend_2_x)
                            ZStack{
                                Image("School_Table")
                                    .resizable()
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                    .opacity(table_1_opacity)
                                    .offset(y: table_1_y)
                                Image("School_Paper")
                                    .resizable()
                                    .scaledToFit()
                                    .opacity(paper_1_opacity)
                                    .offset(x: paper_1_x, y: paper_1_y)
                            }
//                            .scaleEffect(item_scale, anchor: .bottomLeading)
//                            .offset(y: item_y)
                            .opacity(item_opac)
                            Image("School_Raychel")
                                .resizable()
                                .scaledToFit()
                                .offset(x: raychel_1_x, y: raychel_1_y)
                                .opacity(raychel_1_opac)
                            
                        }
                        .onAppear{
                            chapter1_kelas_scene1_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
                                onTap = true
                            }
                        }
                        .onTapGesture {
                            if onTap == true {
                                onTap = false
                                scene += 1
                            }
                        }
                        
                    }
                    
                    //Scene2
                    if scene == 2 || scene == 3{
                        ZStack{
                            Image("School_Raychel_Nunduk")
                                .resizable()
                                .scaledToFit()
                                .opacity(raychel_nunduk_opac)
                            Image("School_Raychel_Ndangak")
                                .resizable()
                                .scaledToFit()
                                .opacity(raychel_ndangak_opac)
                            Image("School_Raychel_Hi")
                                .resizable()
                                .scaledToFit()
                                .opacity(raychel_hi_opac)
//                                .scaleEffect(item_scale, anchor: .bottomLeading)
//                                .offset(y: item_y)
                                .opacity(item_opac)
                        }
                        .onAppear{
                            chapter1_kelas_scene2_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 6.5) {
                                onTap = true
                            }
                        }
                        .onTapGesture {
                            if onTap == true {
                                onTap = false
                                scene += 1
                            }
                        }
                        
                    }
                    
                    //Scene3
                    if scene == 3 || scene == 4{
                        ZStack{
                            Image("School_Raychel_Right")
                                .resizable()
                                .scaledToFit()
                                .opacity(raychel_small_opac)
                                .offset(x: friend_2_x)
                            Image("School_Table_Small")
                                .resizable()
                                .scaledToFit()
                                .opacity(raychel_small_opac)
                                .offset(x: friend_2_x)
                            Image("School_Paper")
                                .resizable()
                                .scaledToFit()
                                .opacity(raychel_small_opac)
                                .offset(x: paper_1_x, y: paper_1_y)
                                .scaleEffect(item_scale, anchor: .bottomLeading)
                                .offset(x: item_x, y: item_y)
                            Image("School_Friend_Paper")
                                .resizable()
                                .scaledToFit()
                                .offset(x: friend_1_x)
                                .opacity(friend_1_opac)
                        }
                        .onAppear{
                            chapter1_kelas_scene3_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4.7) {
                                onTap = true
                            }
                        }
                        .onTapGesture {
                            if onTap == true {
                                onTap = false
                                scene += 1
                            }
                        }
                    }
                    
                    //Scene4
                    if scene == 4 {
                        ZStack{
                            Image("School_Friend_Ask")
                                .resizable()
                                .scaledToFit()
                                .opacity(friend_2_opac)
                                .offset(x: friend_2_x)
                        }
                        .onAppear{
                            chapter1_kelas_scene4_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                mainOnTap = true
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
    //            }
                
                
            }
            
        }
    
    }
    
    func chapter1_kelas_scene1_in() {
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 1)) {
                bulletin_1_opacity += 1
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            withAnimation(.easeInOut(duration: 1)) {
                table_1_opacity += 1
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            withAnimation(.easeInOut(duration: 1.8)) {
                raychel_1_x -= 300
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.8) {
            withAnimation(.easeInOut(duration: 1.7)) {
                paper_1_x += 115
                paper_1_y -= 60
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                SFXManager.instance.playSFX(sound: .paperSlide2)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
            withAnimation(.linear(duration: 1.0)) {
                SFXManager.instance.playSFX(sound: .drawing)
            }
        }
    }
    
    func chapter1_kelas_scene2_in() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(.easeInOut(duration: 1)) {
                raychel_nunduk_opac += 1
                raychel_1_opac -= 1
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            withAnimation(.easeInOut(duration: 1)) {
                raychel_nunduk_opac -= 1
                raychel_ndangak_opac += 1
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            withAnimation(.easeInOut(duration: 1)) {
                raychel_ndangak_opac -= 1
                raychel_hi_opac += 1
            }
        }
    }
    
    func chapter1_kelas_scene3_in() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//            withAnimation(.easeInOut(duration: 2)) {
//                item_scale -= 0.32
//                item_y -= 93.0
//                bulletin_scale -= 0.32
//                bulletin_x -= 40
//            }
//        }
        
        item_scale -= 0.36
        item_y -= 103.0
        item_x += 30.0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(.easeInOut(duration: 1)) {
                item_opac -= 1.0
                raychel_small_opac += 1.0
                bulletin_1_opacity -= 1.0
                bulletin_2_opac += 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            withAnimation(.easeInOut(duration: 2)) {
                friend_1_x -= 120
            }
        }
        
    }
    
    func chapter1_kelas_scene4_in(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(.easeInOut(duration: 1)) {
                friend_1_opac -= 1.0
                friend_2_opac += 1.0
            }
        }
    }
}

struct Prologue_Kelas_Previews: PreviewProvider {
    static var previews: some View {
        Prologue_Kelas(mainOnTap: .constant(false), friend_2_x: .constant(0.0))
    }
}
