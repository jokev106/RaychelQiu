//
//  Chapter1_Day.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 28/11/22.
//

import SwiftUI

struct Chapter1_Day: View {
    
    @Binding var mainOnTap: Bool
    @Binding var moon_x: Double
    @Binding var night_x: Double
    @State var day_opac = 1.0
    @State var night_opac = 0.0
    @State var sun_angle = 0.0
    @State var moon_angle = -140.0
    @State var sun_x = 0.0
    @State var day_x = 0.0
    
    var body: some View {
        GeometryReader{geometry in
            ZStack{
                Image("Border")
                    .resizable()
                    .frame(width: 330, height: 449.6)
                    .offset(y: -102)
                
                ZStack{
                    Image("Day")
                        .resizable()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .opacity(day_opac)
                        .offset(x: day_x)
                        .onAppear{
                            transition_in()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 7.5) {
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
                .scaleEffect(1.27)
                .offset(y: 20)
            }
        }
    }
    
    func transition_in(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            withAnimation(.easeInOut(duration: 1.5)) {
               
                sun_angle += 70
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            withAnimation(.easeInOut(duration: 2.5)) {
                night_opac += 1
                moon_angle += 140
            }
        }
    }
}

struct Chapter1_Day_Previews: PreviewProvider {
    static var previews: some View {
        Chapter1_Day(mainOnTap: .constant(false), moon_x: .constant(0.0), night_x: .constant(0.0))
    }
}
