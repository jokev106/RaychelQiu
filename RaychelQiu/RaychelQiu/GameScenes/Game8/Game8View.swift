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
    @State var currentPosition = CGPoint(x: 200, y: -500)
    
    @State var needlePosition = CGPoint(x: 0, y: -170)
    
    @State var gesturePosition = CGPoint(x: 200, y: 0)
//    @State var finalPosition = CGPoint(x: 200, y: 1600)
    
    @State var targetPosition = [CGPoint(x: 210, y: 0), CGPoint(x: 220, y: 100), CGPoint(x: 220, y: 200), CGPoint(x: 210, y: 300), CGPoint(x: 180, y: 400), CGPoint(x: 90, y: 500), CGPoint(x: 100, y: 600), CGPoint(x: 110, y: 700), CGPoint(x: 90, y: 800), CGPoint(x: 40, y: 900), CGPoint(x: -30, y: 1000), CGPoint(x: -90, y: 1100), CGPoint(x: -50, y: 1200),  CGPoint(x: 40, y: 1280), CGPoint(x: 150, y: 1320), CGPoint(x: 230, y: 1400), CGPoint(x: 280, y: 1500)]
    
    @State var oldValue: CGPoint? = nil
    
    @State var abc = false
    
    @State var trigger = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    
    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    
    func movements() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.linear(duration: 30)) {
                position = CGPoint(x: 200, y: -1800)

//                currentPosition = CGPoint(x: 200, y: 2100)
//                for index in 0 ..< 3 { statePosition[index] = CGPoint(x: 200, y: -500)
//                }
            }
        }
    }
    
    func sewing() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.linear(duration: 0.1).repeatForever(autoreverses: true)) {
                needlePosition = CGPoint(x: 0, y: -150)
            }
        }
    }
    
    func collision(position: CGPoint) {
        for index in 0 ..< targetPosition.count {
            let radius = CGPoint(x: targetPosition[index].x + 50, y: targetPosition[index].y + 50)
            let radius2 = CGPoint(x: targetPosition[index].x - 50, y: targetPosition[index].y - 50)
            if position.x < radius.x, position.x > radius2.x, position.y < radius.y, position.y > radius2.y {
//                if index == 0 || success[index - 1] == true {
                trigger[index] = true
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
                        targetPosition[index].x += 3
                    } else {
                        targetPosition[index].x -= 3
                    }
                }
            }
            .onEnded {
                value in
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
                Image("machinee")
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
                            .position(targetPosition[0])
                            .offset(y: 800)
                        
                        ForEach(targetPosition.indices, id: \.self) { index in
                            Circle()
                                .fill(trigger[index] == true ? .green : .blue)
                                .frame(width: 100)
                                .position(targetPosition[index])
                        }
                    }
                    
                    Circle()
                        .fill(.red)
                        .frame(width: 30)
                        .position(currentPosition)
                        .onReceive(timer) { time in
                            if currentPosition.y >= 2600 {
                                timer.upstream.connect().cancel()
                            } else {
                                print("The time is now \(time)")
                            }
                            currentPosition.y += 20
                            collision(position: currentPosition)
                        }
//                        .opacity(0.0)

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
                .gesture(drag)
                .onAppear {
                    movements()
//                    while currentPosition.y < 2100 {
//                        currentPosition.y += 10
//                    }
                }

                Image("sewing")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    .offset(x: 5, y: -205)
                
                Image("jarumm")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 5)
                    .offset(x: -5, y: needlePosition.y)
                    .onAppear {
                        sewing()
                    }
                
//                Text("\(targetPosition[0].x)")
//                    .foregroundColor(.yellow)
//                    .offset(x: 0, y: 200)
//                    .font(.system(size: 36))
                
//                Rectangle()
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .opacity(0.1)
            }
            .scaleEffect(0.5)
//            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
}

struct Game8VIew_Previews: PreviewProvider {
    static var previews: some View {
        Game8VIew()
    }
}
