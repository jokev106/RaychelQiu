//
//  Chapter2_Collection.swift
//  RaychelQiu
//
//  Created by Jonathan Valentino on 14/11/22.
//

import SwiftUI

struct Chapter2_Collection: View {
    @State var scene = 1
    @State var onTap = false
    @State var mainOnTap = false
    
    //Scene1
    @State var scene1_offset_x = 0.0
    
    //Scene2
    @State var scene2_offset_x = 400.0
    
    //Scene3
    @State var scene3_offset_x = 400.0
    
    //Scene4
    @State var scene4_offset_x = 400.0
    
    var body: some View {
        GeometryReader{ geometry in
            if scene == 1 || scene == 2 {
                Chapter2_Calendar(mainOnTap: $mainOnTap)
                    .onTapGesture{
                        if mainOnTap == true {
                            mainOnTap = false
                            
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                scene += 1
                                withAnimation(.easeInOut(duration: 2)) {
                                    scene1_offset_x -= 400
                                }
                            }
                        }
                        
                    }
                    .offset(x: scene1_offset_x)
            }
            
            if scene == 2 || scene == 3 {
                Chapter2_Bus(scene: 1, mainOnTap: $mainOnTap)
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            withAnimation(.easeInOut(duration: 2)) {
                                scene2_offset_x -= 400
                            }
                        }
                    }
                    .offset(x: scene2_offset_x)
                    .onTapGesture{
                        if mainOnTap == true {
                            mainOnTap = false
                            
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                scene += 1
                                withAnimation(.easeInOut(duration: 2)) {
                                    scene2_offset_x -= 400
                                }
                            }
                        }
                    }
            }
            
            if scene == 3 || scene == 4 {
                Chapter2_TM(scene: 1, mainOnTap: $mainOnTap)
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            withAnimation(.easeInOut(duration: 2)) {
                                scene3_offset_x -= 400
                            }
                        }
                    }
                    .offset(x: scene3_offset_x)
                    .onTapGesture{
                        if mainOnTap == true {
                            mainOnTap = false
                            
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                scene += 1
                                withAnimation(.easeInOut(duration: 2)) {
                                    scene3_offset_x -= 400
                                }
                            }
                        }
                    }
            }
            
            if scene == 4 || scene == 5 {
                Chapter2_Bus(scene: 2, mainOnTap: $mainOnTap)
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            withAnimation(.easeInOut(duration: 2)) {
                                scene4_offset_x -= 400
                            }
                        }
                    }
                    .offset(x: scene4_offset_x)
                    .onTapGesture{
                        if mainOnTap == true {
                            mainOnTap = false
                            
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                withAnimation(.easeInOut(duration: 2)) {
                                    scene += 1
                                }
                            }
                        }
                    }
            }
            
            if scene == 5 || scene == 6 {
                Chapter2_Home(scene: 1, mainOnTap: $mainOnTap)
                    .offset(x: scene4_offset_x)
                    .onTapGesture{
                        if mainOnTap == true {
                            mainOnTap = false
                            
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                scene += 1
                                withAnimation(.easeInOut(duration: 2)) {
                                    scene4_offset_x -= 400
                                }
                            }
                        }
                    }
            }
        }
    }
}

struct Chapter2_Collection_Previews: PreviewProvider {
    static var previews: some View {
        Chapter2_Collection()
    }
}
