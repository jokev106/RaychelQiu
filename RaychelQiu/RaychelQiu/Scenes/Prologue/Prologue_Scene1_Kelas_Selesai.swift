//
//  Scene1_Kelas_Selesai.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 28/10/22.
//

import SwiftUI

struct Prologue_Scene1_Kelas_Selesai: View {
    @State var scene = 3
    @State var onTap = false
    @Binding var mainOnTap: Bool
    
    // Scene1
    @State var raychel_1_x = 300.0
    @State var raychel_1_y = 0.0
    @State var table_1_opacity = 0.0
    @State var table_1_y = 0.0
    @State var bulletin_1_opacity = 0.0
    @State var paper_1_opacity = 0.0
    @State var paper_1_x = -115.0
    @State var paper_1_y = 60.0
    
    // Scene2
    @State var clock_2_y = -300.0
    @State var clock_2_x = 0.0
    @State var long_2_y_offset = -300.0
    @State var long_2_x_offset = 0.0
    @State var long_2_rotation = -50.0
    @State var short_2_y_offset = -300.0
    @State var short_2_x_offset = -2.0
    @State var short_2_rotation = 0.0
    
    // Scene3
    @State var raychel_stand_opac = 0.0
    @Binding var raychel_stand_x: Double
    @State var raychel_opac = 1.0
    @Binding var scene1_Prologue_Final: Bool
    
    // Minigame Backpack
    @State var bagOffset_x = 200.0
    @State var gameOffset_x = 500.0
    
    @State var positionBook = CGPoint(x: 285, y: 633)
    @State var positionPencil = CGPoint(x: 180, y: 633)
    @State var positionBottle = CGPoint(x: 95, y: 633)
    @State var positionBag = CGPoint(x: 295, y: 400)
    @State var positionPlayBox = CGPoint(x: 196, y: 635)

//    @State var moveableBook: Bool = false
//    @State var moveablePencil: Bool = false
//    @State var moveableBottle: Bool = false
    
    // Visible item
    @State var isBook: Bool = true
    @State var isPencil: Bool = true
    @State var isBottle: Bool = true
    @State var bag3Opac = 1.0
    
    var body: some View {
        // Dragable for Book
        let dragBook = DragGesture(coordinateSpace: .local)
            .onChanged { gesture in
//                if moveableBook == false {
                self.positionBook = gesture.location
//                }
            }
            .onEnded { _ in
                if self.positionBook.x > 250 &&
                    self.positionBook.x < 360 &&
                    self.positionBook.y > 320 && self.positionBook.y < 490
                {
                    isBook = false
                } else {
                    withAnimation(.default) {
                        self.positionBook.x = 285
                        self.positionBook.y = 633
                    }
                }
                
                if isBook == false && isPencil == true && isBottle == true {
                    mainOnTap = true
                }
            }
        
        // Dragable for PencilCase
        let dragPencil = DragGesture(coordinateSpace: .local)
            .onChanged { gesture in
//                if moveablePencil == false {
                self.positionPencil = gesture.location
//                }
            }
            .onEnded { _ in
                if self.positionPencil.x > 250 &&
                    self.positionPencil.x < 360 &&
                    self.positionPencil.y > 320 && self.positionPencil.y < 490
                {
                    isPencil = false
                } else {
                    withAnimation(.default) {
                        self.positionPencil.x = 180
                        self.positionPencil.y = 633
                    }
                }
                
                if isBook == false && isPencil == true && isBottle == true {
                    mainOnTap = true
                }
            }
        
        // Dragable for Bottle
        let dragBottle = DragGesture(coordinateSpace: .local)
            .onChanged { gesture in
//                if moveableBottle == false {
                self.positionBottle = gesture.location
//                }
            }
            .onEnded { _ in
                if self.positionBottle.x > 250 &&
                    self.positionBottle.x < 360 &&
                    self.positionBottle.y > 320 && self.positionBottle.y < 490
                {
                    isBottle = false
                } else {
                    withAnimation(.default) {
                        self.positionBottle.x = 95
                        self.positionBottle.y = 633
                    }
                }
                
                if isBook == false && isPencil == true && isBottle == true {
                    mainOnTap = true
                }
            }
        
        GeometryReader { geometry in
            ZStack {
                Image("Border")
                    .resizable()
//                    .scaledToFit()
//                    .scaleEffect(0.92)
                    .frame(width: 330, height: 448)
                    .offset(y: -102)
                
                ZStack {
                    Image("School_BG")
                        .resizable()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    
                    // Scene1
                    if scene == 1 {
                        ZStack {
                            Image("School_Bulletin")
                                .resizable()
                                .scaledToFit()
                                .opacity(bulletin_1_opacity)
                            Image("School_Table")
                                .resizable()
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .opacity(table_1_opacity)
                                .offset(y: table_1_y)
                            Image("School_Paper")
                                .resizable()
                                .scaledToFit()
                                //                        .opacity(paper_1_opacity)
                                .offset(x: paper_1_x, y: paper_1_y)
                            Image("School_Raychel")
                                .resizable()
                                .scaledToFit()
                                .offset(x: raychel_1_x, y: raychel_1_y)
                        }
                        .onAppear {
                            prologue_scene1_animation_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
                                onTap = true
                            }
                        }
                        .onTapGesture {
                            if onTap == true {
                                onTap = false
                                prologue_scene1_animation_out()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                    scene += 1
                                }
                            }
                        }
                    }
                    
                    // Scene2
                    if scene == 2 {
                        ZStack {
                            Image("Clock")
                                .resizable()
                                .scaledToFit()
                                .offset(x: clock_2_x, y: clock_2_y)
                            Image("Clock_LongPoint")
                                .resizable()
                                .scaledToFit()
                                //                        .frame(width: 15)
                                .frame(width: geometry.size.width * 0.039)
                                .scaleEffect(1)
                                .rotationEffect(.degrees(long_2_rotation), anchor: .bottom)
                                //                        .position(x: 196.5, y: 242)
                                .position(x: geometry.size.width * 0.499, y: geometry.size.height * 0.318)
                                .offset(x: long_2_x_offset, y: long_2_y_offset)
                            
                            Image("Clock_ShortPoint")
                                .resizable()
                                .scaledToFit()
                                //                        .frame(width: 11)
                                .frame(width: geometry.size.width * 0.028)
                                .scaleEffect(1)
                                .offset(x: short_2_x_offset, y: short_2_y_offset)
                                .rotationEffect(.degrees(short_2_rotation), anchor: .bottom)
                                //                        .background(.red)
                                //                        .position(x: 196.5, y: 242)
                                .position(x: geometry.size.width * 0.499, y: geometry.size.height * 0.331)
                        }
                        .onAppear {
                            prologue_scene2_animation_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 8.5) {
                                scene += 1
                            }
                        }
                    }
                    
                    // Scene3
                    if scene == 3 {
                        ZStack {
                            Image("School_Bulletin")
                                .resizable()
                                .scaledToFit()
                                .opacity(bulletin_1_opacity)
                            Image("School_Raychel_Stand")
                                .resizable()
                                .scaledToFit()
                                .opacity(raychel_stand_opac)
                                .offset(x: raychel_stand_x)
                            Image("School_Table")
                                .resizable()
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .opacity(table_1_opacity)
                                .offset(y: table_1_y)
                            Image("School_Paper")
                                .resizable()
                                .scaledToFit()
//                                .opacity(paper_1_opacity)
                                .offset(x: paper_1_x, y: paper_1_y)
                            Image("School_Raychel")
                                .resizable()
                                .scaledToFit()
                                .offset(x: raychel_1_x, y: raychel_1_y)
                                .opacity(raychel_opac)
                        }
                        .onAppear {
                            prologue_scene3_animation_in()
                            mainOnTap = true
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
                
//                if isBook == true && isPencil == true && isBottle == true {
                Image("Bag")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130)
                    .position(self.positionBag)
                    .shadow(color: .black.opacity(0.3), radius: 0.5)
                    .offset(x: bagOffset_x)
//                }
                ZStack {
                    Image("PlayBox")
                        .resizable()
                        .frame(width: 330, height: 224)
//                        .position(self.positionPlayBox)
                        .offset(y: 260)
                    
                    Image("DInnerBG")
                        .resizable()
                        .frame(width: 324, height: 219)
//                        .position(self.positionPlayBox)
                        .offset(y: 260)
                    
                    Group {
                        if isBook == false {
                            Image("Books")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 75)
                                .rotationEffect(.degrees(70))
                                .shadow(color: .black.opacity(0.3), radius: 1, x: 1, y: 1)
                                .offset(x: 110, y: 20)
                                .onAppear {
                                    SFXManager.instance.playSFX(sound: .pop)
                                }
                            
                            Image("Bag0")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 88)
                                .position(self.positionBag)
                                .offset(x: bagOffset_x + 21, y: 33)
                            
//                            Image("Bag3")
//                                .resizable()
//                                .frame(width: 140, height: 190)
//                                .position(self.positionBag)
//                                .shadow(color: .black.opacity(0.3), radius: 0.5)
//                                .opacity(bag3Opac)
                        }
                        if isBottle == false {
                            Image("WaterBottle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25)
                                .shadow(color: .black.opacity(0.3), radius: 1, x: 1, y: 1)
                                .offset(x: 130, y: 10)
                                .onAppear {
                                    SFXManager.instance.playSFX(sound: .pop)
                                }
                            
                            Image("Bag0")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 88)
                                .position(self.positionBag)
                                .offset(x: bagOffset_x + 21, y: 33)
                            
//                            Image("Bag1")
//                                .resizable()
//                                .frame(width: 140, height: 190)
//                                .position(self.positionBag)
//                                .shadow(color: .black.opacity(0.3), radius: 0.5)
//                                .onAppear {
//                                    SFXManager.instance.playSFX(sound: .pop)
//                                }
                        }
                        if isPencil == false {
                            Image("PencilCase")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60)
                                .rotationEffect(.degrees(130))
                                .offset(x: 100, y: 45)
                                .onAppear {
                                    SFXManager.instance.playSFX(sound: .pop)
                                }
                            
                            Image("Bag0")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 88)
                                .position(self.positionBag)
                                .offset(x: bagOffset_x + 21, y: 33)
                            
//                            Image("Bag2")
//                                .resizable()
//                                .frame(width: 140, height: 190)
//                                .position(self.positionBag)
//                                .shadow(color: .black.opacity(0.3), radius: 0.5)
//                                .onAppear {
//                                    SFXManager.instance.playSFX(sound: .pop)
//                                }
                        }
                    }
                    
                    if isBook == true {
                        Image("Books")
                            .resizable()
                            .frame(width: 100, height: 90)
                            .position(self.positionBook)
                            .gesture(dragBook)
                            .shadow(color: .black.opacity(0.3), radius: 1, x: 1, y: 1)
                    }
                    if isPencil == true {
                        Image("PencilCase")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .position(self.positionPencil)
                            .gesture(dragPencil)
                            .shadow(color: .black.opacity(0.3), radius: 1, x: 1, y: 1)
                    }
                    if isBottle == true {
                        Image("WaterBottle")
                            .resizable()
                            .frame(width: 40, height: 100)
                            .position(self.positionBottle)
                            .gesture(dragBottle)
                            .shadow(color: .black.opacity(0.3), radius: 1, x: 1, y: 1)
                    }

                }.offset(x: gameOffset_x)
            }
        }
    }
    
    func prologue_scene1_animation_in() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 1)) {
                bulletin_1_opacity += 1
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            withAnimation(.easeInOut(duration: 1)) {
                table_1_opacity += 1
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            withAnimation(.easeInOut(duration: 1.8)) {
                raychel_1_x -= 300
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.8) {
            withAnimation(.easeInOut(duration: 1.7)) {
//                paper_1_opacity = 1
                paper_1_x += 115
                paper_1_y -= 60
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            SFXManager.instance.playSFX(sound: .paperSlide2)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
            withAnimation(.linear(duration: 1.0)) {
                SFXManager.instance.playSFX(sound: .drawing)
            }
        }
    }
    
    func prologue_scene1_animation_out() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 1)) {
                bulletin_1_opacity -= 1
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeIn(duration: 1.5)) {
                raychel_1_y += 300
                table_1_y += 300
                paper_1_y += 300
            }
        }
    }
    
    func prologue_scene2_animation_in() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
            withAnimation(.easeOut(duration: 1.5)) {
                clock_2_y += 300.0
                long_2_y_offset += 300.0
                short_2_y_offset += 300.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(.easeOut(duration: 1.5)) {
                SFXManager.instance.playSFX(sound: .ticking_5)
            }
        }
        
        for i in 1 ... 5 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25 + CGFloat(i) * 1.0) {
                withAnimation(.linear(duration: 1).speed(3.0)) {
                    long_2_rotation += 10.0
                }
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.25) {
            withAnimation(.linear(duration: 1).speed(3.0)) {
                short_2_rotation += 3.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            withAnimation(.linear(duration: 1.5)) {
                SFXManager.instance.playSFX(sound: .alarm)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
            withAnimation(.linear(duration: 0.2).repeatForever(autoreverses: true).speed(3.0)) {
                clock_2_x += 10.0
                long_2_x_offset += 10.0
                short_2_x_offset += 10.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 7.5) {
            withAnimation(.easeIn(duration: 1)) {
                clock_2_y -= 300.0
                long_2_y_offset -= 300.0
                short_2_y_offset -= 300.0
            }
        }
    }
        
    func prologue_scene3_animation_in() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 1)) {
                bulletin_1_opacity += 1
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeOut(duration: 1.5)) {
                raychel_1_y -= 300
                table_1_y -= 300
                paper_1_y -= 300
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            withAnimation(.easeInOut(duration: 1)) {
                raychel_stand_opac += 1
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            withAnimation(.easeIn(duration: 0.7)) {
                raychel_opac -= 1
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            withAnimation(.easeInOut(duration: 1.8)) {
                bagOffset_x -= 200
                gameOffset_x -= 500
            }
        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
//            withAnimation(.easeInOut(duration: 2.0)) {
//                raychel_stand_x += 300
//            }
//        }
    }
}

struct Prologue_Scene1_Kelas_Selesai_Previews: PreviewProvider {
    static var previews: some View {
        Prologue_Scene1_Kelas_Selesai(mainOnTap: .constant(false), raychel_stand_x: .constant(0), scene1_Prologue_Final: .constant(false))
    }
}
