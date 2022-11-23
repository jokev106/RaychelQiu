//
//  Minigame3_Packing.swift
//  RaychelQiu
//
//  Created by Jonathan Kevin on 07/11/22.
//

import SwiftUI

struct Minigame3_Packing: View {
    @State var positionPackingBox = CGPoint(x: 198, y: 635)
    @State var positionBorder = CGPoint(x: 198, y: 275)
    @State var positionSuitCase = CGPoint(x: 193, y: 400)
    @State var positionClothes = CGPoint(x: 110.6, y: 676.3)
    @State var positionPencilCase = CGPoint(x: 118.3, y: 596.3)
    @State var positionSketchBook = CGPoint(x: 214.6, y: 601.3)
    @State var positionMakeUp = CGPoint(x: 302, y: 675.6)
    @State var positionCamera = CGPoint(x: 220.6, y: 679.3)
    
    @Binding var moveableClothes: Bool
    @Binding var moveableSketchBook: Bool
    @Binding var moveablePencilCase: Bool
    @Binding var moveableMakeUp: Bool
    @Binding var moveableCamera: Bool
    
    var body: some View {
        
        //Dragable for Clothes
        let clothesDrag = DragGesture(coordinateSpace: .local)
            .onChanged{ gesture in
                if moveableClothes == false{
                    self.positionClothes = gesture.location
                }
            }
               .onEnded {gesture in
                   if self.positionClothes.y < 520 && self.positionClothes.y > 370 &&
                        self.positionClothes.x < 355 && self.positionClothes.x > 55{
                       withAnimation(.default){
                           self.positionClothes.x = 116.6
                           self.positionClothes.y = 456.3
                           moveableClothes = true
                       }
                   }
                   if self.positionClothes.y > 745 || self.positionClothes.y < 370 || self.positionClothes.x > 360 || self.positionClothes.x < 35 {
                       withAnimation(.default){
                           self.positionClothes.x = 110.6
                           self.positionClothes.y = 676.3
                       }
                   }
               }
        
        //Dragable for SketchBook
        let sketchDrag = DragGesture(coordinateSpace: .local)
            .onChanged{ gesture in
                if moveableSketchBook == false{
                    self.positionSketchBook = gesture.location
                }
            }
               .onEnded {gesture in
                   if self.positionSketchBook.y < 520 && self.positionSketchBook.y > 370 &&
                        self.positionSketchBook.x < 355 && self.positionSketchBook.x > 55{
                       withAnimation(.default){
                           self.positionSketchBook.x = 198.3
                           self.positionSketchBook.y = 461.3
                           moveableSketchBook = true
                       }
                   }
                   if self.positionSketchBook.y > 745 || self.positionSketchBook.y < 370 || self.positionSketchBook.x > 360 || self.positionSketchBook.x < 35 {
                       withAnimation(.default){
                           self.positionSketchBook.x = 214.6
                           self.positionSketchBook.y = 601.3
                       }
                   }
               }
        
        //Dragable for PencilCase
        let pencilCaseDrag = DragGesture(coordinateSpace: .local)
            .onChanged{ gesture in
                if moveablePencilCase == false{
                    self.positionPencilCase = gesture.location
                }
            }
               .onEnded {gesture in
                   if self.positionPencilCase.y < 520 && self.positionPencilCase.y > 370 &&
                        self.positionPencilCase.x < 355 && self.positionPencilCase.x > 55{
                       withAnimation(.default){
                           self.positionPencilCase.x = 274.6
                           self.positionPencilCase.y = 441.3
                           moveablePencilCase = true
                       }
                   }
                   if self.positionPencilCase.y > 745 || self.positionPencilCase.y < 370 || self.positionPencilCase.x > 360 || self.positionPencilCase.x < 35 {
                       withAnimation(.default){
                           self.positionPencilCase.x = 118.3
                           self.positionPencilCase.y = 596.3
                       }
                   }
               }
        
        //Dragable for Camera
        let cameraDrag = DragGesture(coordinateSpace: .local)
            .onChanged{ gesture in
                if moveableCamera == false{
                    self.positionCamera = gesture.location
                }
            }
               .onEnded {gesture in
                   if self.positionCamera.y < 520 && self.positionCamera.y > 370 &&
                        self.positionCamera.x < 355 && self.positionCamera.x > 55{
                       withAnimation(.default){
                           self.positionCamera.x = 250.6
                           self.positionCamera.y = 479.3
                           moveableCamera = true
                       }
                   }
                   if self.positionCamera.y > 745 || self.positionCamera.y < 370 || self.positionCamera.x > 360 || self.positionCamera.x < 35 {
                       withAnimation(.default){
                           self.positionCamera.x = 220.6
                           self.positionCamera.y = 679.3
                       }
                   }
               }
        
        //Dragable for MakeUp
        let makeUpDrag = DragGesture(coordinateSpace: .local)
            .onChanged{ gesture in
                if moveableMakeUp == false{
                    self.positionMakeUp = gesture.location
                }
            }
               .onEnded {gesture in
                   if self.positionMakeUp.y < 520 && self.positionMakeUp.y > 370 &&
                        self.positionMakeUp.x < 355 && self.positionMakeUp.x > 55{
                       withAnimation(.default){
                           self.positionMakeUp.x = 302
                           self.positionMakeUp.y = 475.6
                           moveableMakeUp = true
                       }
                   }
                   if self.positionMakeUp.y > 745 || self.positionMakeUp.y < 370 || self.positionMakeUp.x > 360 || self.positionMakeUp.x < 35{
                       withAnimation(.default){
                           self.positionMakeUp.x = 302
                           self.positionMakeUp.y = 675.6
                       }
                   }
               }
        
        GeometryReader{geo in
            ZStack{
                Image("Border")
                    .resizable()
                    .frame(width: 330, height: 449.6)
//                    .position(self.positionBorder)
                    .offset(y: -114)
                
            //image ntar diganti packingbox
                Image("HeartBox")
                    .resizable()
                    .frame(width: 330, height: 224)
//                    .position(self.positionPackingBox)
                    .offset(y: 250)
                
                Image("SuitCase")
                    .resizable()
                    .frame(width: 425, height: 330)
                    .position(self.positionSuitCase)
                    .shadow(color: .black.opacity(0.3), radius: 2, x: 2, y: 2)
                
                Image("Clothes")
                    .resizable()
                    .frame(width: 113, height: 79)
                    .position(self.positionClothes)
                    .gesture(clothesDrag)
                    .shadow(color: .black.opacity(0.1), radius: 1, x: 1, y: 1)
                
                Image("SketchBook")
                    .resizable()
                    .frame(width: 56, height: 69)
                    .position(self.positionSketchBook)
                    .gesture(sketchDrag)
                    .shadow(color: .black.opacity(0.1), radius: 1, x: 1, y: 1)
                
                Image("PencilCase")
                    .resizable()
                    .frame(width: 93, height: 77)
                    .rotationEffect(Angle(degrees: 10))
                    .position(self.positionPencilCase)
                    .gesture(pencilCaseDrag)
                    .shadow(color: .black.opacity(0.1), radius: 1, x: 1, y: 1)
                
                Image("Camera")
                    .resizable()
                    .frame(width: 43, height: 32)
                    .position(self.positionCamera)
                    .gesture(cameraDrag)
                    .shadow(color: .black.opacity(0.1), radius: 1, x: 1, y: 1)
                
                Image("MakeUp")
                    .resizable()
                    .frame(width: 59, height: 34)
                    .position(self.positionMakeUp)
                    .gesture(makeUpDrag)
                    .shadow(color: .black.opacity(0.1), radius: 1, x: 1, y: 1)
            }
        }
    }
}

struct Minigame3_Packing_Previews: PreviewProvider {
    static var previews: some View {
        Minigame3_Packing(moveableClothes: .constant(false), moveableSketchBook: .constant(false), moveablePencilCase: .constant(false), moveableMakeUp: .constant(false), moveableCamera: .constant(false))
    }
}
