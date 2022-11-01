//
//  Prologue_Scene2_Transisi_Hari.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 31/10/22.
//

import SwiftUI

struct Prologue_Scene2_Transisi_Hari: View {
    
    
    var body: some View {
        GeometryReader{geometry in
            ZStack{
                Image("Day")
                    .resizable()
//                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .scaledToFit()
                
                
            }
            .mask {
                Image("Day")
                    .resizable()
                    .scaledToFit()
            }
            .scaleEffect(CGFloat(1))
        }
    }
}

struct Prologue_Scene2_Transisi_Hari_Previews: PreviewProvider {
    static var previews: some View {
        Prologue_Scene2_Transisi_Hari()
    }
}
