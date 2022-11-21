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
    
    enum soundOption:String {
        case homeSong
        case happySong
        case endingSong
    }
    
    func playSound(sound: soundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else {return}
        
        do {
        player = try AVAudioPlayer(contentsOf: url)
            try AVAudioSession.sharedInstance().setCategory(.playback)
            player?.numberOfLoops =  -1
            player?.play()
        } catch let error {
            print("Error while playing Raychel Song. \(error.localizedDescription)")
        }
    }

}
