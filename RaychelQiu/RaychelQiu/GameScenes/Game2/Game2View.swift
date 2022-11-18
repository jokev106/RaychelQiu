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
    
    var body: some View {
        ZStack {
            Image("Phone")
                .resizable()
                .scaledToFit()
                .frame(width: 300)
            
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
            .frame(maxWidth: 370, maxHeight: 800)
            .cornerRadius(40)
            .scaleEffect(0.72)
            .offset(x: 0, y: 10)
            
            if count >= 3 {
                Button {} label: {
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

struct Game2View_Previews: PreviewProvider {
    static var previews: some View {
        Game2View()
    }
}
