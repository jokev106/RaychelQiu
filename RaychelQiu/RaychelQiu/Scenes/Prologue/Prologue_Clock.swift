//
//  Prologue_Clock.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 08/11/22.
//

import SwiftUI

struct Prologue_Clock: View {
    
    @State var scene = 1
    @State var onTap = false
    @Binding var mainOnTap: Bool
    
    @State var clock_2_y = 0.0
    @State var clock_2_x = 0.0
    @State var long_2_y_offset = 0.0
    @State var long_2_x_offset = 0.0
    @State var long_2_rotation = -50.0
    @State var short_2_y_offset = 0.0
    @State var short_2_x_offset = -2.0
    @State var short_2_rotation = 0.0
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                Image("Border")
                    .resizable()
                    .frame(width: 330, height: 449.6)
                    .offset(y: -114)
                ZStack{
                    Image("School_BG")
                        .resizable()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    
                    //Scene1
                    if scene == 1{
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
                            prologue_animation_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 8.5) {
                                mainOnTap = true
                            }
                        }
                    }
                }
                .mask {
                    Image("Day")
                        .resizable()
                        .scaledToFit()
                }
                .scaleEffect(geometry.size.width * 0.00324)
                .offset(y: geometry.size.height * 0.011)
            }
            
        }
    }
    
    func prologue_animation_in() {
        
        for i in 1...5{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25 + CGFloat(i) * 1.0) {
                withAnimation(.linear(duration: 1).speed(3.0)) {
                    long_2_rotation += 10.0
                }
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
            withAnimation(.easeOut(duration: 1.5)) {
                SFXManager.instance.playSFX(sound: .ticking_5)
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
    }
}

struct Prologue_Clock_Previews: PreviewProvider {
    static var previews: some View {
        Prologue_Clock(mainOnTap: .constant(false))
    }
}
