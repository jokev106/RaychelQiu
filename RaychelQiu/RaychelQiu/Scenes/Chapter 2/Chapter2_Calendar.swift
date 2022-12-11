//
//  Scene_Calendar.swift
//  RaychelQiu
//
//  Created by Jonathan Valentino on 14/11/22.
//

import SwiftUI

struct Chapter2_Calendar: View {
    @State var scene = 1
    @State var onTap = false
    @Binding var mainOnTap: Bool

    // Scene1
    @State var mark_1_opacity = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
    @State var tm_1_rotation = 0.0
    @State var group_1_y = 300.0
    
    // Scene2
    @State var clock_2_y = -300.0
    @State var clock_2_x = 0.0
    @State var long_2_y_offset = -300.0
    @State var long_2_x_offset = 0.0
    @State var long_2_rotation = -50.0
    @State var short_2_y_offset = -300.0
    @State var short_2_x_offset = -2.0
    @State var short_2_rotation = 0.0

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("Border")
                    .resizable()
                    //                    .scaledToFit()
                    //                    .scaleEffect(0.92)
                    .frame(width: 330, height: 449.6)
                    .offset(y: -102)
                    
                ZStack {
                    if scene == 1 || scene == 2 {
                        ZStack {
                            Image("Calendar_BG")
                                .resizable()
                                .frame(width: geometry.size.width, height: geometry.size.height)
                            
                            Group {
                                Image("Calendar_Empty")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200)
                                    .offset(y: -90)
                                
                                ForEach(0 ..< 7, id: \.self) { index in
                                    Image("Calendar_Mark")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20)
                                        .offset(x: CGFloat(-75 + (index * 25)), y: -105)
                                        .opacity(mark_1_opacity[index])
                                }
                                
                                Image("Calendar_TM")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40)
                                    .rotationEffect(.degrees(tm_1_rotation))
                                    .offset(x: -75, y: -80)
                            }
                            .offset(y: group_1_y)
                        }
                        .onAppear {
                            chapter2_calendar_scene1_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
                                onTap = true
                            }
                        }
                        .onTapGesture {
                            if onTap == true {
                                onTap = false
                                scene += 1
                            }
                        }
                    }
                    
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
                            DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                                mainOnTap = true
                            }
                        }
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .mask {
                    Image("Day")
                        .resizable()
                        .scaledToFit()
                }
                .scaleEffect(1.27)
                .offset(y: 20)
            }
        }
    }

    func chapter2_calendar_scene1_in() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeOut(duration: 2)) {
                group_1_y = 0.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            withAnimation(.easeInOut(duration: 1)) {
                mark_1_opacity[0] = 1.0
                SFXManager.instance.playSFX(sound: .drawing3)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
            withAnimation(.easeInOut(duration: 1)) {
                mark_1_opacity[1] = 1.0
                SFXManager.instance.playSFX(sound: .drawing3)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            withAnimation(.easeInOut(duration: 1)) {
                mark_1_opacity[2] = 1.0
                SFXManager.instance.playSFX(sound: .drawing3)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.5) {
            withAnimation(.easeInOut(duration: 1)) {
                mark_1_opacity[3] = 1.0
                SFXManager.instance.playSFX(sound: .drawing3)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            withAnimation(.easeInOut(duration: 1)) {
                mark_1_opacity[4] = 1.0
                SFXManager.instance.playSFX(sound: .drawing3)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.5) {
            withAnimation(.easeInOut(duration: 1)) {
                mark_1_opacity[5] = 1.0
                SFXManager.instance.playSFX(sound: .drawing3)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
            withAnimation(.easeInOut(duration: 1)) {
                mark_1_opacity[6] = 1.0
                SFXManager.instance.playSFX(sound: .drawing3)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
            loopAnimation()
        }
    }
    
    func loopAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            tm_1_rotation = 10
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            tm_1_rotation = -10
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            loopAnimation()
        }
    }
    
    func prologue_scene2_animation_in() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
            withAnimation(.easeInOut(duration: 2.0)) {
                group_1_y = 300
                clock_2_y += 300.0
                long_2_y_offset += 300.0
                short_2_y_offset += 300.0
            }
        }
        
        for i in 1 ... 5 {
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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 7.5) {
            withAnimation(.easeIn(duration: 1)) {
//                clock_2_y -= 300.0
//                long_2_y_offset -= 300.0
//                short_2_y_offset -= 300.0
            }
        }
    }
}

struct Chapter2_Calendar_Previews: PreviewProvider {
    static var previews: some View {
        Chapter2_Calendar(mainOnTap: .constant(false))
    }
}
