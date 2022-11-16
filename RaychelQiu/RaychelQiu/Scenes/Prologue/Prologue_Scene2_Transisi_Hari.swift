//
//  Prologue_Scene2_Transisi_Hari.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 31/10/22.
//

import SwiftUI

@available(iOS 15.0, *)
struct Prologue_Scene2_Transisi_Hari: View {
    
    
    @available(iOS 15.0, *)
    var body: some View {
        GeometryReader{geometry in
            if #available(iOS 15.0, *) {
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
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

struct Prologue_Scene2_Transisi_Hari_Previews: PreviewProvider {
    static var previews: some View {
        Prologue_Scene2_Transisi_Hari()
    }
}
