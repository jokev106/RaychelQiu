//
//  SceneMultiple.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 25/10/22.
//

import SwiftUI

struct SceneMultiple: View {
    
    @State var scaleXY = 0.5
    @State var opac = 0.0
    @State var rotation = 0.0
    @State var positioning = 0.0
    @State var bgScale = 1
    @State var bgOpac = 0.0
    @State var bgX = 600
    @State var onTap = false
    @State var navigationIsShowing = false
    
    @State var scene = 1
    
    @State var scaleXY2 = 0.5
    @State var opac2 = 0.0
    @State var rotation2 = 0.0
    @State var positioning2 = 0.0
    @State var bgScale2 = 0.4
    @State var bgOpac2 = 0.0
    @State var bgX2 = 600
    @State var knightx = 300
    
    @State var scaleXY3 = 0.5
    @State var opac3 = 0.0
    @State var rotation3 = 0.0
    @State var positioning3 = 0.0
    @State var bgScale3 = 1
    @State var bgOpac3 = 0.0
    @State var bgX3 = 1100
    
    var body: some View {
        GeometryReader{ geometry in
//            if scene == 1 {
//                    SceneTabView()
//     //                .transition(.opacity)
//                    .onAppear{
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
//                            onTap = true
//                        }
//                    }
//                    .onTapGesture {
//                        withAnimation{
//                            if onTap == true {
//                                scene += 1
//                                onTap = false
//                            }
//                        }
//                    }
//                }
//
//
//            if scene == 2 {
//                ZStack{
//                    Image("Night")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .edgesIgnoringSafeArea(.all)
//                        .frame(width: geometry.size.width, height: geometry.size.height * 1.2, alignment: .bottom)
//                        .scaleEffect(CGFloat(bgScale2))
//                        .position(x: CGFloat(bgX2), y: 400)
//                        .opacity(bgOpac2)
//                        .border(.green)
//                        .onAppear{
//                            setAnimation2()
//                        }
//
//                    VStack{
//                        Spacer()
//                        HStack{
//                            Spacer()
//                            ZStack{
//                                Image("Knight")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.7, alignment: .bottomLeading)
//                                    .offset(x:-geometry.size.width * 0.2, y: -geometry.size.height * 0.2)
//                                    .opacity(opac2)
//                                    .scaleEffect(CGFloat(scaleXY2))
//                                    .rotationEffect(.degrees(rotation2))
//                                    .position(x: CGFloat(knightx), y: 300)
//                            }
//                        }
//                        Spacer()
//                    }
//                }
////                .transition(.asymmetric(insertion: .scale, removal: .opacity))
//                .onTapGesture {
//                    outAnimation2()
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
//                        scene += 1
//                    }
//
//                }
//            }
//
//            if scene == 3 {
//                ZStack{
//                    Image("Testing")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .edgesIgnoringSafeArea(.all)
//                        .frame(width: geometry.size.width, height: geometry.size.height * 1.2, alignment: .bottom)
//                        .scaleEffect(CGFloat(bgScale3))
//                        .position(x: CGFloat(bgX3), y: 400)
//                        .opacity(1)
//                        .onAppear{
//                            setAnimation3()
//                        }
//
//                    VStack{
//                        Spacer()
//                        HStack{
//                            Spacer()
//                            ZStack{
//                                Image("Knight")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.7, alignment: .bottomTrailing)
//                                    .offset(x:-geometry.size.width * 0.2, y: -geometry.size.height * 0.2)
//                                    .opacity(opac3)
//                                    .scaleEffect(CGFloat(scaleXY3))
//                                    .rotationEffect(.degrees(rotation3))
//                            }
//                        }
//                    }
//                }
////                .transition(.opacity)
//                .onTapGesture {
//                    withAnimation{
//                        scene += 1
//                    }
//                }
//            }
        }
        .navigationBarBackButtonHidden(true)
        .transition(.slide)
    }
    
    
    
    func setAnimation2(){
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeOut(duration: 4)) {
                bgX2 -= 600
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 1)) {
                bgOpac2 += 1.0
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            withAnimation(.easeInOut(duration: 1)) {
                scaleXY2 += 0.5
                opac2 += 1.0
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            withAnimation( .easeInOut(duration: 2.0).repeatForever(autoreverses: true).speed(2)) {
                rotation2 += 5
            }
        }
    }
    
    func outAnimation2(){
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeOut(duration: 2)) {
                bgX2 -= 600
                knightx -= 600
            }
        }
    }
    
    func setAnimation3(){
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeOut(duration: 4)) {
                bgX3 -= 600
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 1)) {
                bgOpac3 += 1.0
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            withAnimation(.easeInOut(duration: 1)) {
                scaleXY3 += 0.5
                opac3 += 1.0
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            withAnimation( .easeInOut(duration: 2.0).repeatForever(autoreverses: true).speed(2)) {
                rotation3 += 5
            }
        }
    }
}

struct SceneMultiple_Previews: PreviewProvider {
    static var previews: some View {
        SceneMultiple()
    }
}
