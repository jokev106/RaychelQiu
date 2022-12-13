//
//  Chapter2_Collection.swift
//  RaychelQiu
//
//  Created by Jonathan Valentino on 14/11/22.
//

import SwiftUI

struct Chapter2_Collection: View {
    @State var scene = 1
    @State var onTap = false
    @State var mainOnTap = false
    
    @Binding var scene_blur: CGFloat
    @Binding var transitions: CGFloat
    @Binding var chapter: Int
    @Binding var dialog_scale: CGFloat
    @Binding var dialog_opacity: CGFloat
    
    //Scene1
    @State var scene_1_offset_x = 0.0
    
    //Scene2
    @State var scene_2_offset_x = 400.0
    @State var scene_2_x = -100.0
    
    //Scene3
    @State var scene_3_offset_x = 400.0
    @State var scene_3_x = -100.0
    @State var group_3_x = 0.0
    
    //Scene4
    @State var scene_4_offset_x = 400.0
    @State var scene_4_x = -100.0
    @State var scene_4_blur = 0.0
    
    //Scene5
    @State var scene_5_offset_x = 0.0
    @State var group_5_x = 10.0
    @State var group2_5_x = 0.0
    
    //Scene 6
    @State var scene_6_offset_x = 400.0
    @State var positionRaychelAnger = CGPoint(x: 248, y: 342)
    @State var hardBrokenMax: String? = nil
    
    //Scene 7
    @State var scene_7_offset_x = 400.0
    @State var group_7_x = -50.0
    
    //Scene8
    @State var scene_8_offset_x = 400.0
    @State var moveableClothes = false
    @State var moveableSketchBook = false
    @State var moveablePencilCase = false
    @State var moveableMakeUp = false
    @State var moveableCamera = false
    
    // EndChapter
    @State var end_opacity = 0.0
    @State var scene_opacity = 1.0
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack {
//                Image("StoryBG")
//                    .resizable()
//                    .ignoresSafeArea(.all)
                
                if scene == 1 || scene == 2 {
                    Chapter2_Calendar(mainOnTap: $mainOnTap)
                        .offset(x: scene_1_offset_x)
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
                }
                
                if scene == 2 || scene == 3 {
                    Chapter2_Bus(scene: 1, mainOnTap: $mainOnTap, scene_1_x: $scene_2_x, group_2_x: $scene_4_x, blur_2_x: $scene_4_blur)
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
                                        scene_2_x = 100.0
                                    }
                                }
                            }
                        }
                }
                
                if scene == 3 || scene == 4 {
                    Chapter2_TM(scene: 1, mainOnTap: $mainOnTap, scene_1_x: $scene_3_x, group_3_x: $group_3_x)
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                withAnimation(.easeInOut(duration: 2)) {
                                    scene_3_offset_x -= 400
                                    scene_3_x = 0.0
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
                                        group_3_x = 100.0
                                    }
                                }
                            }
                        }
                }
                
                if scene == 4 || scene == 5 {
                    Chapter2_Bus(scene: 2, mainOnTap: $mainOnTap, scene_1_x: $scene_2_x, group_2_x: $scene_4_x, blur_2_x: $scene_4_blur)
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                withAnimation(.easeInOut(duration: 2)) {
                                    scene_4_offset_x -= 400
                                    scene_4_x = 0.0
                                }
                            }
                        }
                        .offset(x: scene_4_offset_x)
                        .onTapGesture{
                            if mainOnTap == true {
                                mainOnTap = false
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    scene += 1
                                    withAnimation(.easeInOut(duration: 2.0)) {
                                        scene_4_blur = 5.0
                                    }
                                }
                            }
                        }
                }
                
                if scene == 5 || scene == 6 {
                    Chapter2_Home(scene: 1, mainOnTap: $mainOnTap, group_1_x: $group_5_x, group2_1_x: $group2_5_x, group_2_x: $group_7_x)
                        .offset(x: scene_5_offset_x)
                        .onTapGesture{
                            if mainOnTap == true {
                                mainOnTap = false
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    scene += 1
                                    withAnimation(.easeInOut(duration: 2)) {
                                        scene_5_offset_x -= 400
                                        group_5_x = 70.0
                                        group2_5_x = 30.0
                                    }
                                }
                            }
                        }
                }
                
                if scene == 6 || scene == 7 {
                    MiniGame2_MomBubbleChat(positionRaychelAnger: $positionRaychelAnger, heartBrokenMax: $hardBrokenMax)
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                withAnimation(.easeInOut(duration: 2)) {
                                    scene_6_offset_x -= 400
                                    positionRaychelAnger.x -= 50
                                }
                            }
                        }
                        .offset(x: scene_6_offset_x)
                        .onTapGesture{
                            if hardBrokenMax == "HeartBroken_6" {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    scene += 1
                                    withAnimation(.easeInOut(duration: 2)) {
                                        scene_6_offset_x -= 400
                                        positionRaychelAnger.x -= 50
                                    }
                                }
                            }
                        }
                }
                
                if scene == 7 || scene == 8 {
                    Chapter2_Home(scene: 2, mainOnTap: $mainOnTap, group_1_x: $group_5_x, group2_1_x: $group2_5_x, group_2_x: $group_7_x)
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                withAnimation(.easeInOut(duration: 2)) {
                                    scene_7_offset_x -= 400
                                    group_7_x = 0.0
                                }
                            }
                        }
                        .offset(x: scene_7_offset_x)
                        .onTapGesture{
                            if mainOnTap == true {
                                mainOnTap = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    scene += 1
                                    withAnimation(.easeInOut(duration: 2)) {
                                        scene_7_offset_x -= 400
                                        group_7_x = 50
                                    }
                                }
                            }
                        }
                }
                
                if scene == 8 || scene == 9 {
                    Minigame3_Packing(moveableClothes: $moveableClothes, moveableSketchBook: $moveableSketchBook, moveablePencilCase: $moveablePencilCase, moveableMakeUp: $moveableMakeUp, moveableCamera: $moveableCamera)
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                withAnimation(.easeInOut(duration: 2)) {
                                    scene_8_offset_x -= 400
                                }
                            }
                        }
                        .offset(x: scene_8_offset_x)
                        .onTapGesture{
                            if moveableClothes == true && moveableSketchBook == true && moveablePencilCase == true && moveableMakeUp == true && moveableCamera == true {
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                                    scene += 1
//                                    withAnimation(.easeInOut(duration: 2)) {
//                                        scene_8_offset_x -= 400
//                                    }
                                    endChapter()
                                }
                            }
                        }
                }
                
                Button {
                    openAlert()
                } label: {
                    Image("pause")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                }
                .position(x: 30, y: 10)
            }
            .opacity(scene_opacity)
            
            ZStack {
                Text("End of Chapter 2")
                    .position(x: 198, y: 400)
                    .font(Font.custom("Hansip", size: 25))
                    .foregroundColor(.black)
                Button {
//                    CoreDataManager.instance.editChapter(chapter: 3)
                    transition()
                        
                } label: {
                    Text("Back to Chapter Select")
                        .font(Font.custom("Hansip", size: 25))
                        .foregroundColor(Color("buttonColor"))
                }.frame(width: 200, height: 150)
                    .position(x: 198, y: 500)
            }
            .opacity(end_opacity)
        }
    }
    
    func startChapter() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 1.5)) {
                scene_opacity = 1.0
            }
        }
    }
    
    func endChapter() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 2.0)) {
                scene_opacity = 0.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeInOut(duration: 1.9)) {
                end_opacity = 1.0
            }
        }
    }
    
    func transition() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 2.0)) {
                transitions = 0.0
                end_opacity = 0.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            chapter = -1
            withAnimation(.easeInOut(duration: 1.5)) {
                transitions = 1.0
            }
        }
    }
    
    func openAlert() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 1)) {
                dialog_scale = 0.8
                dialog_opacity = 1.0
                scene_blur = 20.0
            }
        }
    }
}

struct Chapter2_Collection_Previews: PreviewProvider {
    static var previews: some View {
        Chapter2_Collection(scene_blur: .constant(0.0), transitions: .constant(0.0), chapter: .constant(2), dialog_scale: .constant(0.0), dialog_opacity: .constant(0.0))
    }
}
