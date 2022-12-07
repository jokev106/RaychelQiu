//
//  Chapter3_Outside.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 23/11/22.
//

import SwiftUI

struct Chapter3_Outside: View {
    
    @Binding var mainOnTap: Bool
    @State var onTap = false
    @State var scene = 1
    
    @State var building_x = -70.0
    @State var tree_x = -110.0
    
    var body: some View {
        GeometryReader{geometry in
            ZStack{
                Image("Border")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 330, height: 449.6)
                    .offset(y: -102)
                
                ZStack{
                    Image("Chapter3_Outside_BG")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: building_x)
                    
                    //Scene1
                    if scene == 1 || scene == 2 {
                        ZStack{
                            Image("Chapter3_Outside_Tree")
                                .resizable()
                                .scaledToFit()
                                .offset(x: tree_x)
                            Image("Chapter3_Outside_Building")
                                .resizable()
                                .scaledToFit()
                                .offset(x: building_x)
                            Image("Chapter3_Outside_Raychel")
                                .resizable()
                                .scaledToFit()
                                .offset(x: building_x)
                        }
                        .onAppear{
                            chapter3_outside_scene1_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
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
                .scaleEffect(1.27)
                .offset(y: 20)
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
}

struct Chapter3_Outside_Previews: PreviewProvider {
    static var previews: some View {
        Chapter3_Outside(mainOnTap: .constant(false))
    }
}
