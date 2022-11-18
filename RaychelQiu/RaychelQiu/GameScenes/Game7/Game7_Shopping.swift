//
//  Game7_Shopping.swift
//  RaychelQiu
//
//  Created by Jonathan Kevin on 08/11/22.
//

import SwiftUI

struct Game7_Shopping: View {
    
    //Items positioning
    @State var positionShoppingList = CGPoint(x: 198, y: 585)
    @State var positionBorderShop = CGPoint(x: 198, y: 275)
    @State var positionStraightPin = CGPoint(x: 198, y: 360)
    @State var positionSeamsRipper = CGPoint(x: 188, y: 390)
    @State var positionSewingScissors = CGPoint(x: 188, y: 380)
    @State var positionButton = CGPoint(x: 198, y: 385)
    @State var positionThread = CGPoint(x: 198, y: 355)
    @State var positionRotaryCutters = CGPoint(x: 198, y: 380)
    @State var positionTracingWheel = CGPoint(x: 188, y: 345)
    @State var positionZipper = CGPoint(x: 190, y: 385)
    @State var positionMeasuringTape = CGPoint(x: 190, y: 380)
    
    //Button clear mark position
    @State var question1 = CGPoint(x: 217.6, y: 468.6)
    @State var question2 = CGPoint(x: 218.6, y: 495)
    @State var question3 = CGPoint(x: 215.6, y: 520)
    @State var question4 = CGPoint(x: 216, y: 545)
    @State var question5 = CGPoint(x: 217.6, y: 569.6)
    @State var question6 = CGPoint(x: 222.6, y: 595.6)
    @State var question7 = CGPoint(x: 215.3, y: 622.3)
    @State var question8 = CGPoint(x: 227, y: 648.6)
    @State var question9 = CGPoint(x: 225.6, y: 672)
    
    //Visible clear mark
    @State var isQuestion1:Bool = false
    @State var isQuestion2:Bool = false
    @State var isQuestion3:Bool = false
    @State var isQuestion4:Bool = false
    @State var isQuestion5:Bool = false
    @State var isQuestion6:Bool = false
    @State var isQuestion7:Bool = false
    @State var isQuestion8:Bool = false
    @State var isQuestion9:Bool = false
    
    //Visible bool items
    @State var isSewingScissors:Bool = false
    @State var isSeamsRipper:Bool = false
    @State var isStraightPin:Bool = false
    @State var isThread:Bool = false
    @State var isRotaryCutters:Bool = false
    @State var isTracingWheel:Bool = false
    @State var isButton:Bool = true
    @State var isZipper:Bool = false
    @State var isMeasuringTape:Bool = false
    
    var body: some View {
        GeometryReader{geo in
            ZStack{
                Image("Shop")
                    .resizable()
                    .frame(width: 330, height: 449.6)
                    .position(self.positionBorderShop)
                Image("ShoppingList")
                    .resizable()
                    .frame(width: 330, height: 370)
                    .position(self.positionShoppingList)
                
                //Button for Clear Mark
                ZStack{
                    //Sewing Scissors
                    Button {
                        if isSewingScissors == true {
                            withAnimation(.default){
                                isQuestion1 = true
                                isSewingScissors = false
                            }
                        }
                    } label: {
                       Rectangle()
                            .opacity(0)
                    }.frame(width: 100, height: 10)
                        .position(self.question1)
                    
                    //Seams Ripper
                    Button {
                        if isSeamsRipper == true {
                            withAnimation(.default){
                                isQuestion2 = true
                                isSeamsRipper = false
                                isMeasuringTape = true
                            }
                        }
                    } label: {
                        Rectangle()
                            .opacity(0)
                    }  .frame(width: 100, height: 10)
                        .position(self.question2)
                    
                    //Straight Pin
                    Button {
                        if isStraightPin == true {
                            withAnimation(.default){
                                isQuestion3 = true
                                isStraightPin = false
                                isRotaryCutters = true
                            }
                        }
                    } label: {
                        Rectangle()
                            .opacity(0)
                    }.frame(width: 100, height: 10)
                        .position(self.question3)
                    
                    //Thread
                    Button {
                        if isThread == true {
                            withAnimation(.default){
                                isQuestion4 = true
                                isThread = false
                                isStraightPin = true
                            }
                        }
                    } label: {
                        Rectangle()
                            .opacity(0)
                    } .frame(width: 100, height: 10)
                        .position(self.question4)
                    
                    //Rotary Cutters
                    Button {
                        if isRotaryCutters == true {
                            withAnimation(.default){
                                isQuestion5 = true
                                isRotaryCutters = false
                                isZipper = true
                            }
                        }
                    } label: {
                        Rectangle()
                            .opacity(0)
                    }.frame(width: 100, height: 10)
                        .position(self.question5)
                    
                    //Tracing Wheel
                    Button {
                        if isTracingWheel == true {
                            withAnimation(.default){
                                isQuestion6 = true
                                isTracingWheel = false
                                isSewingScissors = true
                            }
                        }
                    } label: {
                       Rectangle()
                            .opacity(0)
                    }.frame(width: 100, height: 10)
                        .position(self.question6)
                    
                    //Button
                    Button {
                        if isButton == true {
                            withAnimation(.default){
                                isQuestion7 = true
                                isButton = false
                                isThread = true
                            }
                        }
                    } label: {
                        Rectangle()
                            .opacity(0)
                    } .frame(width: 100, height: 10)
                        .position(self.question7)
                    
                    //Zipper
                    Button {
                        if isZipper == true {
                            withAnimation(.default){
                                isQuestion8 = true
                                isZipper = false
                                isSeamsRipper = true
                            }
                        }
                    } label: {
                        Rectangle()
                            .opacity(0)
                    }.frame(width: 100, height: 10)
                        .position(self.question8)
                    
                    //Measuring Tape
                    Button {
                        if isMeasuringTape == true {
                            withAnimation(.default){
                                isQuestion9 = true
                                isMeasuringTape = false
                                isTracingWheel = true
                            }
                        }
                    } label: {
                        Rectangle()
                            .opacity(0)
                    }.frame(width: 100, height: 10)
                        .position(self.question9)
                    
                }
                
                //Clear Mark for correct answer
                ZStack{
                    if isQuestion1 == true {
                        Image("ClearMark")
                            .resizable()
                            .frame(width: 100, height: 7)
                            .position(self.question1)
                    }
                    if isQuestion2 == true {
                        Image("ClearMark")
                            .resizable()
                            .frame(width: 100, height: 7)
                            .position(self.question2)
                    }
                    if isQuestion3 == true {
                        Image("ClearMark")
                            .resizable()
                            .frame(width: 100, height: 7)
                            .position(self.question3)
                    }
                    if isQuestion4 == true {
                        Image("ClearMark")
                            .resizable()
                            .frame(width: 85, height: 7)
                            .position(self.question4)
                    }
                    if isQuestion5 == true {
                        Image("ClearMark")
                            .resizable()
                            .frame(width: 100, height: 7)
                            .position(self.question5)
                    }
                    if isQuestion6 == true {
                        Image("ClearMark")
                            .resizable()
                            .frame(width: 100, height: 7)
                            .position(self.question6)
                    }
                    if isQuestion7 == true {
                            Image("ClearMark")
                                .resizable()
                                .frame(width: 70, height: 7)
                                .position(self.question7)
                    }
                    if isQuestion8 == true {
                        Image("ClearMark")
                            .resizable()
                            .frame(width: 100, height: 7)
                            .position(self.question8)
                    }
                    if isQuestion9 == true {
                        Image("ClearMark")
                            .resizable()
                            .frame(width: 100, height: 7)
                            .position(self.question9)
                    }
                    
                }
                
                //Items visibility
                ZStack{
                    if isButton == true {
                        Image("Button")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .position(self.positionButton)
                            .rotationEffect(.degrees(-10))
                    }
                    if isSewingScissors == true {
                        Image("SewingScissors")
                            .resizable()
                            .frame(width: 120, height: 100)
                            .position(self.positionSewingScissors)
                            .rotationEffect(.degrees(-30))
                    }
                    if isSeamsRipper == true {
                        Image("SeamsRipper")
                            .resizable()
                            .frame(width: 45, height: 155)
                            .position(self.positionSeamsRipper)
                            .rotationEffect(.degrees(-90))
                    }
                    if isStraightPin == true {
                        Image("StraightPin")
                            .resizable()
                            .frame(width: 100, height: 120)
                            .position(self.positionStraightPin)
                    }
                    if isThread == true {
                        Image("Thread")
                            .resizable()
                            .frame(width: 100, height: 105)
                            .position(self.positionThread)
                    }
                    if isRotaryCutters == true {
                        Image("RotaryCutters")
                            .resizable()
                            .frame(width: 55, height: 130)
                            .position(self.positionRotaryCutters)
                            .rotationEffect(.degrees(-90))
                    }
                    if isTracingWheel == true {
                        Image("TracingWheel")
                            .resizable()
                            .frame(width: 55, height: 130)
                            .position(self.positionTracingWheel)
                    }
                    if isZipper == true {
                        Image("Zipper")
                            .resizable()
                            .frame(width: 130, height: 130)
                            .position(self.positionZipper)
                    }
                    if isMeasuringTape == true {
                        Image("MeasuringTape")
                            .resizable()
                            .frame(width: 120, height: 90)
                            .scaledToFit()
                            .position(self.positionMeasuringTape)
                    }
                }
                
            }
        }.background(Color("CreamBG"))
    }
}

struct Game7_Shopping_Previews: PreviewProvider {
    static var previews: some View {
        Game7_Shopping()
    }
}
