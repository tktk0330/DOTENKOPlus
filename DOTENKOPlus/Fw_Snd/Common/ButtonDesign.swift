//
//  ButtonDesign.swift
//  DOTENKOPlus
//
//  Created by Takuma Shinoda on 2023/12/15.
//

import SwiftUI

struct Btnwb: View {
    var btnText: String
    var btnTextSize: CGFloat
    var btnWidth: CGFloat
    var btnHeight: CGFloat
    var btnColor: Color = Color.casinoGreen
    
    var body: some View {
        
        Text(btnText)
            .font(.custom(FontName.ALFA_Re, size: btnTextSize))
            .foregroundColor(Color.white)
            .fontWeight(.bold)
            .bold()
            .padding()
            .frame(width: btnWidth, height: btnHeight)
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(btnColor)
                    .shadow(color: Color.casinoShadow, radius: 1, x: 5, y: 10)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.white, lineWidth: 5)
            )
    }
}

// 浮いてる感じのボタン
struct PressBtn: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.90 : 1.0)
    }
}

