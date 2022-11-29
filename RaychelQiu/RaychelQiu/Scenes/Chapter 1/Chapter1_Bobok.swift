//
//  Chapter1_Bobok.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 23/11/22.
//

import SwiftUI

struct Chapter1_Bobok: View {
    
    @Binding var mainOnTap: Bool
    @State var onTap = false
    @State var scene = 1
    
    @State var raychel_opac = 1.0
    @State var raychel_phone_opac = 0.0
    
    @Binding var scene_x: Double
    
    var body: some View {
        GeometryReader{geometry in
            ZStack{
                Image("Border")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 361, height: 491)
                    .offset(y: -114)
                
                
                ZStack{
                    Image("Chapter1_Bobok_BG")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: scene_x)
                    
                    ZStack{
                        Image("Chapter1_Bobok_Books")
                            .resizable()
                            .scaledToFit()
                        Image("Chapter1_Bobok_Lamp")
                            .resizable()
                            .scaledToFit()
                        Image("Chapter1_Bobok_Pictures")
                            .resizable()
                            .scaledToFit()
                        Image("Chapter1_Bobok_Raychel")
                            .resizable()
                            .scaledToFit()
                            .opacity(raychel_opac)
                        Image("Chapter1_Bobok_Raychel_Phone")
                            .resizable()
                            .scaledToFit()
                            .opacity(raychel_phone_opac)
                    }
                    .offset(x: scene_x)
                    .onAppear{
                        chapter1_bobok_scene1_in()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
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
    
    func chapter1_bobok_scene1_in(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(.easeInOut(duration: 1.0)) {
                raychel_phone_opac += 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 1.0)) {
                raychel_opac -= 1.0
            }
        }
    }
}

struct Chapter1_Bobok_Previews: PreviewProvider {
    static var previews: some View {
        Chapter1_Bobok(mainOnTap: .constant(false), scene_x: .constant(0.0))
    }
}
