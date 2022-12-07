//
//  Chapter3_Collection.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 17/11/22.
//

import SwiftUI

struct Chapter3_Collection: View {
    
    @State var scene = 3
    @State var onTap = false
    @State var mainOnTap = false
    
    //Scene1
    @State var scene1_paralax_x = 50.0
    @State var scene1_offset_x = 0.0
    
    //Scene2
    @State var scene2_offset_x = 400.0
    @State var scene2_lift_x = -70.0
    
    //Scene3
    @State var scene3_x = 0.0
    
    var body: some View {
        GeometryReader{ geometry in
            Image("StoryBG")
                .resizable()
                .ignoresSafeArea(.all)

            if scene == 1 || scene == 2 {
                Chapter3_Phone(mainOnTap: $mainOnTap, scene1_paralax_x: $scene1_paralax_x)
                    .onTapGesture{
                        if mainOnTap == true{
                            mainOnTap = false
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                withAnimation(.easeInOut(duration: 2)) {
                                    scene1_paralax_x += 70
                                    scene1_offset_x -= 400
                                }
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                scene += 1
                            }
                        }
                        
                    }
                    .offset(x: scene1_offset_x)
            }
            
            if scene == 2 || scene == 3 {
                Chapter3_Lift(mainOnTap: $mainOnTap, scene2_lift_x: $scene2_lift_x)
                    .onAppear{
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
                                        scene2_lift_x += 70
                                    }
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    scene += 1
                                }
                            }
                            
                        }
                    }
                }
            
            if scene == 3 || scene == 4{
                Chapter3_FrontDoor(mainOnTap: $mainOnTap, scene3_x: $scene3_x)
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
                        if mainOnTap == true{
                            mainOnTap = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                withAnimation(.easeInOut(duration: 2)) {
                                    scene1_offset_x -= 400
                                    scene3_x += 70
                                }
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                scene += 1
                            }
                        }

                    }
                    .offset(x: scene1_offset_x)
            }
            
            if scene == 4 || scene == 5{
                Chapter3_Bed(mainOnTap: $mainOnTap, scene_offset_x: $scene2_lift_x)
                    .onAppear{
                        scene2_lift_x = 0.0
                        scene2_offset_x = 400
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            withAnimation(.easeInOut(duration: 2)) {
                                scene2_offset_x -= 400
                            }
                        }
                        
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
//                            onTap = true
//                        }
                    }
                    .offset(x: scene2_offset_x)
                    .onTapGesture {
                        withAnimation{
                            if mainOnTap == true{
                                mainOnTap = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    withAnimation(.easeInOut(duration: 2)) {
                                        scene2_offset_x -= 400
                                        scene2_lift_x += 70
                                    }
                                }

                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    scene += 1
                                }
                            }
                            
                        }
                    }
                }
            
            if scene == 5 || scene == 6{
                Game4_2View(scene_main: $scene, scene_frame: $scene1_offset_x)
                    .onAppear{
                        scene1_offset_x = 400.0
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            withAnimation(.easeInOut(duration: 2)) {
                                scene1_offset_x -= 400
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                            onTap = true
                        }
                    }
                    .offset(x: scene1_offset_x)
            }
            
            if scene == 6 || scene == 7{
                Chapter3_Call(mainOnTap: $mainOnTap)
                    .onAppear{
                        scene2_offset_x = 400
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            withAnimation(.easeInOut(duration: 2)) {
                                scene2_offset_x -= 400
                            }
                        }
                    }
                    .offset(x: scene2_offset_x)
                    .onTapGesture {
                        withAnimation{
                            if mainOnTap == true{
                                mainOnTap = false
                                
                            }
                            
                        }
                    }
                }
        }
    }
}

struct Chapter3_Collection_Previews: PreviewProvider {
    static var previews: some View {
        Chapter3_Collection()
    }
}
