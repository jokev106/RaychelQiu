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
    @State var dialog_scale = 0.0
    @State var dialog_opacity = 0.0
    @State var scene_blur = 0.0
    @Binding var chapter: Int
    
    // Scene0
    @State var moon_x = 0.0
    @State var night_x = 0.0
    
    // Scene1
    @State var scene1_offset_x = 400.0
    @State var scene1_paralax_x = 0.0
    @State var scene1_offset_y = 0.0
    
    // Scene2
    @State var scene2_offset_x = 0.0
    @State var scene2_offset_y = 800.0
    
    // Scene3
    @State var scene3_offset_y = 800.0
    
    // Scene4
    @State var scene4_offset_x = 400.0
    @State var scene4_paralax_x = 0.0
    
    // Scene5
    @State var mom_scaled_x = 0.0
    
    // EndChapter
    @State var end_opacity = 0.0
    @State var scene_opacity = 0.0
    
    var body: some View {
        GeometryReader { _ in
            ZStack {
                Image("StoryBG")
                    .resizable()
                    .ignoresSafeArea(.all)
                
                if scene == 0 || scene == 1 {
                    Chapter1_Day(mainOnTap: $mainOnTap, moon_x: $moon_x, night_x: $night_x)
                        .onAppear {
                            startChapter()
                        }
                        .offset(x: scene2_offset_x)
                        .onTapGesture {
                            withAnimation {
                                if mainOnTap == true {
                                    mainOnTap = false
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        scene += 1
                                        withAnimation(.easeInOut(duration: 2)) {
                                            scene2_offset_x -= 400
                                            moon_x += 100.0
                                            night_x += 150.0
                                        }
                                    }
                                }
                            }
                        }
                }
                
                if scene == 1 || scene == 2 || scene == 3 || scene == 4 {
                    Chapter1_Bobok(mainOnTap: $mainOnTap, scene_x: $scene1_paralax_x)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                withAnimation(.easeInOut(duration: 2)) {
                                    scene1_offset_x -= 400
                                }
                            }
                        }
                        .onTapGesture {
                            if mainOnTap == true {
                                mainOnTap = false
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    scene += 1
                                    withAnimation(.easeInOut(duration: 3)) {
                                        //                                    scene1_paralax_x += 70
                                        //                                    scene1_offset_x -= 400
//                                        scene1_offset_y -= 800
                                    }
                                }
                            }
                        }
                        .offset(x: scene1_offset_x, y: scene1_offset_y)
                }
                
                if scene == 2 || scene == 3 {
                    Game2View(mainOnTap: $mainOnTap, scene_main: $scene, scene_frame: $scene2_offset_y)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                withAnimation(.easeInOut(duration: 3)) {
                                    scene2_offset_y -= 800
                                }
                            }
                        }
                        .offset(y: scene2_offset_y)
                }
                
                if scene == 3 || scene == 4 {
                    Game1_CaptchaPuzzle(mainOnTap: $mainOnTap, scene_main: $scene, scene_frame: $scene1_offset_x, scene_frame2: $scene3_offset_y)
                        .onAppear {
                            scene2_offset_x = 0
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                                withAnimation(.easeInOut(duration: 3)) {
                                    scene3_offset_y -= 800
                                }
                            }
                        }
                        .offset(x: scene2_offset_x, y: scene3_offset_y)
                }
                
                if scene == 4 || scene == 5 {
                    Game4_1View(mainOnTap: $mainOnTap, scene_main: $scene, scene_frame: $scene4_offset_x, scene1_paralax_x: $scene4_paralax_x)
                        .onAppear {
                            scene4_paralax_x = -50
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                withAnimation(.easeInOut(duration: 2)) {
                                    scene4_paralax_x += 50
                                    scene4_offset_x -= 400
                                }
                            }
                        }
                        .offset(x: scene4_offset_x)
                }
                
                if scene == 5 || scene == 6 {
                    Chapter1_Mom(mainOnTap: $mainOnTap, mom_scaled_x: $mom_scaled_x)
                        .onAppear {
                            scene2_offset_x = 400
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                withAnimation(.easeInOut(duration: 2)) {
                                    scene2_offset_x -= 400
                                }
                            }
                        }
                        .onTapGesture {
                            if mainOnTap == true {
                                mainOnTap = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    scene += 1
                                    withAnimation(.easeInOut(duration: 2)) {
                                        scene2_offset_x -= 400
                                        mom_scaled_x += 70
                                    }
                                }
                            }
                        }
                        .offset(x: scene2_offset_x)
                }
                
                if scene == 6 {
                    Chapter1_Sketch(mainOnTap: $mainOnTap)
                        .onAppear {
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
                        .onTapGesture {
                            if mainOnTap == true {
                                mainOnTap = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                                    scene += 1
//                                    withAnimation(.easeInOut(duration: 2)) {
//                                        //                                    scene1_offset_x -= 400
//                                    }
                                    endChapter()
                                }
                            }
                        }
                        .offset(x: scene1_offset_x)
                }
                
                Button {
                    openAlert()
                } label: {
                    Text("<")
                        .font(Font.custom("Hansip", size: 80))
                        .foregroundColor(Color("buttonColor"))
                }
                .position(x: 40, y: 30)
            }
            .opacity(scene_opacity)
            .blur(radius: scene_blur)
            
            ZStack {
                Image("Alert_Dialog")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350)
                    .offset(y: -20)
                
                Image("Alert_Yes")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .offset(x: -80, y: 150)
                    .onTapGesture {
                        backTransition()
                    }
                
                Image("Alert_No")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .offset(x: 80, y: 150)
                    .onTapGesture {
                        closeAlert()
                    }
            }
            .scaleEffect(dialog_scale)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .opacity(dialog_opacity)
            
            ZStack {
                Text("To Be Continued....")
                    .position(x: 198, y: 400)
                    .font(Font.custom("Hansip", size: 25))
                    .foregroundColor(.black)
                Button {
                    CoreDataManager.instance.editChapter(chapter: 2)
                    transition()
                        
                } label: {
                    Text("Back")
                        .font(Font.custom("Hansip", size: 25))
                        .foregroundColor(Color("buttonColor"))
                }.frame(width: 200, height: 150)
                    .position(x: 198, y: 500)
            }
            .opacity(end_opacity)
        }
        .background(.white)
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
                end_opacity = 0.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            chapter = -1
        }
    }
    
    func openAlert() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 1)) {
                dialog_scale = 1.0
                dialog_opacity = 1.0
                scene_blur = 20.0
            }
        }
    }
    
    func closeAlert() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 1)) {
                dialog_scale = 0.0
                dialog_opacity = 0.0
                scene_blur = 0.0
            }
        }
    }
    
    func backTransition() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 2)) {
                dialog_scale = 0.0
                dialog_opacity = 0.0
                scene_opacity = 0.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            chapter = -1
        }
    }
}

struct Chapter1_Collection_Previews: PreviewProvider {
    static var previews: some View {
        Chapter1_Collection(chapter: .constant(2))
    }
}
