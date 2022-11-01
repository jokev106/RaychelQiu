//
//  Game4ViewModel.swift
//  RaychelQiu
//
//  Created by Jonathan Valentino on 20/10/22.
//

import SwiftUI

class Game4ViewModel: ObservableObject {
    @Published var currentRound: Int = 0
    var ronde = Round.rounds
    
    func collision(position: CGPoint) {
        for index in 0 ..< ronde[currentRound].success.count {
            let radius = CGPoint(x: ronde[currentRound].targetPosition[index].x + 30, y: ronde[currentRound].targetPosition[index].y + 30)
            let radius2 = CGPoint(x: ronde[currentRound].targetPosition[index].x - 30, y: ronde[currentRound].targetPosition[index].y - 30)
            if position.x < radius.x, position.x > radius2.x, position.y < radius.y, position.y > radius2.y {
                if index == 0 || ronde[currentRound].success[index - 1] == true {
                    ronde[currentRound].success[index] = true
                }
            } else {
//                success[index] = false
            }
        }
    }
    
    func setupGame() {
        
    }
    
    func nextRound() {
//        if success[success.count - 1] == true {
//            round += 1
//        } else {
//            withAnimation(.spring()) {
//                offset.x = start.x
//                offset.y = start.y
//            }
//
//            for index in 0 ..< success.count {
//                success[index] = false
//            }
//        }
    }
    
    func prepareObjects() {
        
    }
}
