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

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    ZStack {
                        Game4_2(viewmodel: viewmodel, position: $position, success: $success, animate: $animate)
                            .frame(width: 400, height: 800)
                            .onAppear{
                                viewmodel.currentRound = 5
                            }
                        
                        Image("Game4_image4")
                            .resizable()
                            .scaledToFit()
                            .opacity(animate ? 1.0 : 0.0)
                    }
                    .border(.black, width: 2)
                    .scaleEffect(geometry.size.height * 0.001)
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
                position = viewmodel.ronde[viewmodel.currentRound].startPosition
                animate.toggle()
                success.toggle()
            }
        }
    }

    var drag: some Gesture {
        DragGesture(
            //            minimumDistance: 0,
//            coordinateSpace: .global
        )
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
                Group {
                    Image(viewmodel.ronde[viewmodel.currentRound].image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: CGFloat(viewmodel.ronde[viewmodel.currentRound].size))
                        .position(CGPoint(x: 200 + viewmodel.ronde[viewmodel.currentRound].x, y: 400 + viewmodel.ronde[viewmodel.currentRound].y))
                        .opacity(animate ? 0.0 : 1.0)

                    Image(viewmodel.ronde[viewmodel.currentRound].result)
                        .resizable()
                        .scaledToFit()
                        .frame(width: CGFloat(viewmodel.ronde[viewmodel.currentRound].size))
                        .position(CGPoint(x: 200 + viewmodel.ronde[viewmodel.currentRound].x, y: 400 + viewmodel.ronde[viewmodel.currentRound].y))
                        .opacity(animate ? 1.0 : 0.0)
                }

                ForEach(viewmodel.ronde[viewmodel.currentRound].targetPosition.indices, id: \.self) { index in
                    Group {
                        Circle()
                            .fill(viewmodel.ronde[viewmodel.currentRound].success[index] == true ? .green : .red)
                            .frame(width: geometry.size.width * 0.1)
                            .position(viewmodel.ronde[viewmodel.currentRound].targetPosition[index])
                            .opacity(success ? 0.0 : 1.0)
                    }
                }

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
//
//                    Circle()
//                        .fill(.red)
//                        .frame(width: 50, height: 50)
//                        .position(CGPoint(x: 170, y: 280))
//
//                    Circle()
//                        .fill(.red)
//                        .frame(width: 50, height: 50)
//                        .position(CGPoint(x: 210, y: 310))
//
//                    Circle()
//                        .fill(.red)
//                        .frame(width: 50, height: 50)
//                        .position(CGPoint(x: 260, y: 290))
//
//                    Circle()
//                        .fill(.red)
//                        .frame(width: 50, height: 50)
//                        .position(CGPoint(x: 330, y: 310))
//
//                    Circle()
//                        .fill(.red)
//                        .frame(width: 50, height: 50)
//                        .position(CGPoint(x: 300, y: 430))
//
//                    Circle()
//                        .fill(.red)
//                        .frame(width: 50, height: 50)
//                        .position(CGPoint(x: 210, y: 400))
//
//                    Circle()
//                        .fill(.red)
//                        .frame(width: 50, height: 50)
//                        .position(CGPoint(x: 80, y: 440))
//
//                    Circle()
//                        .fill(.red)
//                        .frame(width: 50, height: 50)
//                        .position(CGPoint(x: 90, y: 370))
//                }
            }
        }
    }
}

struct Game4View_Previews: PreviewProvider {
    static var previews: some View {
        Game4_2View()
    }
}
