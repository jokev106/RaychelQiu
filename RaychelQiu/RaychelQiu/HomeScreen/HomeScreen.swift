//
//  HomeScreen.swift
//  RaychelQiu
//
//  Created by Jonathan Kevin on 16/11/22.
//

import SwiftUI

struct HomeScreen: View {
    @Binding var transitions: [CGFloat]

    @State var charPhotosPosition = CGPoint(x: 195, y: 350)
    @State var spiralPhotosPosition = CGPoint(x: 188, y: 410)
    @State var raychelNamePosition = CGPoint(x: 148, y: 530)
    @State var chloe1NamePosition = CGPoint(x: 113, y: 370)
    @State var chloe2NamePosition = CGPoint(x: 111, y: 395)
    @State var momNamePosition = CGPoint(x: 225, y: 100)
    @State var dadNamePosition = CGPoint(x: 275, y: 300)
    @State var familiaPosition = CGPoint(x: 200, y: 70)
    @State var playButtonPosition = CGPoint(x: 198, y: 670)
    @State var playPosition = CGPoint(x: 198, y: 735)

    var body: some View {
        GeometryReader { _ in
            NavigationView {
                ZStack {
                    // Image Home Screen
                    Group {
                        Image("ScreenBG")
                            .resizable()
                            .edgesIgnoringSafeArea(.all)
                        Image("CharPhotos")
                            .resizable()
                            .frame(width: 340, height: 460)
                            .scaledToFit()
                            .position(self.charPhotosPosition)
                            .shadow(color: .black.opacity(0.3), radius: 4)
                        Image("SpiralHomePage")
                            .resizable()
                            .frame(width: 390, height: 930)
                            .scaledToFit()
                            .position(self.spiralPhotosPosition)
                    }

                    // Character Names
                    Group {
                        Text("Hola! \n It's Raychel")
                            .font(Font.custom("Hansip", size: 22))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .position(self.raychelNamePosition)
                        Text("CHLOE <3")
                            .font(Font.custom("Hansip", size: 22))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .position(self.chloe1NamePosition)
                        Text("MY BEST BEST \n FRIEND EVER!")
                            .font(Font.custom("Hansip", size: 12))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .position(self.chloe2NamePosition)
                        Text("Mom \n Number 1 Chef!")
                            .font(Font.custom("Hansip", size: 16))
                            .multilineTextAlignment(.center)
                            .position(self.momNamePosition)
                            .foregroundColor(.black)
                            .rotationEffect(.degrees(-8))
                        Text("Dad \n My Hero!<3")
                            .font(Font.custom("Hansip", size: 17))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .position(self.dadNamePosition)
                        Text("My Familia!")
                            .font(Font.custom("Hansip", size: 24))
                            .multilineTextAlignment(.center)
                            .position(self.familiaPosition)
                            .foregroundColor(.black)
                            .rotationEffect(.degrees(15))
                    }

                    // Play Button
//                    NavigationLink {
//                        withAnimation(.default){
//                            ChapterView()
//                        }
//                    } label: {
//                        Image("PlayButton")
//                            .resizable()
//                    }.frame(width: 95, height: 95)
//                    .scaledToFit()
//                    .position(self.playButtonPosition)
//                    .shadow(color: .black.opacity(0.3), radius: 0.2, x: 0.2)
                    Group {
                        Image("PlayButton")
                            .resizable()
                            .frame(width: 95, height: 95)
                            .scaledToFit()
                            .position(self.playButtonPosition)
                            .shadow(color: .black.opacity(0.3), radius: 0.2, x: 0.2)

                        Text("Play")
                            .font(Font.custom("Hansip", size: 20))
                            .multilineTextAlignment(.center)
                            .position(self.playPosition)
                    }
                    .onTapGesture {
                        transition()
                    }
                }
            }
            .statusBarHidden(true)
//            .onAppear {
//                SoundManager.instance.playSound(sound: .homeSong)
//            }
        }
    }

    func transition() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 2)) {
                transitions[0] = 0.0
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeInOut(duration: 2)) {
                transitions[1] = 1.0
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(transitions: .constant([0.0]))
    }
}
