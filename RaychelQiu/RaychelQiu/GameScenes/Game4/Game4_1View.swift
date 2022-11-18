//
//  Game4View.swift
//  RaychelQiu
//
//  Created by Jonathan Valentino on 20/10/22.
//

import SwiftUI

//struct TestView: View {
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack {
//                Game4_1View()
//                    .frame(width: 400, height: 800)
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
//            .scaleEffect(geometry.size.height * 0.0013)
//        }
//    }
//}

struct Game4_1View: View {
    @StateObject var viewmodel = Game4ViewModel()
    @State var position = CGPoint()
    @State var success = false
    @State var animate = [false, false, false, false, false]
    @State var nextScene = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("Game_Border")
                    .resizable()
                    .frame(width: 330, height: 449.6)
                    .position(x: 198, y: 275)

                Group {
                    Image("Game4_image")
                        .resizable()
                        .scaledToFit()

                    ForEach(0 ..< 5, id: \.self) { round in
                        Image(viewmodel.ronde[round].result)
                            .resizable()
                            .scaledToFit()
                            .opacity(animate[round] ? 1.0 : 0.0)
                    }

                    Image("Game4_image2")
                        .resizable()
                        .scaledToFit()

                    Image("Game4_image3")
                        .resizable()
                        .scaledToFit()
                }
                .offset(y: 14)
                .scaleEffect(1.27)

                if nextScene == false {
                    Game4_1(viewmodel: viewmodel, position: $position, success: $success, animate: $animate, nextScene: $nextScene)
                        .frame(height: 400)
                        .background(.white)
                        .border(.black, width: 2)
                        .scaleEffect(geometry.size.height * 0.001)
                        .offset(y: 200)
                } else {
                    Button {} label: {
                        Image(systemName: "chevron.right.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                            .foregroundColor(.black)
                    }
                    .offset(x: 0, y: 250)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
}

struct Game4_1: View {
    @ObservedObject var viewmodel: Game4ViewModel
    @Binding var position: CGPoint
    @Binding var success: Bool
    @Binding var animate: [Bool]
    @Binding var nextScene: Bool

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
                position = value.location
                viewmodel.collision(position: position)
            }
            .onEnded {
                _ in
                if viewmodel.ronde[viewmodel.currentRound].success[viewmodel.ronde[viewmodel.currentRound].success.count - 1] == true {
                    animation()

                } else {
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
        Game4_1View()
    }
}
