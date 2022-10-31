//
//  Chapter1_Collection.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 28/10/22.
//

import SwiftUI

struct Prologue_Collection: View {
    
    @State var scene = 1
    @State var onTap = true
    
    var body: some View {
        GeometryReader{ geometry in
            if scene == 1 {
                    Prologue_Scene1_Kelas_Selesai()
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
                            onTap = true
                        }
                    }
                    .onTapGesture {
                        withAnimation{
                            if onTap == true {
                                scene += 1
                                onTap = false
                            }
                        }
                    }
                }
        }
    }
}

struct Prologue_Collection_Previews: PreviewProvider {
    static var previews: some View {
        Prologue_Collection()
    }
}
