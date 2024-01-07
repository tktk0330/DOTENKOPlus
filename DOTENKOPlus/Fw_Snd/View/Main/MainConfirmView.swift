


import SwiftUI

struct MainConfirmView: View {
    
    @StateObject var mainState: MainState = appState.main

    var body: some View {
        GeometryReader { geo in
                        
            VStack(spacing: 5) {
                // title
                Text("Check Result")
                    .font(.custom(FontName.ALFA_Re, size: 30))
                    .foregroundColor(Color.white)
                
                Text("\(mainState.gameUnitScore)")
                    .font(.custom(FontName.ALFA_Re, size: 30))
                    .foregroundColor(Color.yellow)
                
                HStack(spacing: 30) {
                    Text("\(mainState.winnerName)")
                        .font(.custom(FontName.ALFA_Re, size: 25))
                        .foregroundColor(Color.dtnkLightRed)
                        .lineLimit(1)
                        .minimumScaleFactor(0.3)
                        .frame(width: geo.size.width * 0.35)
                    
                    Image(ImageName.Main.resultArrow.rawValue)
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(x: -1, y: 1, anchor: .center)
                        .rotationEffect(.degrees(-40))
                        .frame(width: geo.size.width * 0.15)
                    
                    Text("\(mainState.loserName)")
                        .font(.custom(FontName.ALFA_Re, size: 25))
                        .foregroundColor(Color.dtnkLightBlue)
                        .lineLimit(1)
                        .minimumScaleFactor(0.3)
                        .frame(width: geo.size.width * 0.35)
                }
                
                // Btn
                HStack(spacing: 50) {
                    Button(action: {
                        appState.main.mode = .base
                    }) {
                        Btnwb(btnText: "Back", btnTextSize: 20, btnWidth: 150, btnHeight: 40, btnColor: Color.black.opacity(0.85))
                    }
                    .buttonStyle(PressBtn())
                    
                    Button(action: {
                        MainController().moveNextGame()
                    }) {
                        Btnwb(btnText: "NextGame", btnTextSize: 20, btnWidth: 150, btnHeight: 40, btnColor: Color.black.opacity(0.85))
                    }
                    .buttonStyle(PressBtn())
                }
            }
            .position(x: geo.size.width * 0.50, y: geo.size.height * 0.50)
        }
        .frame(width: Constants.scrWidth * 0.8, height: 280)
        .background(Color.black.opacity(0.85))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white, lineWidth: 3)
        )
    }
}
