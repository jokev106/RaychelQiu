//
//  Chapter3_Lift.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 17/11/22.
//

import SwiftUI

struct Chapter3_Lift: View {
    
    @Binding var mainOnTap: Bool
    @State var onTap = false
    @State var scene = 1
    
    //Scene1
    @State var lift_left_x = -3.5
    @State var lift_right_x = -3.5
    @State var raychel_opac = 0.0
    @State var raychel_y = 25.0
    @State var raychel_x = -20.0
    
    var body: some View {
        GeometryReader{geometry in
            ZStack{
                Image("Border")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 361, height: 491)
                    .offset(y: -114)
                
                
                ZStack{
                    Image("Chapter3_Lift_BG")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(y: -25)
                    
                    //Scene1
                    if scene == 1 || scene == 2 {
                        ZStack{
                            Image("Chapter3_Lift")
                                .resizable()
                                .scaledToFit()
                                .offset(y: -25)
                            Image("Chapter3_Lift_BG_Inside")
                                .resizable()
                                .scaledToFit()
                                .offset(x: -3.5, y: 3)
                            Image("Chapter3_Lift_Left")
                                .resizable()
                                .scaledToFit()
                                .offset(x: lift_left_x, y: 3)
                                .mask{
                                    Image("Chapter3_Lift_Left")
                                        .resizable()
                                        .scaledToFit()
                                        .offset(x: -3.5, y: 3)
                                }
                            Image("Chapter3_Lift_Right")
                                .resizable()
                                .scaledToFit()
                                .offset(x: lift_right_x, y: 3)
                                .mask{
                                    Image("Chapter3_Lift_Right")
                                        .resizable()
                                        .scaledToFit()
                                        .offset(x: -3.5, y: 3)
                                }
                            Image("Chapter3_Lift_Lamp")
                                .resizable()
                                .scaledToFit()
                                .offset(y: -25)
                            Image("Chapter3_Lift_Raychel")
                                .resizable()
                                .scaledToFit()
                                .opacity(raychel_opac)
                                .offset(x: raychel_x, y: raychel_y)
                               
                        }
                        .onAppear{
                            chapter3_lift_scene1_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
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
    
    func chapter3_lift_scene1_in(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeInOut(duration: 1.0)) {
                raychel_opac += 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeInOut(duration: 2.0)) {
                raychel_x += 20
                raychel_y -= 50
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            withAnimation(.easeInOut(duration: 2.0)) {
                lift_left_x -= 50.0
                lift_right_x += 50.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.5) {
            withAnimation(.easeInOut(duration: 2.0)) {
                raychel_x += 20
                raychel_y -= 30
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.5) {
            withAnimation(.easeInOut(duration: 1.0)) {
                raychel_opac -= 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 8.0) {
            withAnimation(.easeInOut(duration: 2.0)) {
                lift_left_x += 50.0
                lift_right_x -= 50.0
            }
        }
    }
}

struct Chapter3_Lift_Previews: PreviewProvider {
    static var previews: some View {
        Chapter3_Lift(mainOnTap: .constant(false))
    }
}
