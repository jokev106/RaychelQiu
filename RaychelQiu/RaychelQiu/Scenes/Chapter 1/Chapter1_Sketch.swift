//
//  Chapter1_Sketch.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 14/11/22.
//

import SwiftUI

struct Chapter1_Sketch: View {
    
    @Binding var mainOnTap: Bool
    @State var onTap = false
    @State var scene_x = -70.0
    
    var body: some View {
        GeometryReader{geometry in
            ZStack{
                Image("Border")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 361, height: 491)
                    .offset(y: -114)
                
                
                ZStack{
                    Image("Chapter1_BG")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    
                    ZStack{
                        Image("Chapter1_Desk")
                            .resizable()
                            .scaledToFit()
                        Image("Chapter1_Desk_Book")
                            .resizable()
                            .scaledToFit()
                        ZStack{
                            Image("Chapter1_Sketch1")
                                .resizable()
                                .scaledToFit()
                            Image("Chapter1_Sketch2")
                                .resizable()
                                .scaledToFit()
                            Image("Chapter1_Sketch3")
                                .resizable()
                                .scaledToFit()
                            Image("Chapter1_Sketch4")
                                .resizable()
                                .scaledToFit()
                            Image("Chapter1_Sketch5")
                                .resizable()
                                .scaledToFit()
                        }
                        Image("Chapter1_Light")
                            .resizable()
                            .scaledToFit()
                        Image("Chapter1_Lamp")
                            .resizable()
                            .scaledToFit()
                        Image("Chapter1_Desk_Pen")
                            .resizable()
                            .scaledToFit()
                        Image("Chapter1_Desk_Raychel")
                            .resizable()
                            .scaledToFit()
                    }
                    .offset(x: scene_x)
                    .onAppear{
                        chapter1_desk_scene1_in()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            mainOnTap = true
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
    
    func chapter1_desk_scene1_in(){
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 2.0)) {
                scene_x += 70.0
            }
        }
    }
}

struct Chapter1_Sketch_Previews: PreviewProvider {
    static var previews: some View {
        Chapter1_Sketch(mainOnTap: .constant(false))
    }
}
