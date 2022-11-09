//
//  Minigame1_BackpackSchool.swift
//  RaychelQiu
//
//  Created by Jonathan Kevin on 01/11/22.
//

import SwiftUI

struct Minigame1_BackpackSchool: View {
    
    @State var positionBook = CGPoint(x: 95, y: 593)
    @State var positionPencil = CGPoint(x: 80, y: 693)
    @State var positionBootle = CGPoint(x: 155, y: 673)
    @State var positionBag = CGPoint(x:295, y: 630)
    @State var positionPlayBox = CGPoint(x: 198, y: 635)
    @State var kotak = CGPoint(x: 360, y: 635)
    @State var kotak1 = CGPoint(x: 250, y: 720)

    @State var moveableBook: Bool = false
    @State var moveablePencil: Bool = false
    @State var moveableBottle: Bool = false
    
    @State var book: Bool = false
    @State var pencil: Bool = false
    @State var bottle: Bool = false
    
    //Visible item
    @State var isBook:Bool = true
    @State var isPencil:Bool = true
    @State var isBottle:Bool = true
    
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
                        self.positionBook.y > 550 && self.positionBook.y < 720{
                       self.moveableBook = true
                       book = true
                       isBook = false
                   }else {
                       withAnimation(.default){
                           self.positionBook.x = 95
                           self.positionBook.y = 593
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
                    self.positionPencil.y > 550 && self.positionPencil.y < 720 {
                   self.moveablePencil = true
                   pencil = true
                   isPencil = false
               }else {
                   withAnimation(.default){
                       self.positionPencil.x = 80
                       self.positionPencil.y = 693
                   }
               }
           }
        
        //Dragable for Bottle
        let dragBottle = DragGesture(coordinateSpace: .local)
            .onChanged({ gesture in
                withAnimation(Animation.default.repeatCount(5).speed(6)) {
                    if  moveableBottle == false {
                        self.positionBootle = gesture.location
                    }
                }
            })
               .onEnded {gesture in
                   if self.positionBootle.x > 250 &&
                        self.positionBootle.x < 360 &&
                        self.positionBootle.y > 550 && self.positionBootle.y < 720 {
                       self.moveableBottle = true
                       bottle = true
                       isBottle = false
                   }else {
                       withAnimation(.default){
                           self.positionBootle.x = 155
                           self.positionBootle.y = 673
                       }
                   }
               }
        
        GeometryReader{geo in
            ZStack{
                Image("PlayBox")
                    .resizable()
                    .frame(width: 330, height: 224)
                    .position(self.positionPlayBox)
                
//                    ZStack{
                Image("Bag")
                    .resizable()
                    .frame(width: 140, height: 190)
                    .position(self.positionBag)
                    .clipped()
                
                if isBook == true {
                    Image("Books")
                        .resizable()
                        .frame(width: 100, height: 90)
                        .position(self.positionBook)
                        .gesture(dragBook)
                        .clipped()
                }
                if isPencil == true {
                    Image("PencilCase")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .position(self.positionPencil)
                        .gesture(dragPencil)
                        .clipped()
                    
                }
                if isBottle == true {
                    Image("WaterBottle")
                        .resizable()
                        .frame(width: 40, height: 100)
                        .position(self.positionBootle)
                        .gesture(dragBottle)
                        .clipped()
                }
            }
        }
    }
}
struct Minigame1_BackpackSchool_Previews: PreviewProvider {
    static var previews: some View {
        Minigame1_BackpackSchool()
    }
}
