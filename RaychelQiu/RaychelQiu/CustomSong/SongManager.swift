//
//  SongManager.swift
//  RaychelQiu
//
//  Created by Jonathan Kevin on 21/11/22.
//

import Foundation
import SwiftUI
import AVKit

class SoundManager {
    
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "RaychelSong", withExtension: ".mpeg") else {return}
        
        do {
        player = try AVAudioPlayer(contentsOf: url)
            player?.numberOfLoops =  -1
            player?.play()
        } catch let error {
            print("Error while playing Raychel Song. \(error.localizedDescription)")
        }
    }

}
