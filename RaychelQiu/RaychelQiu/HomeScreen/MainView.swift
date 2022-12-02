//
//  MainView.swift
//  RaychelQiu
//
//  Created by Jonathan Valentino on 30/11/22.
//

import SwiftUI

struct MainView: View {
    @State var transitions: [CGFloat] = [1.0, 0.0]
    @State var chapter = -2

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if chapter == -2 {
                    HomeScreen(transitions: $transitions, chapterPicked: $chapter)
                        .frame(width: 380, height: 760)
//                        .opacity(transitions[0])
                }
                
                if chapter == 0 {
                    ChapterView(transitions: $transitions, chapterPicked: $chapter)
                        .frame(width: 380, height: 760)
//                        .opacity(transitions[1])
                }

                if chapter == 1 {
                    Prologue_Collection(chapter: $chapter)
                        .frame(width: 380, height: 760)
                }

                if chapter == 2 {
                    Chapter1_Collection(chapter: $chapter)
                        .frame(width: 380, height: 760)
                }

                if chapter == 3 {
                    Chapter2_Collection(chapter: $chapter)
                        .frame(width: 380, height: 760)
                }
                
                if chapter == 4 {
                    Chapter3_Collection()
                        .frame(width: 380, height: 760)
                }
            }
            .background(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .scaleEffect(geometry.size.height * 0.00135)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
