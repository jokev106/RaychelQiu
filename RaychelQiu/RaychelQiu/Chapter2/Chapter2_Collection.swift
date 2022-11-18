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
    @State var friend_2_x = 0.0
    
    //Scene2
    @State var scene2_offset_x = 400.0
    
    //Scene3
    @State var parent_visible_x = 0.0
    
    var body: some View {
        GeometryReader{ geometry in
            if scene == 1 || scene == 2 {
                Chapter2_Calendar(mainOnTap: $mainOnTap)
                    .onTapGesture{
                        if mainOnTap == true{
                            mainOnTap = false
                            
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                                withAnimation(.easeInOut(duration: 2)) {
//                                    friend_2_x -= 70
//                                    scene1_offset_x -= 400
//                                }
//                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                scene += 1
                            }
                        }
                        
                    }
                    .offset(x: scene1_offset_x)
            }
        }
    }
}

struct Chapter2_Collection_Previews: PreviewProvider {
    static var previews: some View {
        Chapter2_Collection()
    }
}
