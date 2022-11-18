//
//  ChapterView.swift
//  RaychelQiu
//
//  Created by Jonathan Kevin on 17/11/22.
//

import SwiftUI

struct ChapterView: View {
    
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    
    //Current chapter tittle
    @State var chapterState:Int = 0
    
    @State var titleChapter = CGPoint(x: 201, y: 490)
    @State var chapter = CGPoint(x: 198, y: 80)
    @State var nextButton = CGPoint(x: 326, y: 495)
    @State var prevButton = CGPoint(x: 76, y: 495)
    @State var imageBorder = CGPoint(x: 228, y: 310)
    @State var chapterImage = CGPoint(x: 188, y: 282)
    @State var playButtonPosition = CGPoint(x: 198, y: 640)
    @State var playPosition = CGPoint(x: 198, y: 705)
    
    var body: some View {
        GeometryReader{geo in
            ZStack{
                Image("ScreenBG")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                //chapter
                Group{
                    Text(chapterState == 0 ? "Prologue" :
                            chapterState == 1 ? "Chapter 1" :
                            chapterState == 2 ? "Chapter 2" :
                            chapterState == 3 ? "Chapter 3" :
                            chapterState == 4 ? "Chapter 4" : "Epilogue")
                    .font(Font.custom("Hansip", size: 32))
                    .foregroundColor(.black)
                    .position(self.chapter)
                    .shadow(color: .black.opacity(0.3), radius: 0.2, x: 0.2)
                }
                
                //Image Chapter
                Group{
                    Image("ChapterBorder")
                        .resizable()
                        .frame(width: 400, height: 530)
                        .scaledToFit()
                        .shadow(color: .black.opacity(0.3), radius: 0.2, x: 0.2)
                        .position(self.imageBorder)
                    Image(chapterState == 0 ? "Prologue" :
                            chapterState == 1 ? "Chapter1" :
                            chapterState == 2 ? "Chapter2" :
                            chapterState == 3 ? "Chapter3" :
                            chapterState == 4 ? "Chapter4" : "Epilogue")
                    .resizable()
                    .frame(width: 220, height: 280)
                    .scaledToFit()
                    .rotationEffect(.degrees(-8.4))
                    .position(self.chapterImage)
                }
                
                //Chapter Tittle and button next, prev
                Group{
                    Button {
                        withAnimation(.default){
                            if chapterState == 0 {
                                chapterState = 0
                            } else {
                                chapterState -= 1
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
                        withAnimation(.default){
                            if chapterState == 5 {
                                chapterState = 5
                            } else {
                                chapterState += 1
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
                
                //Play Button
                NavigationLink {
                    if chapterState == 0 {
                        withAnimation(.default){
                            ChapterView()
                        }
                    }
                    if chapterState == 1 {
                        withAnimation(.default){
                            ChapterView()
                        }
                    }
                    if chapterState == 2 {
                        withAnimation(.default){
                            ChapterView()
                        }
                    }
                    if chapterState == 3 {
                        withAnimation(.default){
                            ChapterView()
                        }
                    }
                    if chapterState == 4 {
                        withAnimation(.default){
                            ChapterView()
                        }
                    }
                    if chapterState == 5 {
                        withAnimation(.default){
                            ChapterView()
                        }
                    }
                } label: {
                    Image("PlayButton")
                        .resizable()
                }.frame(width: 95, height: 95)
                .scaledToFit()
                .position(self.playButtonPosition)
                .shadow(color: .black.opacity(0.3), radius: 0.2, x: 0.2)
                Text("Play")
                    .font(Font.custom("Hansip", size: 20))
                    .multilineTextAlignment(.center)
                    .position(self.playPosition)

            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("<")
                            .font(Font.custom("Hansip", size: 80))
                            .foregroundColor(Color("buttonColor"))
                    }

                }
            }
        }
    }
}

struct ChapterView_Previews: PreviewProvider {
    static var previews: some View {
        ChapterView()
    }
}
