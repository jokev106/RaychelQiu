//
//  Chapter2_TMBus.swift
//  RaychelQiu
//
//  Created by Jonathan Valentino on 14/11/22.
//

import SwiftUI

struct Chapter2_Bus: View {
    @State var scene = 2
    @State var onTap = false
    @Binding var mainOnTap: Bool
    
    // Scene1
    @State var bus_1_x = -400.0
    @State var raychel_1_opacity = 1.0
    
    // Scene2
    @State var bus_2_x = 400.0
    @State var raychel_2_opacity = 0.0
    @State var tired_2_rotation = 0.0
    @State var group_2_scale = 1.0
    @State var group_2_y = 0.0
    @State var group_2_x = 0.0

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
                        Group {
                            Image("Bus_BG")
                                .resizable()
                                .frame(width: geometry.size.width, height: geometry.size.height)
                            
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
                                .frame(width: 260)
                                .offset(y: 50)
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
                .onAppear {
                    chapter2_bus_scene1_in()
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
            
            if scene == 2 {
                ZStack {
                    Image("Border")
                        .resizable()
                        //                    .scaledToFit()
                        //                    .scaleEffect(0.92)
                        .frame(width: 361, height: 491)
                        .offset(y: -114)
                    
                    ZStack {
                        Group {
                            Image("Bus_BG")
                                .resizable()
                                .frame(width: geometry.size.width, height: geometry.size.height)
                            
                            Image("Bus_Scene")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 260)
                                .offset(y: -50)
                            
                            Image("Home_Raychel")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35)
                                .offset(y: -70)
                                .opacity(raychel_2_opacity)
                            
                            Image("Home_Tired")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15)
                                .rotationEffect(.degrees(tired_2_rotation))
                                .offset(x: -3, y: -140)
                                .opacity(raychel_2_opacity)
                            
                            Image("Bus_Left")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                                .offset(x: bus_2_x, y: -60)
                            
                            Image("Bus_Bush")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 260)
                                .offset(y: 50)
                        }
                        .scaleEffect(group_2_scale)
                        .offset(x: group_2_x, y: group_2_y)
                    }
                    .mask {
                        Image("Day")
                            .resizable()
                            .scaledToFit()
                    }
                    .scaleEffect(geometry.size.width * 0.00356)
                    .offset(y: geometry.size.height * 0.026)
                }
                .onAppear {
                    chapter2_bus_scene2_in()
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
        }
    }
    
    func chapter2_bus_scene1_in() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 3)) {
                bus_1_x = -75
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            raychel_1_opacity = 0.0
            withAnimation(.easeInOut(duration: 3)) {
                bus_1_x = 400
            }
        }
    }
    
    func chapter2_bus_scene2_in() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 3)) {
                bus_2_x = 75
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            raychel_2_opacity = 1.0
            withAnimation(.easeInOut(duration: 3)) {
                bus_2_x = -400
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
            withAnimation(.easeInOut(duration: 5)) {
                group_2_scale = 2.8
                group_2_y = 200
                group_2_x = 10
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
            tired_2_rotation = 140.0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 9) {
            tired_2_rotation = 80.0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            tired_2_rotation = 180
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 11) {
            tired_2_rotation = 140.0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 12) {
            tired_2_rotation = 80.0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 13) {
            tired_2_rotation = 180
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 14) {
            tired_2_rotation = 140.0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
            tired_2_rotation = 80.0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 16) {
            tired_2_rotation = 180
        }
//        withAnimation(.linear(duration: 0.15).repeatForever(autoreverses: true)) {
//            needlePosition = CGPoint(x: 0, y: -190)
//        }
    }
}

struct Chapter2_Bus_Previews: PreviewProvider {
    static var previews: some View {
        Chapter2_Bus(mainOnTap: .constant(false))
    }
}
