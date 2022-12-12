//
//  Game2View.swift
//  RaychelQiu
//
//  Created by Jonathan Valentino on 20/10/22.
//

import SwiftUI

struct Game2View: View {
    @State var count = 0
    @State var color: Color = .blue
    @State var likes = [false, false, false, false, false]
    @State var bookmarks = [false, false, false, false, false]
    @State var image = ["Post1", "Post2", "Post3", "Post4", "Post5"]
    @State var positionPhone = CGPoint(x: 59, y: 480)
    
    @Binding var mainOnTap: Bool
    @Binding var scene_main: Int
    @Binding var scene_frame: Double
    
    var body: some View {
        GeometryReader { _ in
            ZStack {
//                Image("Phone")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 300)
                
                Image("CaptchaPhone")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(1.7)
                    .position(self.positionPhone)
                    .shadow(color: .black.opacity(0.3), radius: 2, x: 2, y: 2)
//                    .offset(x: -138, y: 100)
                
                VStack {
                    if count == 1 {
                        Image("1of3Bar")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                    } else if count == 2 {
                        Image("2of3Bar")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                    } else if count >= 3 {
                        Image("3of3Bar")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                    } else {
                        Image("0of3Bar")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                    }
                }
                .offset(x: 0, y: -340)
                
                ScrollView(showsIndicators: false) {
                    Image("QiustagramStory")
                        .resizable()
                        .scaledToFit()
                        .padding(.bottom)
                        .padding(.top, 25)
                    
                    ForEach(0 ..< 5, id: \.self) { index in
                        Image(image[index])
                            .resizable()
                            .scaledToFit()
                            .onTapGesture(count: 2) {
                                if likes[index] == false {
                                    likes[index] = true
                                    if bookmarks[index] == false {
                                        count += 1
                                    }
                                }
                                SFXManager.instance.playSFX(sound: .pop)
                            }
                        
                        HStack {
                            Button {
                                if likes[index] == false {
                                    likes[index] = true
                                    if bookmarks[index] == false {
                                        count += 1
                                    }
                                } else {
                                    likes[index] = false
                                    if bookmarks[index] == false {
                                        count -= 1
                                    }
                                }
                                SFXManager.instance.playSFX(sound: .pop)
                            } label: {
                                if likes[index] == false {
                                    Image("Instalikeunclick")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30)
                                } else {
                                    Image("Instalike")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30)
                                }
                            }
                            
                            Spacer()
                            
                            Button {
                                if bookmarks[index] == false {
                                    bookmarks[index] = true
                                    if likes[index] == false {
                                        count += 1
                                    }
                                } else {
                                    bookmarks[index] = false
                                    if likes[index] == false {
                                        count -= 1
                                    }
                                }
                                SFXManager.instance.playSFX(sound: .pop)
                            } label: {
                                if bookmarks[index] == false {
                                    Image("Bookmarkunclick")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 22)
                                } else {
                                    Image("Bookmark")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 22)
                                }
                            }
                        }
                        .padding(.vertical)
                    }
                }
                .background(.white)
                .cornerRadius(40)
                .padding(.horizontal, 15)
                .scaleEffect(0.72)
                .offset(x: 0, y: 10)
                
                Image("Finger")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 350)
                    .position(self.positionPhone)
                    .offset(x: 281, y: -110)
                
                if count >= 3 {
                    Button {
                        if mainOnTap == true {
                            mainOnTap = false
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                scene_main += 1
                                withAnimation(.easeInOut(duration: 3)) {
                                    scene_frame += 800
                                }
                            }
                        }
                        
                    } label: {
                        Image(systemName: "chevron.right.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                            .foregroundColor(.brown)
                    }
                    .offset(x: 0, y: 340)
                    .onAppear {
                        mainOnTap = true
                    }
                }
            }
            .frame(width: 393, height: 760, alignment: .center)
        }
    }
}

struct Game2View_Previews: PreviewProvider {
    static var previews: some View {
        Game2View(mainOnTap: .constant(false), scene_main: .constant(0), scene_frame: .constant(0.0))
    }
}
