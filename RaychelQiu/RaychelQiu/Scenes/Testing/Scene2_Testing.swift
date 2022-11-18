//
//  Scene2_Testing.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 21/10/22.
//

import SwiftUI

struct Scene2_Testing: View {
    
    @State var scaleXY = 0.5
    @State var opac = 0.0
    @State var rotation = 0.0
    @State var positioning = 0.0
    @State var bgScale = 1
    @State var bgOpac = 0.0
    @State var bgX = 600
    @State var navigationIsShowing = false
    
    var body: some View {
        GeometryReader{geometry in
            ZStack{
                VStack{
                    Image("Night")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: geometry.size.width, height: geometry.size.height * 1.2, alignment: .bottom)
                        .scaleEffect(CGFloat(bgScale))
                        .animation(Animation.easeInOut(duration: 4))
                        .onAppear() {
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                bgOpac += 1.0
                                bgX -= 600
                                
                            }
                        }
                        .position(x: CGFloat(bgX), y: 400)
                    
                        .opacity(bgOpac)
                        .animation(Animation.easeInOut(duration: 1))
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                            ZStack{
                                Image("Knight")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.7, alignment: .bottomTrailing)
                                    .offset(x:-geometry.size.width * 0.2, y: -geometry.size.height * 0.2)
                                    .opacity(opac)
                                    .scaleEffect(CGFloat(scaleXY))
//                                            .position(x: positioning)
                                    .animation(Animation.easeInOut(duration: 1))
                                    .onAppear() {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                                            scaleXY += 0.5
                                            opac += 1.0
                                            
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                                            rotation += 5
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 7.0) {
                                            positioning += geometry.size.width * 0.4
                                        }
                                    }
                                    .rotationEffect(.degrees(rotation))
                                    .animation(Animation.easeInOut(duration: 2.0).repeatForever(autoreverses: true).speed(2))
                            }
                        }
                    }
                }
            }
        }
    }
}

struct Scene2_Testing_Previews: PreviewProvider {
    static var previews: some View {
        Scene2_Testing()
    }
}
