//
//  Game4Model.swift
//  RaychelQiu
//
//  Created by Jonathan Valentino on 20/10/22.
//

import SwiftUI

struct Round {
    let round: Int
    let image: String
    let size: Int
    let x: Int
    let y: Int
    let startPosition: CGPoint
    let targetPosition: [CGPoint]
    var success: [Bool]
    let result: String
    let chevron: CGFloat
}

extension Round {
    static let rounds = [
        Round(round: 1, image: "Game4_Round1", size: 350, x: 0, y: 0, startPosition: .init(x: 330, y: 70), targetPosition: [.init(x: 265, y: 130), .init(x: 200, y: 195), .init(x: 135, y: 260), .init(x: 60, y: 330)], success: [false, false, false, false], result: "Game4_1", chevron: 140),
        Round(round: 2, image: "Game4_Round2", size: 350, x: 0, y: 0, startPosition: .init(x: 122, y: 320), targetPosition: [.init(x: 60, y: 220), .init(x: 100, y: 120), .init(x: 200, y: 70), .init(x: 300, y: 120), .init(x: 330, y: 220), .init(x: 280, y: 320)], success: [false, false, false, false, false, false], result: "Game4_2", chevron: -140),
        Round(round: 3, image: "Game4_Round3", size: 390, x: 0, y: 0, startPosition: .init(x: 50, y: 200), targetPosition: [.init(x: 100, y: 160), .init(x: 150, y: 160), .init(x: 200, y: 200), .init(x: 250, y: 240), .init(x: 300, y: 240), .init(x: 350, y: 200)], success: [false, false, false, false, false, false], result: "Game4_3", chevron: -50),
        Round(round: 4, image: "Game4_Round4", size: 400, x: 0, y: 0, startPosition: .init(x: 80, y: 80), targetPosition: [.init(x: 200, y: 80), .init(x: 320, y: 80), .init(x: 200, y: 195), .init(x: 80, y: 320), .init(x: 200, y: 320), .init(x: 320, y: 320)], success: [false, false, false, false, false, false], result: "Game4_4", chevron: 0),
        Round(round: 5, image: "Game4_Round5", size: 400, x: 0, y: 0, startPosition: .init(x: 90, y: 340), targetPosition: [.init(x: 150, y: 290), .init(x: 200, y: 240), .init(x: 270, y: 130), .init(x: 200, y: 40), .init(x: 130, y: 130), .init(x: 250, y: 290), .init(x: 310, y: 340)], success: [false, false, false, false, false, false, false], result: "Game4_5", chevron: -40),
        Round(round: 6, image: "Game4_Round6", size: 330, x: 5, y: 0, startPosition: .init(x: 70, y: 330), targetPosition: [.init(x: 180, y: 310), .init(x: 220, y: 350), .init(x: 270, y: 325), .init(x: 345, y: 360), .init(x: 320, y: 480), .init(x: 220, y: 440), .init(x: 90, y: 480), .init(x: 90, y: 410), .init(x: 70, y: 330)], success: [false, false, false, false, false, false, false, false, false], result: "Game4_6", chevron: -15),
        Round(round: 7, image: "Game4_Round7", size: 480, x: 35, y: -30, startPosition: .init(x: 250, y: 180), targetPosition: [.init(x: 290, y: 300), .init(x: 260, y: 420), .init(x: 230, y: 490), .init(x: 160, y: 560), .init(x: 100, y: 550), .init(x: 140, y: 360), .init(x: 250, y: 180)], success: [false, false, false, false, false, false, false], result: "Game4_7", chevron: 60),
        Round(round: 8, image: "Game4_Round8", size: 480, x: 30, y: -30, startPosition: .init(x: 140, y: 180), targetPosition: [.init(x: 260, y: 360), .init(x: 290, y: 550), .init(x: 230, y: 560), .init(x:170, y: 490), .init(x: 135, y: 420), .init(x: 100, y: 300), .init(x: 140, y: 180),], success: [false, false, false, false, false, false, false], result: "Game4_8", chevron: 60),
        Round(round: 9, image: "Game4_Round9", size: 290, x: 0, y: 0, startPosition: .init(x: 110, y: 290), targetPosition: [.init(x: 245, y: 270), .init(x: 320, y: 420), .init(x: 200, y: 540), .init(x: 70, y: 460), .init(x: 110, y: 290)], success: [false, false, false, false, false], result: "Game4_9", chevron: -10),
        Round(round: 10, image: "Game4_Round10", size: 350, x: 0, y: 5, startPosition: .init(x: 120, y: 270), targetPosition: [.init(x: 210, y: 310), .init(x: 290, y: 240), .init(x: 340, y: 450), .init(x: 290, y: 470), .init(x: 250, y: 520), .init(x: 205, y: 560), .init(x: 150, y: 520), .init(x: 110, y: 470), .init(x: 50, y: 450), .init(x: 120, y: 270)], success: [false, false, false, false, false, false, false, false, false, false], result: "Game4_10", chevron: 20),
    ]
}
