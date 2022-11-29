//
//  Chapter4_Result.swift
//  RaychelQiu
//
//  Created by Jonathan Valentino on 25/11/22.
//

import SwiftUI

struct Chapter4_Result: View {
    @State var scene = 1
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
                            Image("Result_Fashion")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150)
                                .offset(y: -50)
                            
                            Image("Result_Blink")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 170)
                                .offset(y: -100)
                            
                            Group {
                                
                            }
                            .offset(y: group_1_y)
                        }
                        .onAppear {
                            chapter4_result_scene1_in()
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

    func chapter4_result_scene1_in() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeOut(duration: 2)) {
                group_1_y = 0.0
            }
        }
    }
}

struct Chapter4_Result_Previews: PreviewProvider {
    static var previews: some View {
        Chapter4_Result(mainOnTap: .constant(false))
    }
}
