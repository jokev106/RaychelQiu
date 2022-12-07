//
//  ChapterView.swift
//  RaychelQiu
//
//  Created by Jonathan Kevin on 17/11/22.
//

import SwiftUI

struct ChapterView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var transitions: [CGFloat]
    @Binding var chapterPicked: Int
    
    // Current chapter tittle
    @State var chapterState: Int = 0
    
    @State var titleChapter = CGPoint(x: 201, y: 490)
    @State var chapter = CGPoint(x: 198, y: 80)
    @State var nextButton = CGPoint(x: 326, y: 495)
    @State var prevButton = CGPoint(x: 76, y: 495)
    @State var imageBorder = CGPoint(x: 228, y: 310)
    @State var playButtonPosition = CGPoint(x: 198, y: 640)
    @State var playPosition = CGPoint(x: 198, y: 705)
    
    @State var chapterPosition = [CGPoint(x: 200, y: 280), CGPoint(x: 450, y: 280), CGPoint(x: 700, y: 280), CGPoint(x: 950, y: 280), CGPoint(x: 1200, y: 280), CGPoint(x: 1450, y: 280)]
    
    var chapterImage = ["prologue", "chapter1", "chapter2", "chapter3", "chapter4", "epilogue"]

    @State var offset = 0
    
    // EndPage
    @State var scene_opacity = 0.0
    
    @State var listChapter = [SaveChapter]()
    
    func loadChapter() {
        listChapter = CoreDataManager.instance.loadChapter()
        if listChapter.count == 0 {
            CoreDataManager.instance.initChapter()
        }
        listChapter = CoreDataManager.instance.loadChapter()
    }
    
    var body: some View {
        GeometryReader { _ in
            ZStack {
                Image("ScreenBG")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                // Image Chapter
                Group {
                    ForEach(chapterPosition.indices, id: \.self) { index in
                        ZStack {
                            Image("ChapterBorder")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 400, height: 530)
                                .shadow(color: .black.opacity(0.3), radius: 0.2, x: 0.2)
                                .offset(x: 37, y: 30)
//                                .position(self.imageB3order)
                            
                            Image(chapterImage[index])
                                .resizable()
                                .frame(width: 210, height: 275)
                                .rotationEffect(.degrees(-8))
                                .offset(y: 5)
//                                .position(chapterImage)
                        }
                        .frame(width: 400, alignment: .center)
                        .scaleEffect(chapterState == index ? 1.0 : 0.8)
                        .position(chapterPosition[index])
                        .opacity(chapterState == index ? 1.0 : 0.5)
//                        .onTapGesture {
//                            if chapterState == index{
//                                transition(chapter: index)
//                            }
//                        }
                    }
                }
                .offset(x: CGFloat(offset))
//                }
                
                // chapter
                Group {
                    Text(chapterState == 0 ? "Prologue" :
                        chapterState == 1 ? "Chapter 1" :
                        chapterState == 2 ? "Chapter 2" :
                        chapterState == 3 ? "Chapter 3" :
                        chapterState == 4 ? "Chapter 4" : "Epilogue")
                        .font(Font.custom("Hansip", size: 32))
                        .foregroundColor(.black)
                        .offset(y: -300)
                        .shadow(color: .black.opacity(0.3), radius: 0.2, x: 0.2)
                }
                
                // Chapter Title and button next, prev
                Group {
                    Button {
                        withAnimation(.easeInOut(duration: 1.5)) {
//                            if chapterState == 0 {
//                                chapterState = 0
//                            } else {
//                                chapterState -= 1
//                            }
                            if chapterState > 0 {
                                chapterState -= 1
                                offset += 250
                            }
                        }
                    } label: {
                        Text("<")
                            .font(Font.custom("Hansip", size: 62))
                            .foregroundColor(.black)
                    }
                    .shadow(color: .black.opacity(0.3), radius: 0.2, x: 0.2)
                    .position(self.prevButton)
                    
                    Text(chapterState == 0 ? "bored of routine" :
                        chapterState == 1 ? "she can’t talk." :
                        chapterState == 2 ? "everything happen \n at once." :
                        chapterState == 3 ? "cover the hole \n of sadness." :
                        chapterState == 4 ? "I’m not ready yet." : "the day has come"
                    )
                    .multilineTextAlignment(.center)
                    .font(Font.custom("Hansip", size: 22))
                    .foregroundColor(.black)
                    .position(self.titleChapter)
                    .shadow(color: .black.opacity(0.3), radius: 0.2, x: 0.2)
                    
                    Button {
                        withAnimation(.easeInOut(duration: 1.5)) {
//                            if chapterState == 5 {
//                                chapterState = 5
//                            } else {
//                                chapterState += 1
//                            }
                            if chapterState < chapterPosition.count - 1 {
                                chapterState += 1
                                offset -= 250
                            }
                        }
                    } label: {
                        Text(">")
                            .font(Font.custom("Hansip", size: 62))
                            .foregroundColor(.black)
                    }
                    .shadow(color: .black.opacity(0.3), radius: 0.2, x: 0.2)
                    .position(self.nextButton)
                }
                .offset(y: 50)
                
                // Play Button
                ZStack {
                    if listChapter.count > 0 {
                        ForEach(0 ..< 6, id: \.self) { index in
                            Group {
//                                if listChapter[index].status == "playable" {
                                    Image("PlayButton")
                                        .resizable()
                                        .frame(width: 95, height: 95)
                                        .scaledToFit()
                                        .position(self.playButtonPosition)
                                        .shadow(color: .black.opacity(0.3), radius: 0.2, x: 0.2)
                                    
                                    Text("Play")
                                        .font(Font.custom("Hansip", size: 20))
                                        .multilineTextAlignment(.center)
                                        .position(self.playPosition)
                                    
//                                } else if listChapter[index].status == "locked" {
//                                    Text("Locked")
//                                        .multilineTextAlignment(.center)
//                                        .font(Font.custom("Hansip", size: 22))
//                                        .foregroundColor(.black)
//                                        .position(self.playButtonPosition)
//                                        .shadow(color: .black.opacity(0.3), radius: 0.2, x: 0.2)
//                                    
//                                } else {
//                                    Text("Coming Soon")
//                                        .multilineTextAlignment(.center)
//                                        .font(Font.custom("Hansip", size: 22))
//                                        .foregroundColor(.black)
//                                        .position(self.playButtonPosition)
//                                        .shadow(color: .black.opacity(0.3), radius: 0.2, x: 0.2)
//                                }
                            }
                            .opacity(chapterState == index ? 1.0 : 0.0)
                            .onTapGesture {
                                transition(chapter: index)
                            }
                        }
                    }
                }
            }
            .opacity(scene_opacity)
            .onAppear {
                loadChapter()
                print(listChapter)
                startPage()
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        withAnimation(.easeInOut(duration: 1)) {
                            presentationMode.wrappedValue.dismiss()
                        }
                    } label: {
                        Text("<")
                            .font(Font.custom("Hansip", size: 80))
                            .foregroundColor(Color("buttonColor"))
                    }
                }
            }
        }
    }
    
    func startPage() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 2.0)) {
                scene_opacity = 1.0
            }
        }
    }
    
    func transition(chapter: Int) {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 2.0)) {
                scene_opacity = 0.0
//                transitions[1] = 0.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeInOut(duration: 2.0)) {
//                transitions[2] = 1.0
                chapterPicked = chapter + 1
            }
        }
    }
}

struct ChapterView_Previews: PreviewProvider {
    static var previews: some View {
        ChapterView(transitions: .constant([0.0]), chapterPicked: .constant(0))
    }
}
