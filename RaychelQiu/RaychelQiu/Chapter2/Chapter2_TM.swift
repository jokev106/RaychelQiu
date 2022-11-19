//
//  Chapter2_TM.swift
//  RaychelQiu
//
//  Created by Jonathan Valentino on 14/11/22.
//

import SwiftUI

struct Chapter2_TM: View {
    @State var scene: Int
    @State var onTap = false
    @Binding var mainOnTap: Bool
    
    // Scene1
    @State var stand_1_opacity = 1.0
    @State var stand_1_x = 100.0
    @State var stand_1_y = -70.0
    @State var sit_1_opacity = 0.0
    
    // Scene2
    @State var stage_2_opacity = 1.0
    @State var ppt_2_opacity = 0.0
    @State var ppt_2_blur = 5.0
    
    // Scene3
    @State var group_3_scale = 1.0
    @State var group_3_y = 0.0
    @State var group_3_x = 0.0
    @State var chat_3_scale = 0.4
    @State var chat_3_opacity = 0.0
    

    var body: some View {
        GeometryReader { geometry in
            if scene == 1 {
                ZStack {
                    Image("Border")
                        .resizable()
                    //                    .scaledToFit()
                    //                    .scaleEffect(0.92)
                        .frame(width: 361, height: 491)
                        .offset(y: -114)
                    
                    ZStack {
                        Image("TM_BG")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 265)
                            .offset(y: -100)
                        
                        Image("TM_Stand")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 110)
                            .offset(x: stand_1_x, y: stand_1_y)
                            .opacity(stand_1_opacity)
                        
                        Image("TM_Sit")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 90)
                            .offset(x: 50, y: -50)
                            .opacity(sit_1_opacity)
                        
                        Image("TM_Front")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 260)
                            .offset(y: -25)
                        
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .mask {
                        Image("Day")
                            .resizable()
                            .scaledToFit()
                    }
                    .scaleEffect(geometry.size.width * 0.00356)
                    .offset(y: geometry.size.height * 0.026)
                }
                .onAppear {
                    chapter2_TM_scene1_in()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
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
            
            if scene == 2 {
                ZStack {
                    Image("Border")
                        .resizable()
                    //                    .scaledToFit()
                    //                    .scaleEffect(0.92)
                        .frame(width: 361, height: 491)
                        .offset(y: -114)
                    
                    ZStack {
                        Image("Calendar_BG")
                            .resizable()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                        
                        Image("TM_Stage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 265)
                            .offset(y: -80)
                        
                        Image("TM_PPT")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                            .offset(x: 0, y: -190)
                            .opacity(ppt_2_opacity)
                            .blur(radius: ppt_2_blur)
                        
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .mask {
                        Image("Day")
                            .resizable()
                            .scaledToFit()
                    }
                    .scaleEffect(geometry.size.width * 0.00356)
                    .offset(y: geometry.size.height * 0.026)
                }
                .onAppear {
                    chapter2_TM_scene2_in()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
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
            
            if scene == 3 {
                ZStack {
                    Image("Border")
                        .resizable()
                    //                    .scaledToFit()
                    //                    .scaleEffect(0.92)
                        .frame(width: 361, height: 491)
                        .offset(y: -114)
                    
                    ZStack {
                        Group {
//                            Image("TM_BG")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 265)
//                                .offset(y: -100)
                            
                            
//                            Image("TM_Sit")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 90)
//                                .offset(x: 50, y: -50)
                            
                            Image("TM_Shock")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 217)
                                .offset(x: 25, y: -120)
                                .opacity(1.0)
                            
                            Image("TM_Chat")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70)
                                .scaleEffect(chat_3_scale, anchor: .bottomTrailing)
                                .offset(x: -20, y: -200)
                                .opacity(chat_3_opacity)
                            
//                            Image("TM_Front")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 260)
//                                .offset(y: -25)
                        }
                        .scaleEffect(group_3_scale)
                        .offset(x: group_3_x, y: group_3_y)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .mask {
                        Image("Day")
                            .resizable()
                            .scaledToFit()
                    }
                    .scaleEffect(geometry.size.width * 0.00356)
                    .offset(y: geometry.size.height * 0.026)
                }
                .onAppear {
                    chapter2_TM_scene3_in()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        mainOnTap = true
    //                    onTap = true
                    }
                }
    //            .onTapGesture {
    //                if onTap == true {
    //                    onTap = false
    //                    scene += 1
    //                }
    //            }
            }
        }
    }
    
    func chapter2_TM_scene1_in() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeInOut(duration: 3)) {
                stand_1_x = 50
//                raychel_1_y = 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            withAnimation(.easeInOut(duration: 2)) {
                stand_1_opacity = 0.0
                sit_1_opacity = 1.0
            }
        }
    }
    
    func chapter2_TM_scene2_in() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 3)) {
                ppt_2_opacity = 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(.easeInOut(duration: 3)) {
                ppt_2_blur = 0.0
            }
        }
    }
    
    func chapter2_TM_scene3_in() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 0)) {
                group_3_scale = 1.2
                group_3_y = 50
                group_3_x = -30
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeInOut(duration: 1)) {
                chat_3_scale = 1.0
                chat_3_opacity = 1.0
            }
        }
    }
}

struct Chapter2_TM_Previews: PreviewProvider {
    static var previews: some View {
        Chapter2_TM(scene: 3, mainOnTap: .constant(false))
    }
}
