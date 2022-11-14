//
//  Game4Model.swift
//  RaychelQiu
//
//  Created by Jonathan Valentino on 20/10/22.
//

import SwiftUI

struct Game5 {
    let piece: Int
    let image: String
    let color: Int
    let width: CGFloat
    let height: CGFloat
    let rotation: Double
    let x: CGFloat
    let y: CGFloat
}
    
extension Game5 {
    static let pieces = [
        Game5(piece: 1, image: "Game5_1", color: 1, width: 20, height: 65, rotation: 20, x: 250, y: 142),
        Game5(piece: 2, image: "Game5_2", color: 1, width: 20, height: 60, rotation: 0, x: 122, y: 135),
        Game5(piece: 3, image: "Game5_3", color: 2, width: 34, height: 80, rotation: 0, x: 215, y: 212),
        Game5(piece: 4, image: "Game5_4", color: 2, width: 18, height: 80, rotation: 0, x: 128, y: 215),
        Game5(piece: 5, image: "Game5_5", color: 5, width: 28, height: 70, rotation: 0, x: 165, y: 187),
        Game5(piece: 6, image: "Game5_6", color: 1, width: 35, height: 25, rotation: 0, x: 168, y: 235),
        Game5(piece: 7, image: "Game5_7", color: 4, width: 39, height: 230, rotation: -15, x: 297, y: 270),
        Game5(piece: 9, image: "Game5_8", color: 4, width: 30, height: 180, rotation: -17, x: 260, y: 290),
        Game5(piece: 10, image: "Game5_9", color: 3, width: 35, height: 35, rotation: -17, x: 358, y: 398),
        Game5(piece: 11, image: "Game5_10", color: 3, width: 25, height: 35, rotation: -17, x: 320, y: 402),
        Game5(piece: 12, image: "Game5_11", color: 3, width: 20, height: 40, rotation: -17, x: 297, y: 405),
        Game5(piece: 13, image: "Game5_12", color: 1, width: 40, height: 200, rotation: -20, x: 250, y: 380),
        Game5(piece: 14, image: "Game5_13", color: 3, width: 15, height: 110, rotation: -20, x: 235, y: 440),
        Game5(piece: 15, image: "Game5_14", color: 1, width: 80, height: 250, rotation: 0, x: 170, y: 390),
        Game5(piece: 16, image: "Game5_15", color: 3, width: 15, height: 110, rotation: 10, x: 115, y: 440),
        Game5(piece: 17, image: "Game5_16", color: 1, width: 40, height: 200, rotation: 15, x: 100, y: 385),
        Game5(piece: 18, image: "Game5_17", color: 4, width: 30, height: 200, rotation: 15, x: 85, y: 290),
        Game5(piece: 19, image: "Game5_18", color: 3, width: 35, height: 35, rotation: 17, x: 50, y: 410),
        Game5(piece: 20, image: "Game5_19", color: 4, width: 15, height: 100, rotation: 19, x: 43, y: 320),
        Game5(piece: 20, image: "Game5_20", color: 3, width: 25, height: 35, rotation: 17, x: 20, y: 390),
    ]
}
