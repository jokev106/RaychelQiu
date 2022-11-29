//
//  Chapter4_Calendar.swift
//  RaychelQiu
//
//  Created by Jonathan Valentino on 25/11/22.
//

import SwiftUI

struct Chapter4_Calendar: View {
    @State var scene = 1
    @State var onTap = false
    @Binding var mainOnTap: Bool

    // Scene1
    @State var mark_1_opacity = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
    @State var tm_1_rotation = 0.0
    @State var group_1_y = 300.0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("Border")
                    .resizable()
                    //                    .scaledToFit()
                    //                    .scaleEffect(0.92)
                    .frame(width: 330, height: 449.6)
                    .offset(y: -114)
                    
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
                .scaleEffect(geometry.size.width * 0.00324)
                .offset(y: geometry.size.height * 0.011)
            }
        }
    }

    func chapter2_calendar_scene1_in() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeOut(duration: 2)) {
                group_1_y = 0.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeInOut(duration: 1)) {
                mark_1_opacity[0] = 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            withAnimation(.easeInOut(duration: 1)) {
                mark_1_opacity[1] = 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation(.easeInOut(duration: 1)) {
                mark_1_opacity[2] = 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            withAnimation(.easeInOut(duration: 1)) {
                mark_1_opacity[3] = 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            withAnimation(.easeInOut(duration: 1)) {
                mark_1_opacity[4] = 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
            withAnimation(.easeInOut(duration: 1)) {
                mark_1_opacity[5] = 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            withAnimation(.easeInOut(duration: 1)) {
                mark_1_opacity[6] = 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
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
}

struct Chapter4_Calendar_Previews: PreviewProvider {
    static var previews: some View {
        Chapter4_Calendar(mainOnTap: .constant(false))
    }
}
