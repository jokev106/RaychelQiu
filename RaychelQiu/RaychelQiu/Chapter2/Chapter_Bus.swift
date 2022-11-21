//
//  Chapter2_TMBus.swift
//  RaychelQiu
//
//  Created by Jonathan Valentino on 14/11/22.
//

import SwiftUI

struct Chapter2_Bus: View {
    @State var scene: Int
    @State var onTap = false
    @Binding var mainOnTap: Bool
    
    // Scene1
    @Binding var scene_1_x: Double
//    @Binding var bush_1_x: Double
    @State var bus_1_x = -400.0
    @State var raychel_1_opacity = 1.0
    
    // Scene2
    @State var bus_2_x = 400.0
    @State var raychel_2_opacity = 0.0
    @State var raychel_2_scale = 1.0
    @State var raychel_2_y = -70.0
    @State var raychel_2_x = 0.0
    @State var tired_2_rotation = 0.0
    @State var group_2_scale = 1.0
    @State var group_2_y = 0.0
    @Binding var group_2_x: Double
    @Binding var blur_2_x: Double

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("Border")
                    .resizable()
//                    .scaledToFit()
//                    .scaleEffect(0.92)
                    .frame(width: 361, height: 491)
                    .offset(y: -114)
                
                ZStack {
                    if scene == 1 {
                        ZStack {
                            Group {
                                Image("Bus_BG")
                                    .resizable()
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                
                                Group {
                                    Image("Bus_Scene")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 260)
                                        .offset(y: -50)
                                    
                                    Image("Bus_Raychel")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 35)
                                        .offset(y: -70)
                                        .opacity(raychel_1_opacity)
                                    
                                    Image("Bus_Right")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 200)
                                        .offset(x: bus_1_x, y: -60)
                                    
                                    Image("Bus_Bush")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 350)
                                        .offset(y: 40)
                                }
                                .offset(x: scene_1_x)
                            }
                        }
                        
                        .onAppear {
                            chapter2_bus_scene1_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
                                mainOnTap = true
//                                onTap = true
                            }
                        }
//                        .onTapGesture {
//                            if onTap == true {
//                                onTap = false
//                                scene += 1
//                            }
//                        }
                    }
                    
                    if scene == 2 {
                        ZStack {
                            Group {
                                Image("Bus_BG")
                                    .resizable()
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                    .blur(radius: blur_2_x)
                                
                                Image("Bus_Scene")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 260)
                                    .offset(y: -50)
                                    .blur(radius: blur_2_x)
                                
                                Image("Home_Raychel")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 35)
                                    .offset(x: raychel_2_x, y: raychel_2_y)
                                    .scaleEffect(raychel_2_scale)
                                    .opacity(raychel_2_opacity)
                                
                                Image("Home_Tired")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15)
                                    .rotationEffect(.degrees(tired_2_rotation))
                                    .offset(x: -3, y: raychel_2_y - 80)
                                    .opacity(raychel_2_opacity)
                                
                                Image("Bus_Left")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 200)
                                    .offset(x: bus_2_x, y: -60)
                                
                                Image("Bus_Bush")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 350)
                                    .offset(y: 40)
                            }
                            .scaleEffect(group_2_scale)
                            .offset(x: group_2_x, y: group_2_y)
                        }
                        .onAppear {
                            chapter2_bus_scene2_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 12) {
                                mainOnTap = true
//                                onTap = true
                            }
                        }
//                        .onTapGesture {
//                            if onTap == true {
//                                onTap = false
//                                scene += 1
//                            }
//                        }
                    }
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
        }
    }
    
    func chapter2_bus_scene1_in() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeInOut(duration: 3)) {
                bus_1_x = -75
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
            raychel_1_opacity = 0.0
            withAnimation(.easeInOut(duration: 3)) {
                bus_1_x = 400
            }
        }
    }
    
    func chapter2_bus_scene2_in() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeInOut(duration: 3)) {
                bus_2_x = 75
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
            raychel_2_opacity = 1.0
            withAnimation(.easeInOut(duration: 3)) {
                bus_2_x = -400
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 9) {
            withAnimation(.easeInOut(duration: 5)) {
                raychel_2_scale = 1.1
                raychel_2_y = -50
                group_2_scale = 2.8
                group_2_y = 170
                group_2_x = 10
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            loopAnimation()
        }
    }
    
    func loopAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            tired_2_rotation = 140.0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            tired_2_rotation = 80.0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            tired_2_rotation = 180
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            loopAnimation()
        }
    }
}

struct Chapter2_Bus_Previews: PreviewProvider {
    static var previews: some View {
        Chapter2_Bus(scene: 2, mainOnTap: .constant(false), scene_1_x: .constant(0.0), group_2_x: .constant(0.0), blur_2_x: .constant(0.0))
    }
}
