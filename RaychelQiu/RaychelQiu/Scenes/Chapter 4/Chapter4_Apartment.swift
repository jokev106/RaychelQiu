//
//  Scene_Calendar.swift
//  RaychelQiu
//
//  Created by Jonathan Valentino on 14/11/22.
//

import SwiftUI

struct Chapter4_Apartment: View {
    @State var scene: Int
    @State var onTap = false
    @Binding var mainOnTap: Bool

    // Scene1
    @State var group_1_y = 300.0

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("Border")
                    .resizable()
//                    .scaledToFit()
//                    .scaleEffect(0.92)
                    .frame(width: 330, height: 449.6)
                    .offset(y: -114)
                    
                ZStack {
                    if scene == 1 || scene == 2 {
                        ZStack {
                            Image("Apartment_BG")
                                .resizable()
                                .frame(width: geometry.size.width, height: geometry.size.height)
                            
                            Image("Apartment_Table")
                                .resizable()
                                .scaledToFit()
                                .offset(y: 55)
                            
                            Image("Apartment_Drawing")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 230)
                                .offset(y: 40)
                            
                            Image("Apartment_Raychel")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 130)
                                .offset(x: 40, y: -60)
                            
                            Image("Apartment_Raychel2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 130)
                                .offset(x: 40, y: -60)
                            
                            Image("Apartment_Friend")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 130)
                                .offset(x: -65, y: -103)
                            
                            Image("Apartment_Bubble")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110)
                                .offset(x: -25, y: -210)
                            
                            Group {}
                                .offset(y: group_1_y)
                        }
                        .onAppear {
                            chapter4_apartment_scene1_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                                mainOnTap = true
//                                onTap = true
                            }
                        }
//                        .onTapGesture {
//                            if onTap == true {
//                                onTap = false
//                                scene += 1
//                            }
//                        }
                    }
                    
                    if scene == 2 {
                        ZStack {
                            Image("Apartment_BG")
                                .resizable()
                                .frame(width: geometry.size.width, height: geometry.size.height)
                            
                            Image("Apartment2_Raychel2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 330)
                            
                            Image("Apartment2_Table")
                                .resizable()
                                .scaledToFit()
                            
                            Image("Apartment2_Fabric")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 330)
                                .offset(x: 0, y: 0)
                            
                            Image("Apartment2_Scissor")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 330)
                            
                            Image("Apartment2_Raychel")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 330)
                            
                            Image("Apartment2_Fabric2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 330)
                                .offset(x: 0, y: 0)
                            
                            Image("Apartment2_Scissor2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 330)
                                .offset(x: 0, y: 0)
                            
                            Group {}
                                .offset(y: group_1_y)
                        }
                        .onAppear {
                            chapter4_apartment_scene1_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                                mainOnTap = true
//                                onTap = true
                            }
                        }
//                        .onTapGesture {
//                            if onTap == true {
//                                onTap = false
//                                scene += 1
//                            }
//                        }
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .mask {
                    Image("Day")
                        .resizable()
                        .scaledToFit()
                }
                .scaleEffect(geometry.size.width * 0.00324)
                .offset(y: geometry.size.height * 0.011)
            }
        }
    }

    func chapter4_apartment_scene1_in() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeOut(duration: 2)) {
                group_1_y = 0.0
            }
        }
    }
}

struct Chapter4_Apartment_Previews: PreviewProvider {
    static var previews: some View {
        Chapter4_Apartment(scene: 2, mainOnTap: .constant(false))
    }
}
