//
//  Game1_CaptchaPuzzle.swift
//  RaychelQiu
//
//  Created by Jonathan Kevin on 01/11/22.
//

import SwiftUI

struct Game1_CaptchaPuzzle: View {
    @State var isWinter1: Bool = false
    @State var isWinter2: Bool = false
    @State var isWinter3: Bool = false

    @State var positionPhone = CGPoint(x: 68, y: 480)
    @State var positionWinterJacket1 = CGPoint(x: 129, y: 206.3)
    @State var positionWinterJacket2 = CGPoint(x: 269, y: 283.6)
    @State var positionWinterJacket3 = CGPoint(x: 197.6, y: 364)
    @State var positionChevronButton = CGPoint(x: 325.6, y: 735.3)

    @State var moveableBook: Bool = false
    @State var book: Bool = false

    @Binding var mainOnTap: Bool
    @Binding var scene_main: Int
    @Binding var scene_frame: Double
    @Binding var scene_frame2: Double

    var body: some View {
        GeometryReader { _ in
            ZStack {
                Image("CaptchaPhone2")
                    .resizable()
                    .frame(width: 630, height: 800)
                    .position(self.positionPhone)
                    .shadow(color: .black.opacity(0.3), radius: 2, x: 2, y: 2)
                ZStack {
                    Group {
                        Image("WinterJacket1")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .scaledToFit()
                            .border(isWinter1 ? .green : .white, width: 2)
                            .cornerRadius(4)
                            .onTapGesture {
                                isWinter1.toggle()
                            }
                            .position(self.positionWinterJacket1)
                        Image("WinterJacket2")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .border(isWinter2 ? .green : .white, width: 2)
                            .cornerRadius(4)

                            .onTapGesture {
                                isWinter2.toggle()
                            }
                            .position(self.positionWinterJacket2)
                        Image("WinterJacket3")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .border(isWinter3 ? .green : .white, width: 2)
                            .cornerRadius(4)
                            .onTapGesture {
                                isWinter3.toggle()
                            }
                            .position(self.positionWinterJacket3)
                    }
                }

                if isWinter1 == true && isWinter2 == true && isWinter3 == true {
                    ZStack {
//                        Group {
//                            Image(systemName: "chevron.right.circle")
//                                .resizable()
//                                .foregroundColor(Color("PurplePastel"))
//                                .frame(width: 70, height: 70)
//                                .onTapGesture {
//                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                                        withAnimation(.easeInOut(duration: 2)) {
//                                            scene_frame -= 400
//                                        }
//                                    }
//
//                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                                        scene_main += 1
//                                    }
//                                }
//                                .position(self.positionChevronButton)
//                            //                                .gesture(dragBook)
//                        }.transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.8)))
                        Button {
                            if mainOnTap == true {
                                mainOnTap = false

                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation(.easeInOut(duration: 3.5)) {
                                        scene_frame2 += 800
                                    }
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                    scene_main += 1
                                    withAnimation(.easeInOut(duration: 2)) {
                                        scene_frame -= 400
                                    }
                                }
                            }

                        } label: {
                            Image(systemName: "chevron.right.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 50)
                                .foregroundColor(.brown)
                        }
                        .offset(x: 0, y: 340)
                        .onAppear{
                            mainOnTap = true
                        }
                    }
                }
            }
        }
    }
}

struct Game1_CaptchaPuzzle_Previews: PreviewProvider {
    static var previews: some View {
        Game1_CaptchaPuzzle(mainOnTap: .constant(false), scene_main: .constant(0), scene_frame: .constant(0.0), scene_frame2: .constant(0.0))
    }
}
