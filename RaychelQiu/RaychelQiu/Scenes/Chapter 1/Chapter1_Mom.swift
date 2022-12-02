//
//  Chapter1_Mom.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 14/11/22.
//

import SwiftUI

struct Chapter1_Mom: View {
    
    @Binding var mainOnTap: Bool
    @State var onTap = false
    @State var scene = 1
    
    //Scene1
    @State var door_normal = 1.0
    @State var handle_up_opac = 1.0
    @State var handle_down_opac = 0.0
    @State var door_open_opac = 0.0
    @State var door_open_mini_opac = 0.0
    
    //Scene2
    @State var mom_opacity = 0.0
    @State var mom_scale = 1.0
    @State var mom_y = 0.0
    @State var mom_scaled_opac = 0.0
    @State var mom_scaled_scale = 0.6
    @State var mom_scaled_y = -90.0
    @Binding var mom_scaled_x: Double
    @State var door_scaled_scale = 1.0
    @State var door_scaled_y = 0.0
    
    var body: some View {
        GeometryReader{geometry in
            ZStack{
                Image("Border")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 330, height: 449.6)
                    .offset(y: -102)
                
                
                ZStack{
                    Image("Chapter1_BG")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                                 
                    //Scene1
                    if scene == 1 || scene == 2 {
                        ZStack{
                            Image("Chapter1_Door_Normal")
                                .resizable()
                                .scaledToFit()
                                .opacity(door_normal)
                            Image("Chapter1_Handle_Up")
                                .resizable()
                                .scaledToFit()
                                .opacity(handle_up_opac)
                            Image("Chapter1_Handle_Down")
                                .resizable()
                                .scaledToFit()
                                .opacity(handle_down_opac)
                            Image("Chapter1_Door_Open")
                                .resizable()
                                .scaledToFit()
                                .opacity(door_open_opac)
                            Image("Chapter1_BG")
                                .resizable()
                                .scaledToFit()
                                .opacity(door_open_mini_opac)
                            Image("Chapter1_Door_Open_Mini")
                                .resizable()
                                .scaledToFit()
                                .opacity(door_open_mini_opac)
                                .scaleEffect(door_scaled_scale)
                                .offset(x: mom_scaled_x, y: door_scaled_y)
                        }
                        .onAppear{
                            chapter1_room_scene1_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
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
                    
                    if scene == 2{
                        ZStack{
                            Image("Chapter1_Mom")
                                .resizable()
                                .scaledToFit()
                                .opacity(mom_opacity)
                                .scaleEffect(mom_scale)
                                .offset(y: mom_y)
                            Image("Chapter1_Mom_Scaled")
                                .resizable()
                                .scaledToFit()
                                .opacity(mom_scaled_opac)
                                .scaleEffect(mom_scaled_scale)
                                .offset(x: mom_scaled_x, y: mom_scaled_y)
                        }
                        .onAppear{
                            chapter1_room_scene2_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 5.5) {
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
            }
        }
    }
    
    func chapter1_room_scene1_in(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(.easeInOut(duration: 0.7)) {
                handle_up_opac -= 1.0
                handle_down_opac += 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeInOut(duration: 0.7)) {
                handle_up_opac -= 1.0
                handle_down_opac += 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation(.easeInOut(duration: 0.7)) {
                door_open_opac += 1.0
                handle_down_opac -= 1.0
                door_normal -= 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                door_normal -= 1.0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            withAnimation(.easeInOut(duration: 0.7)) {
                door_open_opac -= 1.0
                door_open_mini_opac += 1.0
            }
        }
    }
    
    func chapter1_room_scene2_in(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(.easeInOut(duration: 1.0)) {
                mom_opacity += 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation(.easeInOut(duration: 2.2)) {
                mom_scale += 1.5
                mom_y += 250
                door_scaled_y += 250
                door_scaled_scale += 1.3
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            withAnimation(.easeInOut(duration: 2.0)) {
                mom_scaled_opac += 1.0
                mom_scaled_scale += 0.1
                mom_scaled_y += 5
                mom_opacity -= 1.0
            }
        }
    }
}

struct Chapter1_Mom_Previews: PreviewProvider {
    static var previews: some View {
        Chapter1_Mom(mainOnTap: .constant(false), mom_scaled_x: .constant(0.0))
    }
}
