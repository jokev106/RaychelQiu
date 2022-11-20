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

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("Border")
                    .resizable()
                    //                    .scaledToFit()
                    //                    .scaleEffect(0.92)
                    .frame(width: 361, height: 491)
                    .offset(y: -114)

                ZStack {
                    Image("Calendar_BG")
                        .resizable()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    
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
                .mask {
                    Image("Day")
                        .resizable()
                        .scaledToFit()
                }
                .scaleEffect(geometry.size.width * 0.00356)
                .offset(y: geometry.size.height * 0.026)
            }
            .onAppear {
                chapter2_calendar_scene1_in()
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    mainOnTap = true
//                    onTap = true
                }
            }
//            .onTapGesture {
//                if onTap == true {
//                    onTap = false
//                    scene += 1
//                }
//            }
        }
    }

    func chapter2_calendar_scene1_in() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
            withAnimation(.easeInOut(duration: 1)) {
                mark_1_opacity[0] = 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeInOut(duration: 1)) {
                mark_1_opacity[1] = 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(.easeInOut(duration: 1)) {
                mark_1_opacity[2] = 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 1)) {
                mark_1_opacity[3] = 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeInOut(duration: 1)) {
                mark_1_opacity[4] = 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            withAnimation(.easeInOut(duration: 1)) {
                mark_1_opacity[5] = 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation(.easeInOut(duration: 1)) {
                mark_1_opacity[6] = 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
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

struct Chapter2_Calendar_Previews: PreviewProvider {
    static var previews: some View {
        Chapter2_Calendar(mainOnTap: .constant(false))
    }
}
