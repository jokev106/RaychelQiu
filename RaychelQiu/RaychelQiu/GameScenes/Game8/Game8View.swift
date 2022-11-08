//
//  Game8VIew.swift
//  RaychelQiu
//
//  Created by Jonathan Valentino on 01/11/22.
//

import SwiftUI

struct Game8VIew: View {
//    @State var currentAngle = Angle(degrees: 0.0)
//    @State var finalAngle = Angle(degrees: 0.0)
//    @State var anchor = 0
    
    @State var position = CGPoint(x: 190, y: 1200)
    @State var currentPosition = CGPoint(x: 212, y: -490)
    
    @State var needlePosition = CGPoint(x: 0, y: -215)
    
    @State var targetPosition = [CGPoint(x: 310, y: 0), CGPoint(x: 320, y: 100), CGPoint(x: 320, y: 200), CGPoint(x: 310, y: 300), CGPoint(x: 280, y: 400), CGPoint(x: 190, y: 510), CGPoint(x: 190, y: 600), CGPoint(x: 205, y: 700), CGPoint(x: 195, y: 800), CGPoint(x: 140, y: 900), CGPoint(x: 70, y: 1000), CGPoint(x: 10, y: 1100), CGPoint(x: 50, y: 1200), CGPoint(x: 160, y: 1250), CGPoint(x: 270, y: 1290), CGPoint(x: 350, y: 1400), CGPoint(x: 370, y: 1500), CGPoint(x: 150, y: 0), CGPoint(x: 160, y: 100), CGPoint(x: 160, y: 200), CGPoint(x: 150, y: 300), CGPoint(x: 110, y: 380), CGPoint(x: 10, y: 490), CGPoint(x: 30, y: 600), CGPoint(x: 45, y: 700), CGPoint(x: 15, y: 800), CGPoint(x: -50, y: 900), CGPoint(x: -110, y: 1000), CGPoint(x: -170, y: 1100), CGPoint(x: -140, y: 1220), CGPoint(x: -40, y: 1330), CGPoint(x: 60, y: 1380), CGPoint(x: 160, y: 1410), CGPoint(x: 200, y: 1500)]
    
    @State var oldValue: CGPoint? = nil
    
    @State var trigger = false
    
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    func resetGame() {
        position = CGPoint(x: 190, y: 1200)
        currentPosition = CGPoint(x: 212, y: -490)
        trigger = false
        
        targetPosition = [CGPoint(x: 310, y: 0), CGPoint(x: 320, y: 100), CGPoint(x: 320, y: 200), CGPoint(x: 310, y: 300), CGPoint(x: 280, y: 400), CGPoint(x: 190, y: 510), CGPoint(x: 190, y: 600), CGPoint(x: 205, y: 700), CGPoint(x: 195, y: 800), CGPoint(x: 140, y: 900), CGPoint(x: 70, y: 1000), CGPoint(x: 10, y: 1100), CGPoint(x: 50, y: 1200), CGPoint(x: 160, y: 1250), CGPoint(x: 270, y: 1290), CGPoint(x: 350, y: 1400), CGPoint(x: 370, y: 1500), CGPoint(x: 150, y: 0), CGPoint(x: 160, y: 100), CGPoint(x: 160, y: 200), CGPoint(x: 150, y: 300), CGPoint(x: 110, y: 380), CGPoint(x: 10, y: 490), CGPoint(x: 30, y: 600), CGPoint(x: 45, y: 700), CGPoint(x: 15, y: 800), CGPoint(x: -50, y: 900), CGPoint(x: -110, y: 1000), CGPoint(x: -170, y: 1100), CGPoint(x: -140, y: 1220), CGPoint(x: -40, y: 1330), CGPoint(x: 60, y: 1380), CGPoint(x: 160, y: 1410), CGPoint(x: 200, y: 1500)]
    }
    
    func sewing() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.linear(duration: 0.15).repeatForever(autoreverses: true)) {
                needlePosition = CGPoint(x: 0, y: -190)
            }
        }
    }
    
    func collision(position: CGPoint) {
        for index in 0 ..< targetPosition.count {
            let radius = CGPoint(x: targetPosition[index].x + 50, y: targetPosition[index].y + 50)
            let radius2 = CGPoint(x: targetPosition[index].x - 50, y: targetPosition[index].y - 50)
            if position.x < radius.x, position.x > radius2.x, position.y < radius.y, position.y > radius2.y {
//                if index == 0 || success[index - 1] == true {
                trigger = true
//                }
            } else {
//                success[index] = false
            }
        }
    }
    
//    func addObject() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            statePosition[count] = CGPoint(x: 200, y: 1600)
//            showPath[count] = true
//            count += 1
//        }
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
//            statePosition[count] = position
//            showPath[count] = true
//            count += 1
//        }
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
//            statePosition[count] = position
//            showPath[count] = true
//            count += 1
//        }
//    }
    
//    var rotation: some Gesture {
//        RotationGesture()
//            .onChanged { angle in
//                currentAngle = angle + finalAngle
//            }
//
//            .onEnded {
//                angle in
//                currentAngle = angle + finalAngle
//                finalAngle = currentAngle
//            }
//    }
    
    var drag: some Gesture {
        DragGesture()
            .onChanged {
                value in
                
                var selisih = 0.0
                if oldValue == nil {
                    oldValue = value.location
                } else {
                    selisih = value.location.x - oldValue!.x
                    oldValue = value.location
                }
                
                for index in 0 ..< targetPosition.count {
                    if selisih > 0 {
                        targetPosition[index].x += 2
                    } else {
                        targetPosition[index].x -= 2
                    }
                }
            }
            .onEnded {
                _ in
//                for index in 0 ..< targetPosition.count {
//                    targetPosition[index].x = value.location.x
//                    finalPosition.x = value.location.x
//                }
                oldValue = nil
            }
    }
    
    var body: some View {
        GeometryReader { _ in
            ZStack {
                Image("machine")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 800)
                
                ZStack {
                    Group {
                        Image("fabric")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 400, height: 1500)
                            .scaleEffect(3)
                            .position(x: targetPosition[0].x - 90, y: targetPosition[0].y)
                            .offset(y: 800)
                        
                        ForEach(targetPosition.indices, id: \.self) { index in
                            Circle()
                                .fill(trigger == true ? .green : .blue)
                                .frame(width: 100)
                                .position(targetPosition[index])
                                .opacity(0.0)
                        }
                        .onReceive(timer) { time in
                            if currentPosition.y >= 2600 {
                                timer.upstream.connect().cancel()
                            } else {
//                                print("The time is now \(time)")
                            }
                            position.y -= 0.5
                            currentPosition.y += 0.5
                            collision(position: currentPosition)
                        }
                    }
                    
                    Circle()
                        .fill(.red)
                        .frame(width: 30)
                        .position(currentPosition)
                        .opacity(0.0)

//                    ForEach(0 ..< 3, id: \.self) { index in
//                        Circle()
//                            .fill(.green)
//                            .frame(width: 30)
//                            .position(statePosition[index])
//                            .opacity(showPath[index] ? 1.0 : 1.0)
//                    }
//                    .frame(width: 400, height: 800)
//                    .onAppear {
//                        addObject()
//                    }
                }
                .frame(maxWidth: 400, maxHeight: 800, alignment: .center)
                .position(position)
//                .rotationEffect(currentAngle)
                
                Image("sewing")
                    .resizable()
                    .scaledToFit()
                
                Image("jarumm")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 5)
                    .offset(x: 2, y: needlePosition.y)
                    .onAppear {
                        sewing()
                    }
                
                Image("machine2")
                    .resizable()
                    .scaledToFit()

//                Text("\(targetPosition[0].x)")
//                    .foregroundColor(.yellow)
//                    .offset(x: 0, y: 200)
//                    .font(.system(size: 36))
            }
            .gesture(drag)
//            .scaleEffect(0.4)
            .onChange(of: trigger) { _ in
                resetGame()
            }
            .ignoresSafeArea()
//            .offset(y: -400)
//            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
}

struct Game8VIew_Previews: PreviewProvider {
    static var previews: some View {
        Game8VIew()
    }
}
