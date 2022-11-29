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
    @State var positionPhone = CGPoint(x: 60, y: 480)
    @Binding var scene_main: Int
    @Binding var scene_frame: Double
    
    var body: some View {
        GeometryReader{geometry in
            ZStack {
//                Image("Phone")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 300)
                
                Image("CaptchaPhone")
                    .resizable()
                    .frame(width: 660, height: 800)
                    .position(self.positionPhone)
                    .shadow(color: .black.opacity(0.3), radius: 2, x: 2, y: 2)
                
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
                        .frame(width: .infinity)
                        .padding(.bottom)
                        .padding(.top, 25)
                    
                    ForEach(0 ..< 5, id: \.self) { index in
                        Image(image[index])
                            .resizable()
                            .scaledToFit()
                            .frame(width: .infinity)
                            .onTapGesture(count: 2) {
                                if likes[index] == false {
                                    likes[index] = true
                                    if bookmarks[index] == false {
                                        count += 1
                                    }
                                }
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
                .cornerRadius(40)
                .padding(.horizontal, 15)
                .scaleEffect(0.72)
                .offset(x: 0, y: 10)
                
                if count >= 3 {
                    Button {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            withAnimation(.easeInOut(duration: 3)) {
                                scene_frame += 800
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            scene_main += 1
                        }
                        
                    } label: {
                        Image(systemName: "chevron.right.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                            .foregroundColor(.brown)
                    }
                    .offset(x: 0, y: 340)
                }
            }
        }
        
    }
}

struct Game2View_Previews: PreviewProvider {
    static var previews: some View {
        Game2View(scene_main: .constant(0), scene_frame: .constant(0.0))
    }
}
