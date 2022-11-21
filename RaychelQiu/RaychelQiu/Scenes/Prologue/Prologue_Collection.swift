//
//  Chapter1_Collection.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 28/10/22.
//

import SwiftUI

struct Prologue_Collection: View {
    
    @State var scene = 1
    @State var onTap = false
    @State var mainOnTap = false
    @State var moveableBook = false
    
    //Scene1
    @State var scene1_Prologue_Final = false
    @State var scene1_offset_x = 0.0
    @State var raychel_stand_x = 0.0
    
    //Scene2
    @State var scene2_offset_x = 400.0
    @State var moon_x = 0.0
    @State var night_x = 0.0
    
    //Scene3
    @State var parent_visible_x = -250.0
    
    //Scene4
    @State var scene_change_x = 0.0
    
    //Scene5
    @State var friend_2_x = 0.0
    
    var body: some View {
        GeometryReader{ geometry in
            Image("StoryBG")
                .resizable()
                .ignoresSafeArea(.all)
            if scene == 1 || scene == 2 {
                Prologue_Scene1_Kelas_Selesai(mainOnTap: $mainOnTap, raychel_stand_x: $raychel_stand_x, scene1_Prologue_Final: $scene1_Prologue_Final, moveableBook: $moveableBook)
                    .onTapGesture{
                        if mainOnTap == true && self.moveableBook == true{
                            mainOnTap = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                withAnimation(.easeIn(duration: 2.5)) {
                                    raychel_stand_x += 300
                                }
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                withAnimation(.easeInOut(duration: 2)) {
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
                Prologue_Scene2_Transisi_Hari(mainOnTap: $mainOnTap, moon_x: $moon_x, night_x: $night_x)
                    .onAppear{
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
            
            if scene == 3 || scene == 4 {
                Prologue_Dinner(mainOnTap: $mainOnTap, parent_visible_x: $parent_visible_x)
                    .onAppear{
                        scene1_offset_x = 400
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
                                withAnimation(.easeInOut(duration: 2)) {
                                    scene1_offset_x -= 400
                                    parent_visible_x += 50.0
                                }
                            }

                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                scene += 1
                            }
                        }

                    }
                    .offset(x: scene1_offset_x)
            }
            
            if scene == 4 || scene == 5 {
                Prologue_Room(mainOnTap: $mainOnTap, scene_change_x: $scene_change_x)
                    .onAppear{
                        scene2_offset_x = 400
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            withAnimation(.easeInOut(duration: 2)) {
                                scene2_offset_x -= 400
                            }
                        }
                    }
                    .onTapGesture{
                        if mainOnTap == true{
                            mainOnTap = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                withAnimation(.easeInOut(duration: 2)) {
                                    scene2_offset_x -= 400
                                    scene_change_x += 50
                                }
                            }

                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                scene += 1
                            }
                        }

                    }
                    .offset(x: scene2_offset_x)
                }
            
            if scene == 5 || scene == 6 {
                Prologue_Kelas(mainOnTap: $mainOnTap, friend_2_x: $friend_2_x)
                    .onAppear{
                        scene1_offset_x = 400
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
                                withAnimation(.easeInOut(duration: 2)) {
                                    friend_2_x += 70
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
            
            if scene == 6 || scene == 7 {
                Prologue_Clock(mainOnTap: $mainOnTap)
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
                    }
                }
            
            if scene == 7 || scene == 8 {
                Prologue_Dinner2(mainOnTap: $mainOnTap, parent_visible_x: $parent_visible_x)
                    .onAppear{
                        scene1_offset_x = 400
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
                                withAnimation(.easeInOut(duration: 2)) {
                                    scene1_offset_x -= 400
                                    parent_visible_x += 50.0
                                }
                            }

                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                scene += 1
                            }
                        }

                    }
                    .offset(x: scene1_offset_x)
            }
            
            if scene == 8 {
                Prologue_Room_Mad(mainOnTap: $mainOnTap)
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
                    }
            }
        }
    }
}

struct Prologue_Collection_Previews: PreviewProvider {
    static var previews: some View {
        Prologue_Collection()
    }
}
