//
//  Game1_CaptchaPuzzle.swift
//  RaychelQiu
//
//  Created by Jonathan Kevin on 01/11/22.
//

import SwiftUI

struct Game1_CaptchaPuzzle: View {
    
    @State var isWinter1: Bool = false
    @State var isWinter2: Bool = false
    @State var isWinter3: Bool = false

    @State var positionPhone = CGPoint(x: 68, y: 480)
    @State var positionWinterJacket1 = CGPoint(x: 129, y: 206.3)
    @State var positionWinterJacket2 = CGPoint(x: 269, y: 283.6)
    @State var positionWinterJacket3 = CGPoint(x: 197.6, y: 364)
    @State var positionChevronButton = CGPoint(x: 325.6, y: 735.3)
    
    @State var moveableBook: Bool = false
    @State var book: Bool = false
    

    
    
    
    var body: some View {
        
        let dragBook = DragGesture(coordinateSpace: .local)
            .onChanged({ gesture in
                if moveableBook == false {
                    self.positionChevronButton = gesture.location
                }
            })
               .onEnded {gesture in
                   if self.positionChevronButton.x > 250 {
                       self.moveableBook = true
                       book = true
                       
                   }
               }
        
        GeometryReader {geo in
            ZStack{
                Image("CaptchaPhone2")
                    .resizable()
                    .frame(width: 630, height: 800)
                    .position(self.positionPhone)
                
                if isWinter1 == false || isWinter2 == false || isWinter3 == false {
                    ZStack{
                                
                        Group{
                            Image("WinterJacket1")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .scaledToFit()
                                .border(isWinter1 ? .green : .white, width: 2)
                                .cornerRadius(4)
                                .onTapGesture {
                                    isWinter1.toggle()
                                }
                                .position(self.positionWinterJacket1)
                            Image("WinterJacket2")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .border(isWinter2 ? .green : .white, width: 2)
                                .cornerRadius(4)

                                .onTapGesture {
                                    isWinter2.toggle()
                                }
                                .position(self.positionWinterJacket2)
                            Image("WinterJacket3")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .border(isWinter3 ? .green : .white, width: 2)
                                .cornerRadius(4)
                                .onTapGesture {
                                    isWinter3.toggle()
                                }
                                .position(self.positionWinterJacket3)
                        }
                        
                    }
                }
                if isWinter1 == true && isWinter2 == true && isWinter3 == true {
                    ZStack{
                        Group{
                            Image("WinterJacket1")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .scaledToFit()
                                .border(isWinter1 ? .green : .white, width: 2)
                                .cornerRadius(4)
                                .onTapGesture {
                                    isWinter1.toggle()
                                }
                                .position(self.positionWinterJacket1)
                            Image("WinterJacket2")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .border(isWinter2 ? .green : .white, width: 2)
                                .cornerRadius(4)

                                .onTapGesture {
                                    isWinter2.toggle()
                                }
                                .position(self.positionWinterJacket2)
                            Image("WinterJacket3")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .border(isWinter3 ? .green : .white, width: 2)
                                .cornerRadius(4)
                                .onTapGesture {
                                    isWinter3.toggle()
                                }
                                .position(self.positionWinterJacket3)
                        }
                        Group{
                            Image(systemName: "chevron.right.circle")
                                .resizable()
                                .foregroundColor(Color("PurplePastel"))
                                .frame(width: 70, height: 70)
                                .onTapGesture {
                                    withAnimation(.default) {
                                        
                                    }
                                }
                                .position(self.positionChevronButton)
//                                .gesture(dragBook)
                        }.transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.8)))
                    }
                    
                }
            }
        }
    }
}

struct Game1_CaptchaPuzzle_Previews: PreviewProvider {
    static var previews: some View {
        Game1_CaptchaPuzzle()
    }
}
