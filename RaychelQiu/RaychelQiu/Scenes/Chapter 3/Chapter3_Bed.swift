//
//  Chapter3_Bed.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 21/11/22.
//

import SwiftUI

struct Chapter3_Bed: View {
    
    @Binding var mainOnTap: Bool
    @State var onTap = false
    @State var scene = 1
    
    //Scene1
    @State var scene1_x = -70.0
    @State var scene1_y = -10.0
    @State var scene1_scale = 1.0
    @State var scene1_opac = 1.0
    
    //Scene2
    @State var scene2_opac = 0.0
    @State var scene2_eye_opac = 0.0
    @State var scene2_vibration_opac = 0.0
    @State var scene2_vibration_x = 0.0
    @State var scene2_vibration_y = 0.0
    @State var scene2_lines_scale = 0.1
    @State var scene2_lines_x = -56.0
    @State var scene2_lines_y = -137.0
    
    //Scene3
    @State var scene3_opac = 0.0
    @State var scene3_utensil_opac = 0.0
    @State var scene3_phone_opac = 0.0
    @State var scene3_tea_opac = 0.0
    
    var body: some View {
        GeometryReader{geometry in
            ZStack{
                Image("Border")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 361, height: 491)
                    .offset(y: -114)
                
                
                ZStack{
                    Image("Chapter3_Sleep_BG")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    
                    //Scene1
                    if scene == 1 || scene == 2 {
                        ZStack{
                            Image("Chapter3_Sleep_Bed")
                                .resizable()
                                .scaledToFit()
                                .offset(x: scene1_x, y: scene1_y)
                                .scaleEffect(scene1_scale)
                                .opacity(scene1_opac)
                            Image("Chapter3_Sleep_Pillow")
                                .resizable()
                                .scaledToFit()
                                .offset(x: scene1_x, y: scene1_y)
                                .scaleEffect(scene1_scale)
                                .opacity(scene1_opac)
                            Image("Chapter3_Sleep_Raychel")
                                .resizable()
                                .scaledToFit()
                                .offset(x: scene1_x, y: scene1_y)
                                .scaleEffect(scene1_scale)
                                .opacity(scene1_opac)
                            Image("Chapter3_Sleep_Blanket")
                                .resizable()
                                .scaledToFit()
                                .offset(x: scene1_x, y: scene1_y)
                                .scaleEffect(scene1_scale)
                                .opacity(scene1_opac)
                            Image("Chapter3_Sleep_Phone")
                                .resizable()
                                .scaledToFit()
                                .offset(x: scene1_x, y: scene1_y)
                                .scaleEffect(scene1_scale)
                                .opacity(scene1_opac)
                        }
                        .onAppear{
                            chapter3_sleep_scene1_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
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
                            Image("Chapter3_Alarm_Bed")
                                .resizable()
                                .scaledToFit()
                                .opacity(scene2_opac)
                            Image("Chapter3_Alarm_Raychel")
                                .resizable()
                                .scaledToFit()
                                .opacity(scene2_opac)
                            Image("Chapter3_Alarm_Sheet")
                                .resizable()
                                .scaledToFit()
                                .opacity(scene2_opac)
                            Image("Chapter3_Alarm_Lines")
                                .resizable()
                                .scaledToFit()
                                .opacity(scene2_vibration_opac)
                                .scaleEffect(scene2_lines_scale)
                                .offset(x: scene2_lines_x, y:scene2_lines_y)
                            Image("Chapter3_Alarm_Phone")
                                .resizable()
                                .scaledToFit()
                                .opacity(scene2_opac)
                                .offset(x: scene2_vibration_x, y:scene2_vibration_y)
                            Image("Chapter3_Alarm_Eyes")
                                .resizable()
                                .scaledToFit()
                                .opacity(scene2_eye_opac)
                        }
                        .onAppear{
                            chapter3_sleep_scene2_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
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
                    
                    //Scene3
                    if scene == 3 || scene == 4 {
                        ZStack{
                            Image("Chapter3_Call_BG")
                                .resizable()
                                .scaledToFit()
                                .opacity(scene3_opac)
                            Image("Chapter3_Call_Phone")
                                .resizable()
                                .scaledToFit()
                                .opacity(scene3_phone_opac)
                            Image("Chapter3_Call_Tea")
                                .resizable()
                                .scaledToFit()
                                .opacity(scene3_tea_opac)
                            Image("Chapter3_Call_Utensils")
                                .resizable()
                                .scaledToFit()
                                .offset(y: -5)
                                .opacity(scene3_utensil_opac)
                        }
                        .onAppear{
                            chapter3_sleep_scene3_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
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
                .scaleEffect(geometry.size.width * 0.00356)
                .offset(y: geometry.size.height * 0.026)
            }
            
            
        }
    }
    
    func chapter3_sleep_scene1_in(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
            withAnimation(.easeInOut(duration: 2.0)) {
                scene1_x += 70.0
            }
        }
    }
    
    func chapter3_sleep_scene2_in(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeIn(duration: 2.0)) {
                scene1_scale += 0.5
                scene1_y += 50.0
//                scene1_opac -= 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(.easeInOut(duration: 1.5)) {
                scene2_opac += 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            withAnimation(.linear(duration: 0.2).repeatForever(autoreverses: true).speed(1.0)) {
                scene2_vibration_opac += 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            withAnimation(.linear(duration: 0.3).repeatForever(autoreverses: true).speed(1.0)) {
                scene2_vibration_x += 4
                scene2_vibration_y -= 2
                scene2_lines_x += 4
                scene2_lines_y -= 2
            }
        }
    }
    
    func chapter3_sleep_scene3_in(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
            withAnimation(.easeInOut(duration: 1.0)) {
                scene2_lines_x = -56.0
                scene2_lines_y = -137.0
                scene2_vibration_x = 0
                scene2_vibration_y = 0
                scene2_vibration_opac = 0.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 1.0)) {
                scene2_eye_opac += 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            withAnimation(.easeInOut(duration: 1.0)) {
                scene3_opac += 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            withAnimation(.easeInOut(duration: 1.0)) {
                scene3_utensil_opac += 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
            withAnimation(.easeInOut(duration: 1.0)) {
                scene3_tea_opac += 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            withAnimation(.easeInOut(duration: 1.0)) {
                scene3_phone_opac += 1.0
            }
        }
    }
}

struct Chapter3_Bed_Previews: PreviewProvider {
    static var previews: some View {
        Chapter3_Bed(mainOnTap: .constant(false))
    }
}
