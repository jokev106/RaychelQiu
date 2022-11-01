//
//  Minigame1_BackpackSchool.swift
//  RaychelQiu
//
//  Created by Jonathan Kevin on 01/11/22.
//

import SwiftUI

struct Minigame1_BackpackSchool: View {
    
    @State var positionBook = CGPoint(x: 72, y: 93)
    @State var positionPencil = CGPoint(x: 62, y: 163)
    @State var positionBootle = CGPoint(x: 122, y: 203)
    @State var positionBag = CGPoint(x:295, y: 153)

    @State var moveableBook: Bool = false
    @State var moveablePencil: Bool = false
    @State var moveableBottle: Bool = false
    
    @State var book: Bool = false
    @State var pencil: Bool = false
    @State var bottle: Bool = false
    
    var body: some View {
        //Dragable for Book
        let dragBook = DragGesture(coordinateSpace: .local)
            .onChanged({ gesture in
                if moveableBook == false {
                    self.positionBook = gesture.location
                }
            })
               .onEnded {gesture in
                   if self.positionBook.x > 250 {
                       self.moveableBook = true
                       book = true
                       
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
               if self.positionPencil.x > 250 {
                   self.moveablePencil = true
                   pencil = true
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
                   if self.positionBootle.x > 250 {
                       self.moveableBottle = true
                       bottle = true
                       
                   }
               }
        
        GeometryReader{geo in
            VStack{
                Spacer()
                if book == false || pencil == false || bottle == false{
                    ZStack{
                        Image("Bag")
                            .resizable()
                            .frame(width: 140, height: 190)
                            .position(self.positionBag)
                            .clipped()
                        Image("Books")
                            .resizable()
                            .frame(width: 100, height: 90)
                            .position(self.positionBook)
                            .gesture(dragBook)
                            .clipped()
                            .animation(Animation.default.repeatCount(4).speed(6))
                        Image("PencilCase")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .position(self.positionPencil)
                            .gesture(dragPencil)
                            .clipped()
                        
                        Image("WaterBottle")
                            .resizable()
                            .frame(width: 40, height: 100)
                            .position(self.positionBootle)
                            .gesture(dragBottle)
                            .clipped()
                    }.background()
                        .frame(width: 390, height: 270)
                        .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.8)))
                }
                if book == true && pencil == true && bottle == true{
                    Image(systemName: "chevron.right.circle")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 80, height: 80)
                        .onTapGesture {
                            withAnimation(.default) {
                                
                            }
                        }
                        .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.8)))
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
