//
//  Chapter4_Collection.swift
//  RaychelQiu
//
//  Created by Jonathan Valentino on 23/11/22.
//

import SwiftUI

struct Chapter4_Collection: View {
    @State var scene = 1
    @State var onTap = false
    @State var mainOnTap = false
    
    //Scene1
    @State var scene_1_offset_x = 0.0
    
    //Scene2
    @State var scene_2_offset_x = 400.0
    @State var scene_2_x = -100.0
    
    //Scene3
    @State var scene_3_offset_x = 400.0
    
    //Scene4
    @State var scene_4_offset_x = 400.0
    
    //Scene5
    @State var scene_5_offset_x = 400.0
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack {
                Image("StoryBG")
                    .resizable()
                    .ignoresSafeArea(.all)
                
                if scene == 1 || scene == 2 {
                    Chapter4_Calendar(mainOnTap: $mainOnTap)
                        .onTapGesture{
                            if mainOnTap == true {
                                mainOnTap = false
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    scene += 1
                                    withAnimation(.easeInOut(duration: 2)) {
                                        scene_1_offset_x -= 400
                                    }
                                }
                            }
                            
                        }
                        .offset(x: scene_1_offset_x)
                }
                
                if scene == 2 || scene == 3 {
                    Chapter4_Apartment(scene: 1, mainOnTap: $mainOnTap)
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                withAnimation(.easeInOut(duration: 2)) {
                                    scene_2_offset_x -= 400
                                    scene_2_x = 0.0
                                }
                            }
                        }
                        .offset(x: scene_2_offset_x)
                        .onTapGesture{
                            if mainOnTap == true {
                                mainOnTap = false
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    scene += 1
                                    withAnimation(.easeInOut(duration: 2)) {
                                        scene_2_offset_x -= 400
                                    }
                                }
                            }
                        }
                }
                
                if scene == 3 || scene == 4 {
                    Chapter4_Shop(mainOnTap: $mainOnTap)
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                withAnimation(.easeInOut(duration: 2)) {
                                    scene_3_offset_x -= 400
                                }
                            }
                        }
                        .offset(x: scene_3_offset_x)
                        .onTapGesture{
                            if mainOnTap == true {
                                mainOnTap = false
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    scene += 1
                                    withAnimation(.easeInOut(duration: 2)) {
                                        scene_3_offset_x -= 400
                                    }
                                }
                            }
                        }
                }
                
                if scene == 4 || scene == 5 {
                    Chapter4_Mall(mainOnTap: $mainOnTap)
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                withAnimation(.easeInOut(duration: 2)) {
                                    scene_4_offset_x -= 400
                                }
                            }
                        }
                        .offset(x: scene_4_offset_x)
                        .onTapGesture{
                            if mainOnTap == true {
                                mainOnTap = false
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    scene += 1
                                    withAnimation(.easeInOut(duration: 2)) {
                                        scene_4_offset_x -= 400
                                    }
                                }
                            }
                        }
                }
                
                if scene == 5 || scene == 6 {
                    Chapter4_Apartment(scene: 2, mainOnTap: $mainOnTap)
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                withAnimation(.easeInOut(duration: 2)) {
                                    scene_5_offset_x -= 400
                                }
                            }
                        }
                        .offset(x: scene_5_offset_x)
                        .onTapGesture{
                            if mainOnTap == true {
                                mainOnTap = false
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    scene += 1
                                    withAnimation(.easeInOut(duration: 2)) {
                                        scene_5_offset_x -= 400
                                    }
                                }
                            }
                        }
                }
                
                if scene == 6 || scene == 7 {
                    Chapter4_Apartment(scene: 3, mainOnTap: $mainOnTap)
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                withAnimation(.easeInOut(duration: 2)) {
                                    scene_5_offset_x -= 400
                                }
                            }
                        }
                        .offset(x: scene_5_offset_x)
                        .onTapGesture{
                            if mainOnTap == true {
                                mainOnTap = false
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    scene += 1
                                    withAnimation(.easeInOut(duration: 2)) {
                                        scene_5_offset_x -= 400
                                    }
                                }
                            }
                        }
                }
                
                if scene == 7 || scene == 8 {
                    
                }
                
                if scene == 8 || scene == 9 {
                    
                }
            }
        }
    }
}

struct Chapter4_Collection_Previews: PreviewProvider {
    static var previews: some View {
        Chapter4_Collection()
    }
}
