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
    @State var friend_2_x = 0.0
    
    //Scene2
    @State var scene2_offset_x = 400.0
    
    //Scene3
    @State var parent_visible_x = 0.0
    
    var body: some View {
        GeometryReader{ geometry in
            if scene == 1 || scene == 2 {
                Prologue_Kelas(mainOnTap: $mainOnTap, friend_2_x: $friend_2_x)
                    .onTapGesture{
                        if mainOnTap == true{
                            mainOnTap = false
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                withAnimation(.easeInOut(duration: 2)) {
                                    friend_2_x -= 70
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
                Prologue_Clock(mainOnTap: $mainOnTap)
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
                Prologue_Dinner2(mainOnTap: $mainOnTap, parent_visible_x: $parent_visible_x)
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
//                                    scene1_offset_x -= 400
//                                    parent_visible_x += 50.0
//                                }
//                            }
//
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                                scene += 1
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
