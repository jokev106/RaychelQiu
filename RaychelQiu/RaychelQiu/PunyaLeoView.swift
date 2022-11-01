//
//  Scene_Testing.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 20/10/22.
//

import Foundation
import SwiftUI

struct Scene_Testing: View {
    @State var scaleXY = 0.5
    @State var opac = 0.0
    @State var rotation = 0.0
    @State var positioning = 0.0
    @State var bgScale = 1
    @State var bgOpac = 0.0
    @State var bgX = 600
    @State var navigationIsShowing = false

    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                NavigationLink(destination: Game4_2View()) {
                    ZStack {
                        Image("Testing")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: geometry.size.width, height: geometry.size.height * 1.2, alignment: .bottom)
                            .scaleEffect(CGFloat(bgScale))
                            .position(x: CGFloat(bgX), y: 400)

                            .opacity(bgOpac)
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                ZStack {
                                    Image("Knight")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.7, alignment: .bottomTrailing)
                                        .offset(x: -geometry.size.width * 0.2, y: -geometry.size.height * 0.2)
                                        .opacity(opac)
                                        .scaleEffect(CGFloat(scaleXY))
                                        .rotationEffect(.degrees(rotation))
                                }
                            }
                        }
                    }
                    .onAppear {
                        setAnimation()
                    }
                }
            }
            .onTapGesture {}
        }
    }

    func setAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 4)) {
                bgX -= 600
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 1)) {
                bgOpac += 1.0
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            withAnimation(.easeInOut(duration: 1)) {
                scaleXY += 0.5
                opac += 1.0
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            withAnimation( .easeInOut(duration: 2.0).repeatForever(autoreverses: true).speed(2)) {
                rotation += 5
            }
        }
    }
}

struct Scene_Testing_Previews: PreviewProvider {
    static var previews: some View {
        Scene_Testing()
            .previewInterfaceOrientation(.portrait)
    }
}
