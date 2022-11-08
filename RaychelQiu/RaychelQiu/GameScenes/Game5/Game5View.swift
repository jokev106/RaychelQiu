//
//  Game5View.swift
//  RaychelQiu
//
//  Created by Jonathan Valentino on 01/11/22.
//

import SwiftUI

struct Game5View: View {
    @State var colorSelected = 1
//    @State var arrayColor = [Color]()
//    @State var arrayColor = [3, 3, 4, 4, 5, 3, 1, 1, 2, 2, 2, 3, 4, 3, 4, 3, 1, 2, 1, 2]
//
    @State var changeColor = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    @State var done = false
    
    var colors = [Color(.gray), Color("Game5_Color1"), Color("Game5_Color2"), Color("Game5_Color3"), Color("Game5_Color4"), Color("Game5_Color5")]
    
    var parts = Game5.pieces
    
    var body: some View {
        GeometryReader { _ in
            ZStack {
                VStack {
                    ZStack {
                        Group {
                            ForEach(0 ..< 20, id: \.self) { index in
                                Image(parts[index].image)
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor( colors[changeColor[index]])
//                            Image("Game5_3")
//                                .resizable()
//                                .scaledToFit()
//                                .overlay(
//                                    Rectangle()
//                                        .foregroundColor(changeColor[0] == 1 ? .red : changeColor[0] == 2 ? .yellow : changeColor[0] == 3 ? .blue : .gray)
//                                        .mask(
//                                            Image("Game5_3")
//                                                .resizable()
//                                                .scaledToFit()
//                                        )
//                                        .onTapGesture {
//                                            changeColor[0] = colorSelected
//                                        }
                            }
                        }
                        
                        Group {
                            ForEach(0 ..< 20, id: \.self) { index in
                                Button(action: {
                                    changeColor[index] = colorSelected
                                }) {
                                    Rectangle()
                                        .opacity(0.0)
                                }
                                .frame(width: parts[index].width, height: parts[index].height)
                                .rotationEffect(.degrees(parts[index].rotation))
                                .position(x: parts[index].x, y: parts[index].y)
                            }
                        }
                        
                        Image("Game5_Outline")
                            .resizable()
                            .scaledToFit()
                            .allowsHitTesting(false)
                            .opacity(done ? 0.0 : 1.0)
                        

                        Image("Game5_Numbers")
                            .resizable()
                            .scaledToFit()
                            .allowsHitTesting(false)
                            .opacity(done ? 0.0 : 1.0)
                    }
                    .onChange(of: changeColor) { _ in
                        var count = 0
                        for index in 0 ..< changeColor.count {
                            if changeColor[index] == parts[index].color {
                                count += 1
                            }
                        }
                        
                        if count == 20 {
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                withAnimation(.easeInOut(duration: 2)) {
                                    done.toggle()
                                }
                            }
                        }
                    }
                    
                    HStack {
                        ForEach(0 ..< 5, id: \.self) { index in
                            Image("Game5_Picker\(index + 1)")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60)
                                .offset(y: colorSelected == index + 1 ? -40 : 0)
                                .onTapGesture {
                                    colorSelected = index + 1
                                }
                        }
                    }
                    .padding()
                }
                .background(.blue)
            }
        }
    }
}

struct Game5View_Previews: PreviewProvider {
    static var previews: some View {
        Game5View()
    }
}
