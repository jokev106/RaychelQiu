//
//  Chapter3_Call.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 28/11/22.
//

import SwiftUI

struct Chapter3_Call: View {
    
    @Binding var mainOnTap: Bool
    @State var onTap = false
    @State var scene = 1
    @State var scene3_opac = 0.0
    @State var scene3_utensil_opac = 0.0
    @State var scene3_phone_opac = 0.0
    @State var scene3_tea_opac = 0.0
    @State var phone_x = 0.0
    @State var phone_y = 0.0
    
    var body: some View {
        GeometryReader{geometry in
            ZStack{
                Image("Border")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 330, height: 449.6)
                    .offset(y: -102)
                
                ZStack{
                    Image("Chapter3_Call_BG")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width, height: geometry.size.height)
//                        .offset(x: building_x)
                    
                        ZStack{
//                            Image("Chapter3_Call_BG")
//                                .resizable()
//                                .scaledToFit()
//                                .opacity(scene3_opac)
                            Image("Chapter3_Call_Phone")
                                .resizable()
                                .scaledToFit()
                                .opacity(scene3_phone_opac)
                                .offset(x: phone_x, y: phone_y)
                            Image("Chapter3_Call_Tea")
                                .resizable()
                                .scaledToFit()
                                .opacity(scene3_tea_opac)
                            Image("Chapter3_Call_Utensils")
                                .resizable()
                                .scaledToFit()
                                .offset(y: -5)
                                .opacity(scene3_utensil_opac)
                        }
                        .onAppear{
                            chapter3_call_scene1_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
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
    
    func chapter3_call_scene1_in(){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(.easeInOut(duration: 1.0)) {
                scene3_opac += 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeInOut(duration: 1.0)) {
                scene3_utensil_opac += 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            withAnimation(.easeInOut(duration: 1.0)) {
                scene3_tea_opac += 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            withAnimation(.easeInOut(duration: 1.0)) {
                scene3_phone_opac += 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
            withAnimation(.linear(duration: 0.07).repeatForever(autoreverses: true).speed(1.0)) {
                phone_x += 4.0
                phone_y += 2.0
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation(.linear(duration: 2.0).repeatForever(autoreverses: true).speed(2.0)) {
                        phone_x = 0.0
                        phone_y = 0.0
                    }
                }
            }
        }
    }
}

struct Chapter3_Call_Previews: PreviewProvider {
    static var previews: some View {
        Chapter3_Call(mainOnTap: .constant(false))
    }
}
