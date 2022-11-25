//
//  Chapter3_Phone.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 22/11/22.
//

import SwiftUI

struct Chapter3_Phone: View {
    
    @Binding var mainOnTap: Bool
    @State var onTap = false
    @State var scene = 1
    
    @Binding var scene1_paralax_x: Double
    
    //Scene1
    @State var building_x = -70.0
    @State var tree_x = -110.0
    
    //Scene2
    @State var bg_opac = 0.0
    @State var rotation_x = 50.0
    @State var rotation_y = 20.0
    @State var rotation_degrees = 70.0
    
    @State var text1_opac = 0.0
    @State var text2_opac = 0.0
    @State var text3_opac = 0.0
    @State var text4_opac = 0.0
    @State var text5_opac = 0.0
    @State var text6_opac = 0.0
    @State var text7_opac = 0.0
    @State var text8_opac = 0.0
    @State var text9_opac = 0.0
    @State var text10_opac = 0.0
    
    @State var text_num = 1
    
    var body: some View {
        GeometryReader{geometry in
            ZStack{
                Image("Border")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 361, height: 491)
                    .offset(y: -114)
                
                ZStack{
                    Image("Chapter3_Outside_BG")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width, height: geometry.size.height)
//                        .offset(x: building_x)
                    
                    //Scene1
                    if scene == 1 || scene == 2 {
                        ZStack{
                            Image("Chapter3_Outside_Tree")
                                .resizable()
                                .scaledToFit()
//                                .offset(x: tree_x)
                            Image("Chapter3_Outside_Building")
                                .resizable()
                                .scaledToFit()
//                                .offset(x: building_x)
                            Image("Chapter3_Outside_Raychel")
                                .resizable()
                                .scaledToFit()
//                                .offset(x: building_x)
                        }
                        .onAppear{
                            chapter3_outside_scene1_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                onTap = true
                            }
                        }
                        .onTapGesture{
                            if onTap == true{
                                onTap = false
                                scene += 1
                            }
                        }
                    }
                    
                    //Scene3
                    if scene == 3 || scene == 4{
                        ZStack{
                            Image("Chapter3_Phone_BG")
                                .resizable()
                                .scaledToFit()
                                .opacity(bg_opac)
                            ZStack{
                                Image("Chapter3_Phone_Hand")
                                    .resizable()
                                    .scaledToFit()
                                Image("Chapter3_Phone")
                                    .resizable()
                                    .scaledToFit()
                                Group{
                                    Image("Chapter3_Phone_Text1")
                                        .resizable()
                                        .scaledToFit()
                                        .opacity(text1_opac)
                                    Image("Chapter3_Phone_Text2")
                                        .resizable()
                                        .scaledToFit()
                                        .opacity(text2_opac)
                                    Image("Chapter3_Phone_Text3")
                                        .resizable()
                                        .scaledToFit()
                                        .opacity(text3_opac)
                                    Image("Chapter3_Phone_Text4")
                                        .resizable()
                                        .scaledToFit()
                                        .opacity(text4_opac)
                                    Image("Chapter3_Phone_Text5")
                                        .resizable()
                                        .scaledToFit()
                                        .opacity(text5_opac)
                                    
                                }
                                Group{
                                    Image("Chapter3_Phone_Text6")
                                        .resizable()
                                        .scaledToFit()
                                        .opacity(text6_opac)
                                    Image("Chapter3_Phone_Text7")
                                        .resizable()
                                        .scaledToFit()
                                        .opacity(text7_opac)
                                    Image("Chapter3_Phone_Text8")
                                        .resizable()
                                        .scaledToFit()
                                        .opacity(text8_opac)
                                    Image("Chapter3_Phone_Text9")
                                        .resizable()
                                        .scaledToFit()
                                        .opacity(text9_opac)
                                    Image("Chapter3_Phone_Text10")
                                        .resizable()
                                        .scaledToFit()
                                        .opacity(text10_opac)
                                }
                                   
                            }
                        }
                        .offset(x: scene1_paralax_x)
                        .onAppear{
                            mainOnTap = true
                        }
                    }
                    
                    //Scene2
                    if scene == 2 || scene == 3{
                        Image("Chapter3_Phone_BG")
                            .resizable()
                            .scaledToFit()
                            .opacity(bg_opac)
                        ZStack{
                            Image("Chapter3_Phone_Hand")
                                .resizable()
                                .scaledToFit()
                            Image("Chapter3_Phone")
                                .resizable()
                                .scaledToFit()
                            Group{
                                Image("Chapter3_Phone_Text1")
                                    .resizable()
                                    .scaledToFit()
                                    .opacity(text1_opac)
                                Image("Chapter3_Phone_Text2")
                                    .resizable()
                                    .scaledToFit()
                                    .opacity(text2_opac)
                                Image("Chapter3_Phone_Text3")
                                    .resizable()
                                    .scaledToFit()
                                    .opacity(text3_opac)
                                Image("Chapter3_Phone_Text4")
                                    .resizable()
                                    .scaledToFit()
                                    .opacity(text4_opac)
                                Image("Chapter3_Phone_Text5")
                                    .resizable()
                                    .scaledToFit()
                                    .opacity(text5_opac)
                                
                            }
                            Group{
                                Image("Chapter3_Phone_Text6")
                                    .resizable()
                                    .scaledToFit()
                                    .opacity(text6_opac)
                                Image("Chapter3_Phone_Text7")
                                    .resizable()
                                    .scaledToFit()
                                    .opacity(text7_opac)
                                Image("Chapter3_Phone_Text8")
                                    .resizable()
                                    .scaledToFit()
                                    .opacity(text8_opac)
                                Image("Chapter3_Phone_Text9")
                                    .resizable()
                                    .scaledToFit()
                                    .opacity(text9_opac)
                                Image("Chapter3_Phone_Text10")
                                    .resizable()
                                    .scaledToFit()
                                    .opacity(text10_opac)
                            }
                               
                        }
                        .offset(x: scene1_paralax_x,y: rotation_y)
                        .rotationEffect(.degrees(rotation_degrees), anchor: .leading)
                        .onAppear{
                            chapter3_phone_scene1_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.7) {
                                onTap = true
                            }
                        }
                        .onTapGesture{
                            if onTap == true{
                                onTap = false
                                if text_num == 1{
                                    chapter3_phone_text1()
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.7) {
                                        onTap = true
                                        text_num += 1
                                    }
                                }
                                
                                if text_num == 2{
                                    chapter3_phone_text2()
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.7) {
                                        onTap = true
                                        text_num += 1
                                    }
                                }
                                
                                if text_num == 3{
                                    chapter3_phone_text3()
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.7) {
                                        onTap = true
                                        text_num += 1
                                    }
                                }
                                
                                if text_num == 4{
                                    chapter3_phone_text4()
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 7.7) {
                                        onTap = true
                                        text_num += 1
                                    }
                                }
                                
                                if text_num == 5{
                                    chapter3_phone_text5()
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.7) {
                                        onTap = true
                                        scene += 1
                                    }
                                }
                            }
                        }
                    }
                    
                    
                }
                .mask {
                    Image("Day")
                        .resizable()
                        .scaledToFit()
                }
                .scaleEffect(geometry.size.width * 0.00356)
                .offset(y: geometry.size.height * 0.026)
            }
            
            
        }
    }
    
    func chapter3_outside_scene1_in(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
            withAnimation(.easeInOut(duration: 2.0)) {
                building_x += 70
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
            withAnimation(.easeIn(duration: 2.0)) {
                tree_x += 80
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeOut(duration: 0.8)) {
                tree_x += 30
            }
        }
    }
    
    func chapter3_phone_scene1_in(){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeInOut(duration: 1.0)) {
                bg_opac += 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 2.0)) {
                rotation_y -= 20
//                rotation_x -= 30
                rotation_degrees -= 70
//                rotation_x -= 30
                scene1_paralax_x -= 30
                scene1_paralax_x -= 30
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            withAnimation(.easeInOut(duration: 1.0)) {
//                rotation_x += 10
                scene1_paralax_x += 10
            }
        }
    }
    
    func chapter3_phone_text1(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeInOut(duration: 1.0)) {
                text1_opac += 1.0
            }
        }
    }
    
    func chapter3_phone_text2(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeInOut(duration: 1.0)) {
                text2_opac += 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            withAnimation(.easeInOut(duration: 1.0)) {
                text3_opac += 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
            withAnimation(.easeInOut(duration: 1.0)) {
                text4_opac += 1.0
            }
        }
    }

    func chapter3_phone_text3(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeInOut(duration: 1.0)) {
                text5_opac += 1.0
            }
        }
    }

    func chapter3_phone_text4(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeInOut(duration: 1.0)) {
                text6_opac += 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            withAnimation(.easeInOut(duration: 1.0)) {
                text7_opac += 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
            withAnimation(.easeInOut(duration: 1.0)) {
                text8_opac += 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.5) {
            withAnimation(.easeInOut(duration: 1.0)) {
                text9_opac += 1.0
            }
        }
    }

    func chapter3_phone_text5(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeInOut(duration: 1.0)) {
                text10_opac += 1.0
            }
        }
    }

}

struct Chapter3_Phone_Previews: PreviewProvider {
    static var previews: some View {
        Chapter3_Phone(mainOnTap: .constant(false), scene1_paralax_x: .constant(0.0))
    }
}
