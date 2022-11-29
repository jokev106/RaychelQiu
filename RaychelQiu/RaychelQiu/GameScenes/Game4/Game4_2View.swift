//
//  Game4View.swift
//  RaychelQiu
//
//  Created by Jonathan Valentino on 20/10/22.
//

import SwiftUI

struct Game4_2View: View {
    @StateObject var viewmodel = Game4ViewModel()
    @State var position = CGPoint()
    @State var success = false
    @State var animate = false
    @State var finalSketch = false
    @State var nextScene = false
    @Binding var scene_main: Int
    @Binding var scene_frame: Double

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("Game4_image5")
                    .resizable()
                    .frame(width: 330, height: 449.6)
                    .position(x: 198, y: 275)
                
                Image("Game4_image6")
                    .resizable()
                    .frame(width: 330, height: 449.6)
                    .position(x: 198, y: 275)
                
                Image("Game4_image4")
                    .resizable()
                    .scaledToFit()
                    .rotationEffect(.degrees(-10))
                    .scaleEffect(0.4)
                    .offset(x: 5, y: -90)
                    .blur(radius: finalSketch ? 0 : 50)
                
                Image("Game4_image7")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 330)
                    .position(x: 198, y: 360)
                
                Image("Game_Border")
                    .resizable()
                    .frame(width: 330, height: 449.6)
                    .position(x: 198, y: 275)

                if nextScene == false {
                    Game4_2(viewmodel: viewmodel, position: $position, success: $success, animate: $animate, finalSketch: $finalSketch, nextScene: $nextScene)
                        .frame(height: 800)
                        .scaleEffect(geometry.size.height * 0.00085)
                        .offset(y: 180)
                        .onAppear {
                            viewmodel.currentRound = 5
                        }

                } else {
                    Button {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            withAnimation(.easeInOut(duration: 2)) {
                                scene_frame -= 400
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            scene_main += 1
                        }
                    } label: {
                        Image(systemName: "chevron.right.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                            .foregroundColor(.brown)
                    }
                    .offset(x: 0, y: 250)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
}

struct Game4_2: View {
    @ObservedObject var viewmodel: Game4ViewModel
    @Binding var position: CGPoint
    @Binding var success: Bool
    @Binding var animate: Bool
    @Binding var finalSketch: Bool
    @Binding var nextScene: Bool
    @State var touched = false

    func animation() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 2)) {
                animate.toggle()
            }
            success.toggle()
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            if viewmodel.currentRound < 9 {
                viewmodel.currentRound += 1
                success.toggle()
                animate.toggle()
                touched.toggle()
                position = viewmodel.ronde[viewmodel.currentRound].startPosition

            } else {
                nextScene.toggle()
                withAnimation(.easeInOut(duration: 1)) {
                    finalSketch.toggle()
                }
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
                Image("Game4_image8")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(1.25)
                    .offset(y: -60)
                
                // Pattern
                Group {
                    Image(viewmodel.ronde[viewmodel.currentRound].image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: CGFloat(viewmodel.ronde[viewmodel.currentRound].size))
                        .position(CGPoint(x: 200 + viewmodel.ronde[viewmodel.currentRound].x, y: 400 + viewmodel.ronde[viewmodel.currentRound].y))
                        .opacity(animate ? 0.0 : 0.4)

                    Image(viewmodel.ronde[viewmodel.currentRound].result)
                        .resizable()
                        .scaledToFit()
                        .frame(width: CGFloat(viewmodel.ronde[viewmodel.currentRound].size))
                        .position(CGPoint(x: 200 + viewmodel.ronde[viewmodel.currentRound].x, y: 400 + viewmodel.ronde[viewmodel.currentRound].y))
                        .opacity(animate ? 1.0 : 0.0)
                }

                // Target
                ForEach(viewmodel.ronde[viewmodel.currentRound].targetPosition.indices, id: \.self) { index in
                    Group {
                        Circle()
                            .fill(viewmodel.ronde[viewmodel.currentRound].success[index] == true ? .green : .red)
                            .frame(width: geometry.size.width * 0.05)
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
                        Rectangle()
                            .frame(width: viewmodel.ronde[viewmodel.currentRound].success[index] == true ? CGFloat(300 / viewmodel.ronde[viewmodel.currentRound].targetPosition.count) : 0, height: 20)
                            .foregroundColor(.brown)
                    }
                }
                .frame(width: 300, alignment: .leading)
                .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.brown, lineWidth: 4)
                    )
                .offset(y: -260)

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

struct Game4View_Previews: PreviewProvider {
    static var previews: some View {
        Game4_2View(scene_main: .constant(0), scene_frame: .constant(0.0))
    }
}
