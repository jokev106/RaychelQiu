//
//  MainView.swift
//  RaychelQiu
//
//  Created by Jonathan Valentino on 30/11/22.
//

import SwiftUI

struct MainView: View {
    @State var transitions: CGFloat = 1.0
    @State var scene_blur: CGFloat = 0.0
    @State var chapter = -2
    @State var dialog_scale: CGFloat = 0.0
    @State var dialog_opacity: CGFloat = 0.0

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("ScreenBG")
                    .resizable()
                //                    .scaledToFit()
                    .frame(width: geometry.size.width)
                    .edgesIgnoringSafeArea(.all)
                    .blur(radius: scene_blur)
                
                ZStack {
                    if chapter == -2 {
                        HomeScreen(transitions: $transitions, chapterPicked: $chapter)
                            .frame(width: 380, height: 760)
                        //                            .opacity(transitions[0])
                    }
                    
                    if chapter == -1 {
                        ChapterView(transitions: $transitions, chapterPicked: $chapter)
                            .frame(width: 380, height: 760)
                        //                            .opacity(transitions[1])
                    }
                    
                    if chapter == 0 {
                        Prologue_Collection(scene_blur: $scene_blur, transitions: $transitions, chapter: $chapter, dialog_scale: $dialog_scale, dialog_opacity: $dialog_opacity)
                            .frame(width: 380, height: 760)
                    }
                    
                    if chapter == 1 {
                        Chapter1_Collection(scene_blur: $scene_blur, transitions: $transitions, chapter: $chapter, dialog_scale: $dialog_scale, dialog_opacity: $dialog_opacity)
                            .frame(width: 380, height: 760)
                    }
                    
                    if chapter == 2 {
                        Chapter2_Collection(scene_blur: $scene_blur, transitions: $transitions, chapter: $chapter, dialog_scale: $dialog_scale, dialog_opacity: $dialog_opacity)
                            .frame(width: 380, height: 760)
                    }
                    
                    if chapter == 3 {
                        Chapter3_Collection(scene_blur: $scene_blur, transitions: $transitions, chapter: $chapter, dialog_scale: $dialog_scale, dialog_opacity: $dialog_opacity)
                            .frame(width: 380, height: 760)
                    }
                    
                    
                }
                .frame(height: 640)
                .scaleEffect(geometry.size.height * 0.00125)
                .blur(radius: scene_blur)
                
                
            }
            .opacity(transitions)
            .background(.white)
            //            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            
            ZStack{
                Image("Alert_Dialog")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350)
                    .offset(y: -20)
                
                Image("Alert_Yes")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .offset(x: -80, y: 150)
                    .onTapGesture {
                        backTransition()
                    }
                
                Image("Alert_No")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .offset(x: 80, y: 150)
                    .onTapGesture{
                        closeAlert()
                    }
            }
            .frame(width: geometry.size.width, height: 640)
            .scaleEffect(dialog_scale)
            .opacity(dialog_opacity)
        }
    }
    
    func closeAlert() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 1)) {
                dialog_scale = 0.0
                dialog_opacity = 0.0
                scene_blur = 0.0
            }
        }
    }
    
    func backTransition() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 2)) {
                dialog_scale = 0.0
                dialog_opacity = 0.0
                transitions = 0.0
                scene_blur = 0.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            chapter = -1
            withAnimation(.easeInOut(duration: 1.5)) {
                transitions = 1.0
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
