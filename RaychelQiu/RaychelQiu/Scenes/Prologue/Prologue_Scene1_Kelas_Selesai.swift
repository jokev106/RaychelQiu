//
//  Scene1_Kelas_Selesai.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 28/10/22.
//

import SwiftUI

struct Prologue_Scene1_Kelas_Selesai: View {
    
    @State var scene = 1
    @State var onTap = false
    @Binding var mainOnTap: Bool
    
    //Scene1
    @State var raychel_1_x = 300.0
    @State var raychel_1_y = 0.0
    @State var table_1_opacity = 0.0
    @State var table_1_y = 0.0
    @State var bulletin_1_opacity = 0.0
    @State var paper_1_opacity = 0.0
    @State var paper_1_x = -115.0
    @State var paper_1_y = 60.0
    
    //Scene2
    @State var clock_2_y = -300.0
    @State var clock_2_x = 0.0
    @State var long_2_y_offset = -300.0
    @State var long_2_x_offset = 0.0
    @State var long_2_rotation = -50.0
    @State var short_2_y_offset = -300.0
    @State var short_2_x_offset = -2.0
    @State var short_2_rotation = 0.0
    
    //Scene3
    @State var raychel_stand_opac = 0.0
    @State var raychel_stand_x = 0.0
    @State var raychel_opac = 1.0
    @Binding var scene1_Prologue_Final: Bool
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                Image("Border")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(0.932)
                    .offset(y: -geometry.size.height * 0.150)
                ZStack{
                    Image("School_BG")
                        .resizable()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    
                    //Scene1
                    if scene == 1{
                        ZStack{
                            Image("School_Bulletin")
                                .resizable()
                                .scaledToFit()
                                .opacity(bulletin_1_opacity)
                            Image("School_Table")
                                .resizable()
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .opacity(table_1_opacity)
                                .offset(y: table_1_y)
                            Image("School_Paper")
                                .resizable()
                                .scaledToFit()
                            //                        .opacity(paper_1_opacity)
                                .offset(x: paper_1_x, y: paper_1_y)
                            Image("School_Raychel")
                                .resizable()
                                .scaledToFit()
                                .offset(x: raychel_1_x, y: raychel_1_y)
                            
                        }
                        .onAppear{
                            prologue_scene1_animation_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                                onTap = true
                            }
                        }
                        .onTapGesture {
                            if onTap == true {
                                onTap = false
                                prologue_scene1_animation_out()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                    scene += 1
                                }
                            }
                        }
                        
                    }
                    
                    //Scene2
                    if scene == 2{
                        ZStack{
                            Image("Clock")
                                .resizable()
                                .scaledToFit()
                                .offset(x: clock_2_x, y: clock_2_y)
                            Image("Clock_LongPoint")
                                .resizable()
                                .scaledToFit()
                            //                        .frame(width: 15)
                                .frame(width: geometry.size.width * 0.039)
                                .scaleEffect(1)
                                .rotationEffect(.degrees(long_2_rotation), anchor: .bottom)
                            //                        .position(x: 196.5, y: 242)
                                .position(x: geometry.size.width * 0.499, y: geometry.size.height * 0.318)
                                .offset(x: long_2_x_offset, y: long_2_y_offset)
                            
                            Image("Clock_ShortPoint")
                                .resizable()
                                .scaledToFit()
                            //                        .frame(width: 11)
                                .frame(width: geometry.size.width * 0.028)
                                .scaleEffect(1)
                                .offset(x: short_2_x_offset, y: short_2_y_offset)
                                .rotationEffect(.degrees(short_2_rotation), anchor: .bottom)
                            //                        .background(.red)
                            //                        .position(x: 196.5, y: 242)
                                .position(x: geometry.size.width * 0.499, y: geometry.size.height * 0.331)
                            
                        }
                        .onAppear{
                            prologue_scene2_animation_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 8.0) {
                                scene += 1
                            }
                        }
                    }
                    
                    //Scene3
                    if scene == 3{
                        ZStack{
                            Image("School_Bulletin")
                                .resizable()
                                .scaledToFit()
                                .opacity(bulletin_1_opacity)
                            Image("School_Raychel_Stand")
                                .resizable()
                                .scaledToFit()
                                .opacity(raychel_stand_opac)
                                .offset(x: raychel_stand_x)
                            Image("School_Table")
                                .resizable()
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .opacity(table_1_opacity)
                                .offset(y: table_1_y)
                            Image("School_Paper")
                                .resizable()
                                .scaledToFit()
                            //                        .opacity(paper_1_opacity)
                                .offset(x: paper_1_x, y: paper_1_y)
                            Image("School_Raychel")
                                .resizable()
                                .scaledToFit()
                                .offset(x: raychel_1_x, y: raychel_1_y)
                                .opacity(raychel_opac)
                            
                        }
                        .onAppear{
                            prologue_scene3_animation_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
                                prologue_scene1_animation_out()
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
                .scaleEffect(geometry.size.width * 0.00356)
                .offset(y: geometry.size.height * 0.026)
//                .background(Color.white)
    //            .mask{
    //                Image("FullScreen_Mask")
    //                    .resizable()
    //                    .scaledToFit()
    //            }
                
                
            }
            
        }
    }
    
    func prologue_scene1_animation_in() {
        
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
            withAnimation(.easeInOut(duration: 1)) {
                raychel_1_x -= 300
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeInOut(duration: 1)) {
//                paper_1_opacity = 1
                paper_1_x += 115
                paper_1_y -= 60
            }
        }
    }
    
    func prologue_scene1_animation_out() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 1)) {
                bulletin_1_opacity -= 1
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeIn(duration: 1.5)) {
                raychel_1_y += 300
                table_1_y += 300
                paper_1_y += 300
            }
        }
        
    }
    
    func prologue_scene2_animation_in() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
            withAnimation(.easeOut(duration: 1.5)) {
                clock_2_y += 300.0
                long_2_y_offset += 300.0
                short_2_y_offset += 300.0
            }
        }
        
        for i in 1...5{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25 + CGFloat(i) * 1.0) {
                withAnimation(.linear(duration: 1).speed(3.0)) {
                    long_2_rotation += 10.0
                }
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.25) {
            withAnimation(.linear(duration: 1).speed(3.0)) {
                short_2_rotation += 3.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
            withAnimation(.linear(duration: 0.2).repeatForever(autoreverses: true).speed(3.0)) {
                clock_2_x += 10.0
                long_2_x_offset += 10.0
                short_2_x_offset += 10.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 7.5) {
            withAnimation(.easeIn(duration: 0.5)) {
                clock_2_y -= 300.0
                long_2_y_offset -= 300.0
                short_2_y_offset -= 300.0
            }
        }
    }
        
    func prologue_scene3_animation_in() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 1)) {
                bulletin_1_opacity += 1
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeOut(duration: 1.0)) {
                raychel_1_y -= 300
                table_1_y -= 300
                paper_1_y -= 300
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeInOut(duration: 1)) {
                raychel_stand_opac += 1
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeIn(duration: 0.7)) {
                raychel_opac -= 1
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            withAnimation(.easeInOut(duration: 1.5)) {
                raychel_stand_x += 300
            }
        }
        
    }
}

struct Prologue_Scene1_Kelas_Selesai_Previews: PreviewProvider {
    static var previews: some View {
        Prologue_Scene1_Kelas_Selesai(mainOnTap: .constant(false), scene1_Prologue_Final: .constant(false))
    }
}
