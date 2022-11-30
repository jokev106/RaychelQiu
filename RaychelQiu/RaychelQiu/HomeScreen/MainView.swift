//
//  MainView.swift
//  RaychelQiu
//
//  Created by Jonathan Valentino on 30/11/22.
//

import SwiftUI

struct MainView: View {
    @State var transitions: [CGFloat] = [1.0, 0.0, 0.0]
    @State var chapter = 0

    var body: some View {
        GeometryReader { _ in
            ZStack {
                HomeScreen(transitions: $transitions)
//                    .frame(width: 380, height: 760)
                    .opacity(transitions[0])
                ChapterView(transitions: $transitions, chapterPicked: $chapter)
//                    .frame(width: 380, height: 760)
                    .opacity(transitions[1])

                if chapter == 1 {
                    Prologue_Collection()
                        .navigationBarBackButtonHidden(true)
//                        .frame(width: 380, height: 760)
                }

                if chapter == 2 {
                    Chapter1_Collection()
                        .navigationBarBackButtonHidden(true)
                }

                if chapter == 3 {
                    Chapter2_Collection()
                        .navigationBarBackButtonHidden(true)
                }
            }
            .background(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
//            .scaleEffect(geometry.size.height * 0.00135)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
