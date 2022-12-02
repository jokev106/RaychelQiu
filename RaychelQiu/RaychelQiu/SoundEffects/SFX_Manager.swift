//
//  SFX_Manager.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 02/12/22.
//

import Foundation
import SwiftUI
import AVKit

class SFXManager {
    
    static let instance = SFXManager()
    var player: AVAudioPlayer?
    
    enum soundOption:String {
        case alarm
        case birds1
        case chair
        case click1
        case chewing3
        case doorOpen
        case drawing
        case eating1
        case night1
        case paperSlide1
        case paperSlide2
        case rooster
        case pop
        case ticking_5
        case tableSlam1
        case running1
        case woodenChair
    }
    
    func playSFX(sound: soundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else {return}
        
        do {
        player = try AVAudioPlayer(contentsOf: url)
//            try AVAudioSession.sharedInstance().setCategory(.playback)
//            player?.numberOfLoops =  -1
            player?.setVolume(0.5, fadeDuration: 0.0)
            player?.play()
        } catch let error {
            print("Error while playing Raychel Song. \(error.localizedDescription)")
        }
    }

}
