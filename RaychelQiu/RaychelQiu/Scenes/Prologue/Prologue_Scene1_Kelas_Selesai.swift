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
    
    //Scene1
    @State var raychel_1_x = 300.0
    @State var raychel_1_y = 0.0
    @State var table_1_opacity = 0.0
    @State var table_1_y = 0.0
    @State var bulletin_1_opacity = 0.0
    @State var paper_1_opacity = 0.0
    @State var paper_1_x = -115.0
    @State var paper_1_y = 60.0
    
    //Scene2
    @State var clock_2_y = -300.0
    @State var clock_2_x = 0.0
    @State var long_2_y_offset = -300.0
    @State var long_2_x_offset = 0.0
    @State var long_2_rotation = -50.0
    @State var short_2_y_offset = -300.0
    @State var short_2_x_offset = -2.0
    @State var short_2_rotation = 0.0
    
    //Scene3
    @State var raychel_stand_opac = 0.0
    @Binding var raychel_stand_x: Double
    @State var raychel_opac = 1.0
    @Binding var scene1_Prologue_Final: Bool
    
    //Minigame Backpack
    
    @State var bagOffset_x = 200.0
    @State var gameOffset_x = 500.0
    
    @State var positionBook = CGPoint(x: 285, y: 633)
    @State var positionPencil = CGPoint(x: 180, y: 633)
    @State var positionBootle = CGPoint(x: 95, y: 633)
    @State var positionBag = CGPoint(x:295, y: 400)
    @State var positionPlayBox = CGPoint(x: 198, y: 635)

    @Binding var moveableBook: Bool
    @State var moveablePencil: Bool = true
    @State var moveableBottle: Bool = false
    
    @State var book: Bool = false
    @State var pencil: Bool = false
    @State var bottle: Bool = false
    
    //Visible item
    @State var isBook:Bool = true
    @State var isPencil:Bool = true
    @State var isBottle:Bool = true
    @State var bag3Opac = 1.0
    
    var body: some View {
        
        //Dragable for Book
        let dragBook = DragGesture(coordinateSpace: .local)
            .onChanged({ gesture in
                if moveableBook == false {
                    self.positionBook = gesture.location
                }
            })
               .onEnded {gesture in
                   if self.positionBook.x > 250 &&
                        self.positionBook.x < 360 &&
                        self.positionBook.y > 320 && self.positionBook.y < 490{
                       self.moveableBook = true
                       book = true
                       isBook = false
                   }else {
                       withAnimation(.default){
                           self.positionBook.x = 285
                           self.positionBook.y = 633
                       }
                   }
               }
        //Dragable for PencilCase
        let dragPencil = DragGesture(coordinateSpace: .local)
        .onChanged({ gesture in
            if moveablePencil == false {
                self.positionPencil = gesture.location
            }
        })
           .onEnded {gesture in
               if self.positionPencil.x > 250 &&
                    self.positionPencil.x < 360 &&
                    self.positionPencil.y > 320 && self.positionPencil.y < 490 {
                   self.moveablePencil = true
                   pencil = true
                   isPencil = false
                   self.moveableBook = false
               }else {
                   withAnimation(.default){
                       self.positionPencil.x = 180
                       self.positionPencil.y = 633
                   }
               }
           }
        
        //Dragable for Bottle
        let dragBottle = DragGesture(coordinateSpace: .local)
            .onChanged({ gesture in
                    if  moveableBottle == false {
                        self.positionBootle = gesture.location
                }
            })
               .onEnded {gesture in
                   if self.positionBootle.x > 250 &&
                        self.positionBootle.x < 360 &&
                        self.positionBootle.y > 320 && self.positionBootle.y < 490 {
                       self.moveableBottle = true
                       bottle = true
                       isBottle = false
                       self.moveablePencil = false
                   }else {
                       withAnimation(.default){
                           self.positionBootle.x = 95
                           self.positionBootle.y = 180
                       }
                   }
               }
        
        
        GeometryReader{ geometry in
            ZStack{
                Image("StoryBG")
                    .resizable()
                    .ignoresSafeArea(.all)
                Image("Border")
                    .resizable()
//                    .scaledToFit()
//                    .scaleEffect(0.92)
                    .frame(width: 330, height: 449.6)
                    .offset(y: -102)
                
//                ZStack{
//                    if gameStart == true {
                      
//                    }
//                }
                
                ZStack{
                    Image("School_BG")
                        .resizable()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    
                    //Scene1
                    if scene == 1{
                        ZStack{
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
                        .onAppear{
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
                    
                    //Scene2
                    if scene == 2{
                        ZStack{
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
                        .onAppear{
                            prologue_scene2_animation_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 8.5) {
                                scene += 1
                            }
                        }
                    }
                    
                    //Scene3
                    if scene == 3{
                        ZStack{
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
                            //                        .opacity(paper_1_opacity)
                                .offset(x: paper_1_x, y: paper_1_y)
                            Image("School_Raychel")
                                .resizable()
                                .scaledToFit()
                                .offset(x: raychel_1_x, y: raychel_1_y)
                                .opacity(raychel_opac)
                            
                        }
                        .onAppear{
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
                .scaleEffect(geometry.size.width * 0.00324)
                .offset(y: geometry.size.height * 0.026)
                
                if isBook == true && isPencil == true && isBottle == true {
                        Image("Bag")
                            .resizable()
                            .frame(width: 140, height: 190)
                            .position(self.positionBag)
                            .shadow(color: .black.opacity(0.3), radius: 0.5)
                            .offset(x: bagOffset_x)
                }
                ZStack{
                    Image("PlayBox")
                        .resizable()
                        .frame(width: 330, height: 224)
                        .position(self.positionPlayBox)
                    Image("DInnerBG")
                        .resizable()
                        .frame(width: 322, height: 219)
                        .position(self.positionPlayBox)
                    
    //                    ZStack{
                    Group{
                        if isBottle == false {
                            Image("Bag1")
                                .resizable()
                                .frame(width: 140, height: 190)
                                .position(self.positionBag)
                                .shadow(color: .black.opacity(0.3), radius: 0.5)
                        }
                        if isPencil == false {
                            Image("Bag2")
                                .resizable()
                                .frame(width: 140, height: 190)
                                .position(self.positionBag)
                                .shadow(color: .black.opacity(0.3), radius: 0.5)
                        }
                        if isBook == false {
                            Image("Bag3")
                                .resizable()
                                .frame(width: 140, height: 190)
                                .position(self.positionBag)
                                .shadow(color: .black.opacity(0.3), radius: 0.5)
                                .opacity(bag3Opac)
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
                            .position(self.positionBootle)
                            .gesture(dragBottle)
                            .shadow(color: .black.opacity(0.3), radius: 1, x: 1, y: 1)
                    }

                }.offset(x: gameOffset_x)
               
                
//                .background(Color.white)
    //            .mask{
    //                Image("FullScreen_Mask")
    //                    .resizable()
    //                    .scaledToFit()
    //            }
                
                
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
        
        for i in 1...5{
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
        Prologue_Scene1_Kelas_Selesai(mainOnTap: .constant(false), raychel_stand_x: .constant(0), scene1_Prologue_Final: .constant(false), moveableBook: .constant(false))
    }
}
