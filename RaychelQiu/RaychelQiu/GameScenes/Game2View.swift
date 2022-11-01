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
    @State var list = [false, false, false]
    
    var body: some View {
        ZStack{
            ScrollView{
                Rectangle()
                    .foregroundColor(.red)
                    .frame(height: 300)
                
                Button {
                    if list[0] == false {
                        count += 1
                        list[0] = true
                    } else {
                        count -= 1
                        list[0] = false
                    }
                } label: {
                    Text("bookmark this!")
                }
                
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(height: 300)
                
                Button {
                    if list[1] == false {
                        count += 1
                        list[1] = true
                    } else {
                        count -= 1
                        list[1] = false
                    }
                } label: {
                    Text("bookmark this!")
                }
                
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(height: 300)
                
                Button {
                    if list[2] == false {
                        count += 1
                        list[2] = true
                    } else {
                        count -= 1
                        list[2] = false
                    }
                } label: {
                    Text("bookmark this!")
                }
                
                Text("\(count)")
                    .foregroundColor(.green)
                
                Button {
                    if count > 2 {
                        color = .green
                    } else {
                        color = .blue
                    }
                } label: {
                    Circle()
                        .frame(height: 200)
                        .foregroundColor(color)
                }
            }
        }
    }
}

struct Game2View_Previews: PreviewProvider {
    static var previews: some View {
        Game2View()
    }
}
