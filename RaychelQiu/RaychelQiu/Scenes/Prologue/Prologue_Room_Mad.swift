//
//  Prologue_Room_Mad.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 09/11/22.
//

import SwiftUI

struct Prologue_Room_Mad: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var mainOnTap: Bool
    @State var onTap = false
    @State var scene = 2
    // start from scene 2
    
    // Scene1
    @State var door_scale = 1.0
    @State var door_y = 0.0
    @State var door_opac = 1.0
    
    // Scene2
    @State var scene2_opac = 1.0
    
    // Scene3
    @State var nyfw_opacity = 1.0
    @State var nyfw_scale = 0.0
    @State var nyfw_y = 0.0
    @State var nyfw_x = 0.0
    @State var nyfw_blur = 0.0
    @State var nyfw_paper_opac = 1.0
    
    // Scene4
    @State var raychel_normal_opac = 0.0
    @State var raychel_papers_opac = 1.0
    @State var raychel_laptop_opac = 0.0
    
    // Game Register
    @State var positionRegisBoxMask1 = CGPoint(x: 194, y: 635)
    @State var positionRegisBoxMask2 = CGPoint(x: 195, y: 385)
    @State var positionRegisBox = CGPoint(x: 198, y: 635)
    @State var positionRegisLaptop = CGPoint(x: 204, y: 685)
    @State var positionRegisButton = CGPoint(x: 198, y: 625)
    @State var positionInfoButton = CGPoint(x: 148, y: 668)
    @State var positionTimeButton = CGPoint(x: 261, y: 668)
    @State var positionBackButton = CGPoint(x: 81, y: 548)
    @State var positionDoneRegisButton = CGPoint(x: 198, y: 668)
    
    @State var infoOpac = 0.0
    @State var regisOpac = 0.0
    @State var homeOpac = 1.0
    @State var timelineOpac = 0.0
    @State var doneRegisOpac = 0.0
    
    // Bool Laptop Screen
    @State var isHome: Bool = true
    @State var isInfo: Bool = false
    @State var isRegis: Bool = false
    @State var isTimeline: Bool = false
    @State var isDoneRegis: Bool = false
//
//    @State var laptop_x = 0.0
    @State var laptop_y = 250.0

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("Border")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 330, height: 448)
                    .offset(y: -102)
                
                ZStack {
                    Image("Prologue_Door_BG")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    
                    // Scene2
                    if scene == 2 || scene == 3 || scene == 4 {
                        ZStack {
                            Group {
                                Image("Prologue_Room_Table")
                                    .resizable()
                                    .scaledToFit()
                                Image("Prologue_Room_Paper_Multiple")
                                    .resizable()
                                    .scaledToFit()
                                    .opacity(raychel_papers_opac)
                                Image("Prologue_Room_NYFW_Book")
                                    .resizable()
                                    .scaledToFit()
                                    .opacity(nyfw_paper_opac)
                                Image("Prologue_Room_Raychel_Mad")
                                    .resizable()
                                    .scaledToFit()
                                    .opacity(raychel_papers_opac)
                                Image("Prologue_Room_Normal")
                                    .resizable()
                                    .scaledToFit()
                                    .opacity(raychel_normal_opac)
                                Image("Prologue_Room_Laptop")
                                    .resizable()
                                    .scaledToFit()
                                    .opacity(raychel_normal_opac)
                            }
                            Image("Prologue_Room_Pen")
                                .resizable()
                                .scaledToFit()
                            Image("Prologue_Room_Books")
                                .resizable()
                                .scaledToFit()
                            Image("Prologue_Room_Light")
                                .resizable()
                                .scaledToFit()
                            Image("Prologue_Room_Lamp")
                                .resizable()
                                .scaledToFit()
                        }
                        .opacity(scene2_opac)
                        .blur(radius: nyfw_blur)
                        .onTapGesture {
                            if scene == 2 {
                                if onTap == true {
                                    onTap = false
                                    scene += 1
                                }
                            }
                            
                            if scene == 4 {
                                if onTap == true {
                                    onTap = false
                                    prologue_room_scene4_out()
                                }
                            }
                        }
                    }
                    
                    // Scene1
                    ZStack {
                        Image("Prologue_Door_BG")
                            .resizable()
                            .scaledToFit()
                            .opacity(door_opac)
                        Image("Prologue_Door")
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(door_scale)
                            .offset(y: door_y)
                            .opacity(door_opac)
                            .onAppear {
                                prologue_room_scene1_in()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 4.2) {
                                    onTap = true
                                }
                            }
                    }
                    
                    // Scene3
                    if scene == 3 || scene == 4 {
                        ZStack {
                            Image("Prologue_Room_NYFW")
                                .resizable()
                                .scaledToFit()
                                .scaleEffect(nyfw_scale)
                                .offset(x: nyfw_x, y: nyfw_y)
                                .opacity(nyfw_opacity)
                        }
                        .onAppear {
                            prologue_room_scene3_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                onTap = true
                            }
                        }
                        .onTapGesture {
                            if onTap == true {
                                onTap = false
                                prologue_room_scene4_in()
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
            
            ZStack {
//                Image("RaychelBorder")
//                    .resizable()
//                    .frame(width: 330, height: 224)
//                    .position(self.positionRegisBox)
//                Image("DInnerBG")
//                    .resizable()
//                    .frame(width: 322, height: 219)
//                    .position(self.positionRegisBox)
                
                if scene == 4 {
                    ZStack {
                        Image("homescreen")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 1.144)
                            .opacity(homeOpac)
                            .position(self.positionRegisLaptop)
//                            .offset(y: laptop_y)
                        Image("information")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 1.144)
                            .opacity(infoOpac)
                            .position(self.positionRegisLaptop)
                        Image("register")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 1.144)
                            .opacity(regisOpac)
                            .position(self.positionRegisLaptop)
                        Image("doneregis")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 1.144)
                            .opacity(doneRegisOpac)
                            .position(self.positionRegisLaptop)
//                            .offset(y: laptop_y)
                        Image("timeline")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 1.144)
                            .opacity(timelineOpac)
                            .position(self.positionRegisLaptop)
                    }
//                    .mask {
//                        Image("Day")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 470, height: 1200)
//                            .position(self.positionRegisBoxMask1)
//
//                    }
                    .position(self.positionRegisBoxMask2)
                }
                
                // HomeScreen Button
                Group {
                    Button {
                        // Regis
                        if isHome == true {
                            isHome = false
                            isRegis = true
                            SFXManager2.instance.playSFX(sound: .click1)
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                withAnimation(.easeInOut(duration: 1.0)) {
                                    homeOpac -= 1.0
                                    regisOpac += 1.0
                                }
                            }
                        }
                    } label: {
                        Text("Regis")
                            .opacity(0)
                    }.frame(width: 100, height: 30)
//                        .background(.red)
                        .position(self.positionRegisButton)

                    Button {
                        // Information
                        if isHome == true {
                            isHome = false
                            isInfo = true
                            SFXManager2.instance.playSFX(sound: .click1)
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                withAnimation(.easeInOut(duration: 1.0)) {
                                    homeOpac -= 1.0
                                    infoOpac += 1.0
                                }
                            }
                        }
                    } label: {
                        Text("Info")
                            .opacity(0)
                    }.frame(width: 100, height: 30)
//                        .background(.red)
                        .position(self.positionInfoButton)
                    
                    Button {
                        // Timeline
                        if isHome == true {
                            isHome = false
                            isTimeline = true
                            SFXManager2.instance.playSFX(sound: .click1)
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                withAnimation(.easeInOut(duration: 1.0)) {
                                    homeOpac -= 1.0
                                    timelineOpac += 1.0
                                }
                            }
                        }
                    } label: {
                        Text("Timeline")
                            .opacity(0)
                    }.frame(width: 100, height: 30)
//                        .background(.red)
                        .position(self.positionTimeButton)
                }
                    
                // Back to Homescreen Button
                Group {
                    if isRegis == true || isInfo == true || isTimeline == true {
                        Button {
                            // Regis Back to Home
                            if isRegis == true {
                                isHome = true
                                isRegis = false
                                SFXManager.instance.playSFX(sound: .click1)
                                DispatchQueue.main.asyncAfter(deadline: .now()) {
                                    withAnimation(.easeInOut(duration: 1.0)) {
                                        homeOpac += 1.0
                                        regisOpac -= 1.0
                                    }
                                }
                            }
                            
                            // Information back to home
                            if isInfo == true {
                                isHome = true
                                isInfo = false
                                SFXManager.instance.playSFX(sound: .click1)
                                DispatchQueue.main.asyncAfter(deadline: .now()) {
                                    withAnimation(.easeInOut(duration: 1.0)) {
                                        homeOpac += 1.0
                                        infoOpac -= 1.0
                                    }
                                }
                            }
                            
                            // Timeline back to home
                            if isTimeline == true {
                                isHome = true
                                isTimeline = false
                                SFXManager.instance.playSFX(sound: .click1)
                                DispatchQueue.main.asyncAfter(deadline: .now()) {
                                    withAnimation(.easeInOut(duration: 1.0)) {
                                        homeOpac += 1.0
                                        timelineOpac -= 1.0
                                    }
                                }
                            }
                        } label: {
                            Text("Back")
                                .font(Font.custom("Hansip", size: 12))
                                .foregroundColor(.yellow)
                        }
                        .frame(width: 80, height: 30)
                        .position(self.positionBackButton)
                    }
                    if isRegis == true {
                        Button {
                            // RegisNow/Done Regis
                            if isRegis == true {
                                isDoneRegis = true
                                isRegis = false
                                DispatchQueue.main.asyncAfter(deadline: .now()) {
                                    withAnimation(.easeInOut(duration: 1.0)) {
                                        regisOpac -= 1.0
                                        doneRegisOpac += 1.0
                                    }
                                }
                                SFXManager2.instance.playSFX(sound: .click1)
                            }
                        } label: {
                            Text("RegisNow")
                                .opacity(0)
                        }.frame(width: 100, height: 30)
//                            .background(.red)
                            .position(self.positionTimeButton)
                    }
                    if isDoneRegis == true {
                        Text("Done")
                            .font(Font.custom("Hansip", size: 12))
                            .foregroundColor(.yellow)
                            .frame(width: 100, height: 30)
                            .position(self.positionDoneRegisButton)
                            .onAppear {
                                SFXManager.instance.playSFX(sound: .click1)
                                mainOnTap = true
                            }
                        
//                        Button {
//                            // To be Continued
////                            prologue_game()
////                            scene += 1
////                            presentationMode.wrappedValue.dismiss()
////                            print("\(mainOnTap)")
//                            SFXManager.instance.playSFX(sound: .click1)
//                            mainOnTap = true
//                        } label: {
//                            Text("Done")
//                                .font(Font.custom("Hansip", size: 12))
//                                .foregroundColor(.yellow)
//                        }.frame(width: 100, height: 30)
//                            .position(self.positionDoneRegisButton)
                    }
                }
                
            }
            .frame(width: 400)
            .scaleEffect(1.4)
            .offset(x: -20, y: laptop_y)
        }
    }
    
    func prologue_room_scene1_in() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeIn(duration: 2.0)) {
                door_y += 250
                door_scale += 1.5
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            withAnimation(.easeIn(duration: 2.0)) {
                SFXManager.instance.playSFX(sound: .doorOpen)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            withAnimation(.easeIn(duration: 0.5)) {
                door_opac -= 1
            }
        }
    }
    
    func prologue_room_scene3_in() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeInOut(duration: 1.0)) {
                nyfw_paper_opac -= 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 2.0)) {
                nyfw_scale += 0.45
                nyfw_y -= 95
                nyfw_blur += 5
            }
        }
    }
    
    func prologue_room_scene4_in() {
        raychel_normal_opac = 1.0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeInOut(duration: 1.0)) {
                raychel_papers_opac -= 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 2.0)) {
                nyfw_scale -= 0.45
                nyfw_y += 95
                nyfw_blur -= 5.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            scene += 1
            withAnimation(.easeInOut(duration: 1.5)) {
                laptop_y = -100.0
            }
        }
    }
    
    func prologue_room_scene4_out() {
//        raychel_normal_opac = 1.0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeInOut(duration: 1.0)) {
                raychel_papers_opac += 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(.easeInOut(duration: 2.0)) {
                nyfw_scale = 0.0
                nyfw_y = 0.0
                nyfw_blur = 0.0
                raychel_normal_opac = 1.0
//                homeOpac += 1.0
            }
        }
    }
}

struct Prologue_Room_Mad_Previews: PreviewProvider {
    static var previews: some View {
        Prologue_Room_Mad(mainOnTap: .constant(false))
    }
}
