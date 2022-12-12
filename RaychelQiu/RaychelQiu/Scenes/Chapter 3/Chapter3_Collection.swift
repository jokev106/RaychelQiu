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
    @State var dialog_scale = 0.0
    @State var dialog_opacity = 0.0
    @State var scene_blur = 0.0
    @Binding var chapter: Int
    
    // Scene1
    @State var scene1_paralax_x = 50.0
    @State var scene1_offset_x = 0.0
    
    // Scene2
    @State var scene2_offset_x = 400.0
    @State var scene2_lift_x = -70.0
    
    // Scene3
    @State var scene3_x = 0.0
    
    // EndChapter
    @State var end_opacity = 0.0
    @State var scene_opacity = 1.0
    
    var body: some View {
        GeometryReader { _ in
            ZStack {
                Group {
                    Image("StoryBG")
                        .resizable()
                        .ignoresSafeArea(.all)
                    
                    if scene == 1 || scene == 2 {
                        Chapter3_Phone(mainOnTap: $mainOnTap, scene1_paralax_x: $scene1_paralax_x)
                            .onAppear {
                                startChapter()
                            }
                            .onTapGesture {
                                if mainOnTap == true {
                                    mainOnTap = false
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        scene += 1
                                        withAnimation(.easeInOut(duration: 2)) {
                                            scene1_paralax_x += 70
                                            scene1_offset_x -= 400
                                        }
                                    }
                                }
                            }
                            .offset(x: scene1_offset_x)
                    }
                    
                    if scene == 2 || scene == 3 {
                        Chapter3_Lift(mainOnTap: $mainOnTap, scene2_lift_x: $scene2_lift_x)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now()) {
                                    withAnimation(.easeInOut(duration: 2)) {
                                        scene2_offset_x -= 400
                                    }
                                }
                                
                                //                            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                                //                                onTap = true
                                //                            }
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
                                                scene2_lift_x += 70
                                            }
                                        }
                                    }
                                }
                            }
                    }
                    
                    if scene == 3 || scene == 4 {
                        Chapter3_FrontDoor(mainOnTap: $mainOnTap, scene3_x: $scene3_x)
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
                                        scene += 1
                                        withAnimation(.easeInOut(duration: 2)) {
                                            scene1_offset_x -= 400
                                            scene3_x += 70
                                        }
                                    }
                                }
                            }
                            .offset(x: scene1_offset_x)
                    }
                    
                    if scene == 4 || scene == 5{
                        Chapter3_Bed(mainOnTap: $mainOnTap, scene_offset_x: $scene2_lift_x)
                            .onAppear {
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
                                withAnimation {
                                    if mainOnTap == true {
                                        mainOnTap = false
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                            scene += 1
                                            withAnimation(.easeInOut(duration: 2)) {
                                                scene2_offset_x -= 400
                                                scene2_lift_x += 70
                                            }
                                        }
                                    }
                                }
                            }
                    }
                    
                    if scene == 5 || scene == 6 {
                        Game4_2View(mainOnTap: $mainOnTap, scene_main: $scene, scene_frame: $scene1_offset_x)
                            .onAppear {
                                scene1_offset_x = 400.0
                                DispatchQueue.main.asyncAfter(deadline: .now()) {
                                    withAnimation(.easeInOut(duration: 2)) {
                                        scene1_offset_x -= 400
                                    }
                                }
                                
                                //                            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                                //                                onTap = true
                                //                            }
                            }
                            .offset(x: scene1_offset_x)
                    }
                    
                    if scene == 6 || scene == 7 {
                        Chapter3_Call(mainOnTap: $mainOnTap)
                            .onAppear {
                                scene2_offset_x = 400
                                DispatchQueue.main.asyncAfter(deadline: .now()) {
                                    withAnimation(.easeInOut(duration: 2)) {
                                        scene2_offset_x -= 400
                                    }
                                }
                            }
                            .offset(x: scene2_offset_x)
                            .onTapGesture {
                                withAnimation {
                                    if mainOnTap == true {
                                        mainOnTap = false
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                            endChapter()
                                        }
                                    }
                                }
                            }
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
            }
            .opacity(scene_opacity)
            .blur(radius: scene_blur)
            
            ZStack{
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
                    .onTapGesture{
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
                    CoreDataManager.instance.editChapter(chapter: 4)
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

struct Chapter3_Collection_Previews: PreviewProvider {
    static var previews: some View {
        Chapter3_Collection(chapter: .constant(3))
    }
}
