//
//  Chapter1_Collection.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 08/11/22.
//

import SwiftUI

struct Chapter1_Collection: View {
    
    @State var scene = 0
    @State var onTap = false
    @State var mainOnTap = false
    
    //Scene0
    @State var moon_x = 0.0
    @State var night_x = 0.0
    
    //Scene1
    @State var scene1_offset_x = 400.0
    @State var scene1_paralax_x = 0.0
    @State var scene1_offset_y = 0.0
    
    //Scene2
    @State var scene2_offset_x = 0.0
    @State var scene2_offset_y = 800.0
    
    //Scene3
    @State var scene3_offset_y = 800.0
    
    //Scene4
    @State var scene4_paralax_x = 0.0
    
    //Scene5
    @State var mom_scaled_x = 0.0
    
    
    var body: some View {
        GeometryReader{ geometry in
            Image("StoryBG")
                .resizable()
                .ignoresSafeArea(.all)
            
            if scene == 0 || scene == 1 {
                Chapter1_Day(mainOnTap: $mainOnTap, moon_x: $moon_x, night_x: $night_x)
                    .offset(x: scene2_offset_x)
                    .onTapGesture {
                        withAnimation{
                            if mainOnTap == true{
                                mainOnTap = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    withAnimation(.easeInOut(duration: 2)) {
                                        scene2_offset_x -= 400
                                        moon_x += 100.0
                                        night_x += 150.0
                                    }
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    scene += 1
                                }
                            }
                            
                        }
                    }
            }
            
            if scene == 1 || scene == 2 {
                Chapter1_Bobok(mainOnTap: $mainOnTap, scene_x: $scene1_paralax_x)
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            withAnimation(.easeInOut(duration: 2)) {
                                scene1_offset_x -= 400
                            }
                        }
                    }
                    .onTapGesture{
                        if mainOnTap == true{
                            mainOnTap = false
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                withAnimation(.easeInOut(duration: 3)) {
//                                    scene1_paralax_x += 70
//                                    scene1_offset_x -= 400
                                    scene1_offset_y -= 800
                                }
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                scene += 1
                            }
                        }
                        
                    }
                    .offset(x: scene1_offset_x, y: scene1_offset_y)
            }
            
            if scene == 2 || scene == 3 {
                Game2View(scene_main: $scene, scene_frame: $scene2_offset_y)
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            withAnimation(.easeInOut(duration: 3)) {
//                                scene2_offset_x -= 400
                                scene2_offset_y -= 800
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                            onTap = true
                        }
                    }
                    .offset(y: scene2_offset_y)
                }
            
            if scene == 3 || scene == 4 {
                Game1_CaptchaPuzzle(scene_main: $scene, scene_frame: $scene2_offset_x)
                    .onAppear{
                        scene2_offset_x = 0
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                            withAnimation(.easeInOut(duration: 3)) {
                                scene3_offset_y -= 800
                            }
                        }
                    }
                    .onTapGesture{
                        if mainOnTap == true{
                            mainOnTap = false

                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                withAnimation(.easeInOut(duration: 2)) {
                                    scene2_offset_x -= 400
                                }
                            }

                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                scene += 1
                            }
                        }

                    }
                    .offset(x: scene2_offset_x, y: scene3_offset_y)
            }
            
            if scene == 4 || scene == 5 {
                Game4_1View(mainOnTap: $mainOnTap, scene1_paralax_x: $scene4_paralax_x, scene_main: $scene, scene_frame: $scene1_offset_x)
                    .onAppear{
                        scene1_offset_x = 400
                        scene4_paralax_x = -70
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            withAnimation(.easeInOut(duration: 2)) {
                                scene4_paralax_x += 70
                                scene1_offset_x -= 400
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                            onTap = true
                        }
                    }
//                    .onTapGesture{
//                        if mainOnTap == true{
//                            mainOnTap = false
//
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                                withAnimation(.easeInOut(duration: 2)) {
//                                    scene4_paralax_x += 70
//                                    scene1_offset_x -= 400
//                                }
//                            }
//
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                                scene += 1
//                            }
//                        }
//
//                    }
                    .offset(x: scene1_offset_x)
            }
            
            if scene == 5 || scene == 6 {
                Chapter1_Mom(mainOnTap: $mainOnTap, mom_scaled_x: $mom_scaled_x)
                    .onAppear{
                        scene2_offset_x = 400
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            withAnimation(.easeInOut(duration: 2)) {
                                scene2_offset_x -= 400
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                            onTap = true
                        }
                    }
                    .offset(x: scene2_offset_x)
                    .onTapGesture {
                        withAnimation{
                            if mainOnTap == true{
                                mainOnTap = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    withAnimation(.easeInOut(duration: 2)) {
                                        scene2_offset_x -= 400
                                        mom_scaled_x += 70
                                    }
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    scene += 1
                                }
                            }
                            
                        }
                    }
                }
            
            if scene == 6 {
                Chapter1_Sketch(mainOnTap: $mainOnTap)
                    .onAppear{
                        scene1_offset_x = 400
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            withAnimation(.easeInOut(duration: 2)) {
                                scene1_offset_x -= 400
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                            onTap = true
                        }
                    }
                    .onTapGesture{
//                        if mainOnTap == true{
//                            mainOnTap = false
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                                withAnimation(.easeInOut(duration: 2)) {
////                                    scene1_offset_x -= 400
//                                }
//                            }
//                        }

                    }
                    .offset(x: scene1_offset_x)
            }
            
        }
    }
}

struct Chapter1_Collection_Previews: PreviewProvider {
    static var previews: some View {
        Chapter1_Collection()
    }
}
