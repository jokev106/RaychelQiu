//
//  Prologue_Scene2_Transisi_Hari.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 31/10/22.
//

import SwiftUI

struct Prologue_Scene2_Transisi_Hari: View {
    
    @Binding var mainOnTap: Bool
    @Binding var moon_x: Double
    @Binding var night_x: Double
    @State var day_opac = 1.0
    @State var night_opac = 0.0
    @State var sun_angle = 0.0
    @State var moon_angle = -140.0
    @State var sun_x = -100.0
    @State var day_x = -150.0
    
    var body: some View {
        GeometryReader{geometry in
            ZStack{
                Image("Border")
                    .resizable()
                    .frame(width: 330, height: 449.6)
                    .offset(y: -114)
                
                ZStack{
                    Image("Day")
                        .resizable()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .opacity(day_opac)
                        .offset(x: day_x)
                        .onAppear{
                            transition_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 5.5) {
                                mainOnTap = true
                            }
                        }
                    Image("Night")
                        .resizable()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .opacity(night_opac)
                        .offset(x: night_x)
                    Image("Sun")
                        .resizable()
                        .scaledToFit()
                        .rotationEffect(Angle(degrees: sun_angle))
                        .offset(x: sun_x)
                    Image("Moon")
                        .resizable()
                        .scaledToFit()
                        .rotationEffect(Angle(degrees: moon_angle))
                        .offset(x: moon_x)
                        .mask{
                            Image("Day")
                                .resizable()
                                .scaledToFit()
                                .offset(y: -20)
                        }
                    
                }
                .mask {
                    Image("Day")
                        .resizable()
                        .scaledToFit()
                }
                .scaleEffect(geometry.size.width * 0.00324)
                .offset(y: geometry.size.height * 0.011)
            }
            
            
        }
    }
    
    func transition_in(){
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: 2)) {
                sun_x += 100.0
                day_x += 150.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeInOut(duration: 1.5)) {
               
                sun_angle += 70
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            withAnimation(.easeInOut(duration: 2.5)) {
                night_opac += 1
                moon_angle += 140
            }
        }
    }
}

struct Prologue_Scene2_Transisi_Hari_Previews: PreviewProvider {
    static var previews: some View {
        Prologue_Scene2_Transisi_Hari(mainOnTap: .constant(false), moon_x: .constant(0.0), night_x: .constant(0.0))
    }
}
