//
//  Game5View.swift
//  RaychelQiu
//
//  Created by Jonathan Valentino on 01/11/22.
//

import SwiftUI

struct Game5View: View {
    @State var colorSelected = Color(.red)
//    @State var arrayColor = [Color]()
    @State var arrayColor = [Color(.white), Color(.white), Color(.white)]
    
    var body: some View {
        GeometryReader {_ in
            ZStack {
                VStack {
                    ForEach(arrayColor.indices, id: \.self) { index in
                        Rectangle()
                            .foregroundColor(arrayColor[index])
                            .border(.black, width: 2)
                            .onTapGesture {
                                arrayColor[index] = colorSelected
                            }
                            .padding()
                            
                    }
                    
//                    Image("Game4_6")
//                        .renderingMode(.template)
//                        .foregroundColor(.green)
                    
                    HStack {
                        Rectangle()
                            .foregroundColor(.red)
                            .frame(height: 100)
                            .border(.black, width: colorSelected == .red ? 5 : 0)
                            .cornerRadius(10)
                            .onTapGesture {
                                colorSelected = .red
                            }
                            
                        Rectangle()
                            .foregroundColor(.yellow)
                            .frame(height: 100)
                            .border(.black, width: colorSelected == .yellow ? 5 : 0)
                            .cornerRadius(10)
                            .onTapGesture {
                                colorSelected = .yellow
                            }
                        
                        Rectangle()
                            .foregroundColor(.blue)
                            .frame(height: 100)
                            .border(.black, width: colorSelected == .blue ? 5 : 0)
                            .cornerRadius(10)
                            .onTapGesture {
                                colorSelected = .blue
                            }
                    }
                    .padding()
                }
            }
        }
    }
}

struct Game5View_Previews: PreviewProvider {
    static var previews: some View {
        Game5View()
    }
}
