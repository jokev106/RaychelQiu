//
//  Game1_CaptchaPuzzle.swift
//  RaychelQiu
//
//  Created by Jonathan Kevin on 01/11/22.
//

import SwiftUI

struct Game1_CaptchaPuzzle: View {
    
    @State var isWinter1: Bool = false
    @State var isWinter2: Bool = false
    @State var isWinter3: Bool = false

    
    var body: some View {
        GeometryReader {geo in
            ZStack{
                if isWinter1 == false || isWinter2 == false || isWinter3 == false {
                    ZStack{
                        VStack{
                            VStack(alignment: .center){
                                Spacer()
                                HStack{
                                    Spacer()
                                    Image("Game1_winter1")
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .border(.green, width: 4)
                                        .border(isWinter1 ? .green : .white, width: 4)
                                        .onTapGesture {
                                            isWinter1.toggle()
                                        }
                                    Spacer()
                                        .frame(width: 10,height: 10)
                                    Image("Game1_winter2")
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .border(isWinter2 ? .green : .white, width: 4)
                                        .onTapGesture {
                                            isWinter2.toggle()
                                        }
                                    Spacer()
                                }
                                HStack{
                                    Image("Game1_winter3")
                                        .resizable()
                                        .frame(width: 100, height: 100)
//                                        .border(.green, width: 4)
                                        .border(isWinter3 ? .green : .white, width: 4)
                                        .onTapGesture {
                                            isWinter3.toggle()
                                        }
                                    Spacer()
                                        .frame(width: 10,height: 10)
                                    Image("random")
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .border(.white, width: 4)
                                    
                                }
                                HStack{
                                    Image("random")
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .border(.white, width: 4)
                                    Spacer()
                                        .frame(width: 10,height: 10)
                                    Image("random")
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .border(.white, width: 4)
                                }
                                Spacer()
                            }
                            HStack{
                                Spacer()
                                Image(systemName: "chevron.right.circle")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width: 80, height: 80)
                                    .onTapGesture {
                                        withAnimation(.default) {
                                            
                                        }
                                    }
                                Spacer()
                                    .frame(width: 20)
                            }
                            .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.8)))
                        }
                        
                    }
                }
                if isWinter1 == true && isWinter2 == true && isWinter3 == true {
                    VStack{
                        VStack(alignment: .center){
                            Spacer()
                            HStack{
                                Spacer()
                                Image("winter1")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .border(.green, width: 4)
                                    .border(isWinter1 ? .green : .white, width: 4)
                                    .onTapGesture {
                                        isWinter1.toggle()
                                    }
                                Spacer()
                                    .frame(width: 10,height: 10)
                                Image("winter2")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .border(isWinter2 ? .green : .white, width: 4)
                                    .onTapGesture {
                                        isWinter2.toggle()
                                    }
                                Spacer()
                            }
                            HStack{
                                Image("winter3")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .border(.green, width: 4)
                                    .border(isWinter3 ? .green : .white, width: 4)
                                    .onTapGesture {
                                        isWinter3.toggle()
                                    }
                                Spacer()
                                    .frame(width: 10,height: 10)
                                Image("random")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .border(.white, width: 4)
                                
                            }
                            HStack{
                                Image("random")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .border(.white, width: 4)
                                Spacer()
                                    .frame(width: 10,height: 10)
                                Image("random")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .border(.white, width: 4)
                            }
                            Spacer()
                        }
                        HStack{
                            Spacer()
                            Image(systemName: "chevron.right.circle")
                                .resizable()
                                .foregroundColor(.black)
                                .frame(width: 80, height: 80)
                                .onTapGesture {
                                    withAnimation(.default) {
                                        
                                    }
                                }
                                
                            Spacer()
                                .frame(width: 20)
                        }
                        .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.8)))
                    }
                }
            }
        }
    }
}

struct Game1_CaptchaPuzzle_Previews: PreviewProvider {
    static var previews: some View {
        Game1_CaptchaPuzzle()
    }
}
