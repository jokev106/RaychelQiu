//
//  Game4View.swift
//  RaychelQiu
//
//  Created by Jonathan Valentino on 20/10/22.
//

import SwiftUI

struct Game4_1View: View {
    @StateObject var viewmodel = Game4ViewModel()
    @State var position = CGPoint()
    @State var success = false
    @State var animate = [false, false, false, false, false]
    @State var nextScene = false
    @Binding var mainOnTap: Bool
    @Binding var scene1_paralax_x: Double

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("Border")
                    .resizable()
                    .frame(width: 330, height: 449.6)
                    .position(x: 197.5, y: 275)

                Group {
                    Image("Game4_image")
                        .resizable()
                        .scaledToFit()
                        .offset(x: scene1_paralax_x)

                    ForEach(0 ..< 5, id: \.self) { round in
                        Image(viewmodel.ronde[round].result)
                            .resizable()
                            .scaledToFit()
                            .opacity(animate[round] ? 1.0 : 0.0)
                            .offset(x: scene1_paralax_x)
                    }

                    Image("Game4_image2")
                        .resizable()
                        .scaledToFit()
                        .offset(x: scene1_paralax_x)

                    Image("Game4_image3")
                        .resizable()
                        .scaledToFit()
                        .offset(x: scene1_paralax_x)
                }
                .mask{
                    Image("Game4_image")
                        .resizable()
                        .scaledToFit()
                }
                .offset(y: 14)
                .scaleEffect(1.276)

                if nextScene == false {
                    Game4_1(viewmodel: viewmodel, position: $position, success: $success, animate: $animate, nextScene: $nextScene)
                        .frame(height: 450)
                        .scaleEffect(geometry.size.height * 0.0009)
                        .offset(y: 230)
                } else {
                    Image(systemName: "chevron.right.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                        .foregroundColor(.black)
                        .offset(x: 0, y: 250)
                        .opacity(0.0)
                        .onAppear{
                            mainOnTap = true
                        }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .scaleEffect(1.1)
        }
    }
}

struct Game4_1: View {
    @ObservedObject var viewmodel: Game4ViewModel
    @Binding var position: CGPoint
    @Binding var success: Bool
    @Binding var animate: [Bool]
    @Binding var nextScene: Bool
    @State var touched = false

    func animation() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 2)) {
                animate[viewmodel.currentRound].toggle()
            }
            success.toggle()
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            if viewmodel.currentRound < 4 {
                viewmodel.currentRound += 1
                success.toggle()
                position = viewmodel.ronde[viewmodel.currentRound].startPosition
            } else {
                nextScene.toggle()
            }
            
        }
    }

    var drag: some Gesture {
        DragGesture()
            .onChanged {
                value in
                touched = true
                position = value.location
                viewmodel.collision(position: position)
            }
            .onEnded {
                _ in
                if viewmodel.ronde[viewmodel.currentRound].success[viewmodel.ronde[viewmodel.currentRound].success.count - 1] == true {
                    animation()

                } else {
                    touched = false
                    withAnimation(.spring()) {
                        position.x = viewmodel.ronde[viewmodel.currentRound].startPosition.x
                        position.y = viewmodel.ronde[viewmodel.currentRound].startPosition.y
                    }

                    for index in 0 ..< viewmodel.ronde[viewmodel.currentRound].success.count {
                        viewmodel.ronde[viewmodel.currentRound].success[index] = false
                    }
                }
            }
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("Game_Border")
                    .resizable()
                    .scaleEffect(1.02)
                    .offset(y: -50)
                
                Rectangle()
                    .foregroundColor(.white)
                    .offset(y: -50)
                
                // Pattern
                Image(viewmodel.ronde[viewmodel.currentRound].image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: CGFloat(viewmodel.ronde[viewmodel.currentRound].size))
                    .position(CGPoint(x: 200 + viewmodel.ronde[viewmodel.currentRound].x, y: 200 + viewmodel.ronde[viewmodel.currentRound].y))
                    .opacity(animate[viewmodel.currentRound] ? 0.0 : 1.0)

                // Target
                ForEach(viewmodel.ronde[viewmodel.currentRound].targetPosition.indices, id: \.self) { index in
                    Group {
                        Circle()
                            .fill(viewmodel.ronde[viewmodel.currentRound].success[index] == true ? .green : .red)
                            .frame(width: geometry.size.width * 0.1)
                            .position(viewmodel.ronde[viewmodel.currentRound].targetPosition[index])
                            .opacity(0.0)
                    }
                }

                // Gesture
                Circle()
                    .fill(.yellow)
                    .frame(width: geometry.size.width * 0.1)
                    .position(position)
                    .gesture(drag)
                    .opacity(success ? 0.0 : 1.0)
                    .onAppear {
                        position = viewmodel.ronde[viewmodel.currentRound].startPosition
                    }
                
                Image(systemName: "chevron.right")
                    .font(Font.system(size: 25, weight: .bold))
                    .rotationEffect(.degrees(viewmodel.ronde[viewmodel.currentRound].chevron))
                    .position(position)
                    .opacity(touched ? 0.0 : 1.0)
                
                // Progress Bar
                HStack(spacing: 0) {
                    ForEach(viewmodel.ronde[viewmodel.currentRound].targetPosition.indices, id: \.self) { index in
                        ZStack {
                            Rectangle()
                                .frame(width: viewmodel.ronde[viewmodel.currentRound].success[index] == true ? CGFloat(300 / viewmodel.ronde[viewmodel.currentRound].targetPosition.count) : 0, height: 20)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .frame(width: 300, alignment: .leading)
                .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.gray, lineWidth: 4)
                    )
                .offset(y: -230)
                
//                ForEach(viewmodel.ronde[viewmodel.currentRound].targetPosition.indices, id: \.self) { index in
//                    Circle()
//                        .fill(.yellow)
//                        .frame(width: geometry.size.width * 0.1)
//                        .offset(x: CGFloat(270 * (3 / 4)))
//                }
//                .frame(width: 300, alignment: .leading)
//                .offset(y: -180)
                
                

//                Group {
//                    Circle()
//                        .fill(.red)
//                        .frame(width: 50, height: 50)
//                        .position(CGPoint(x: 60, y: 290))
//                }
            }
        }
    }
}

struct Game4_1View_Previews: PreviewProvider {
    static var previews: some View {
        Game4_1View(mainOnTap: .constant(false), scene1_paralax_x: .constant(0.0))
    }
}
