//
//  Prologue_Dinner.swift
//  RaychelQiu
//
//  Created by Vincent Leonard on 03/11/22.
//

import SwiftUI

struct Prologue_Dinner: View {
    
    @Binding var mainOnTap: Bool
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Prologue_Dinner_Previews: PreviewProvider {
    static var previews: some View {
        Prologue_Dinner(mainOnTap: .constant(false))
    }
}
