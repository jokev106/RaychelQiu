//
//  Chapter2_Home.swift
//  RaychelQiu
//
//  Created by Jonathan Valentino on 14/11/22.
//

import SwiftUI

struct Chapter2_Home: View {
    @State var scene = 1
    @State var onTap = false
    @Binding var mainOnTap: Bool

    // Scene1
    @State var tired_1_rotation = 0.0
    @State var group_1_scale = 2.8
    @State var group_1_y = 200.0
    @State var group_1_x = 10.0
    @State var raychel_1_scale = 1.0
    @State var raychel_1_y = -70.0
    @State var mom_1_scale = 1.0
    @State var mom_1_y = -10.0
    @State var mom_1_opacity = 0.0

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("Border")
                    .resizable()
                    //                    .scaledToFit()
                    //                    .scaleEffect(0.92)
                    .frame(width: 361, height: 491)
                    .offset(y: -114)
                
                ZStack {
                    Group {
                        Image("Home_BG")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 190)
                            .offset(x: -5,y: -30)
                        
                        Image("Home_Door")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 190)
                            .offset(x: -5,y: -30)

                        Image("Home_Raychel")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35)
                            .offset(y: raychel_1_y)
                            .scaleEffect(raychel_1_scale)

                        Image("Home_Mom")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                            .offset(x: -5, y: mom_1_y)
                            .scaleEffect(mom_1_scale)
                            .opacity(mom_1_opacity)
                    }
                    .scaleEffect(group_1_scale)
                    .offset(x: group_1_x, y: group_1_y)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .onAppear {
                    chapter2_home_scene1_in()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 6.5) {
                        onTap = true
                    }
                }
                .onTapGesture {
                    if onTap == true {
                        onTap = false
                        scene += 1
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

    func chapter2_home_scene1_in() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 1.5)) {
                mom_1_opacity = 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeInOut(duration: 3)) {
                group_1_scale = 1.9
                group_1_y = 67.0
                group_1_x = 10.0
                raychel_1_scale = 1.05
                raychel_1_y = -60
                mom_1_scale = 1.2
                mom_1_y = -10
            }
        }
    }
}

struct Chapter2_Home_Previews: PreviewProvider {
    static var previews: some View {
        Chapter2_Home(mainOnTap: .constant(false))
    }
}
