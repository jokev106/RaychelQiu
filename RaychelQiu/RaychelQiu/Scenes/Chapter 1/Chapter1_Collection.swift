//
//  Chapter1_Collection.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 08/11/22.
//

import SwiftUI

struct Chapter1_Collection: View {
    
    @State var scene = 1
    @State var onTap = false
    @State var mainOnTap = false
    
    //Scene1
    @State var scene1_offset_x = 0.0
    @State var scene1_paralax_x = 0.0
    
    //Scene2
    @State var scene2_offset_x = 400.0
    @State var mom_scaled_x = 0.0
    
    
    var body: some View {
        GeometryReader{ geometry in
            Image("StoryBG")
                .resizable()
                .ignoresSafeArea(.all)
            if scene == 1 || scene == 2 {
                Game4_1View(mainOnTap: $mainOnTap, scene1_paralax_x: $scene1_paralax_x)
                    .onTapGesture{
                        if mainOnTap == true{
                            mainOnTap = false
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                withAnimation(.easeInOut(duration: 2)) {
                                    scene1_paralax_x += 70
                                    scene1_offset_x -= 400
                                }
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                scene += 1
                            }
                        }
                        
                    }
                    .offset(x: scene1_offset_x)
            }
            
            if scene == 2 || scene == 3 {
                Chapter1_Mom(mainOnTap: $mainOnTap, mom_scaled_x: $mom_scaled_x)
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            withAnimation(.easeInOut(duration: 2)) {
                                scene2_offset_x -= 400
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                            onTap = true
                        }
                    }
                    .offset(x: scene2_offset_x)
                    .onTapGesture {
                        withAnimation{
                            if mainOnTap == true{
                                mainOnTap = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    withAnimation(.easeInOut(duration: 2)) {
                                        scene2_offset_x -= 400
                                        mom_scaled_x += 70
                                    }
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    scene += 1
                                }
                            }
                            
                        }
                    }
                }
            
            if scene == 3 {
                Chapter1_Sketch(mainOnTap: $mainOnTap)
                    .onAppear{
                        scene1_offset_x = 400
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            withAnimation(.easeInOut(duration: 2)) {
                                scene1_offset_x -= 400
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                            onTap = true
                        }
                    }
                    .onTapGesture{
//                        if mainOnTap == true{
//                            mainOnTap = false
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                                withAnimation(.easeInOut(duration: 2)) {
////                                    scene1_offset_x -= 400
//                                }
//                            }
//                        }

                    }
                    .offset(x: scene1_offset_x)
            }
            
        }
    }
}

struct Chapter1_Collection_Previews: PreviewProvider {
    static var previews: some View {
        Chapter1_Collection()
    }
}
