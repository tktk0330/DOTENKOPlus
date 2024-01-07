


import SwiftUI

struct MainHistoryView: View {
    
    @StateObject var mainState: MainState = appState.main

    var body: some View {
        GeometryReader { geo in
            
            VStack() {
                HStack() {
                    Text("Game")
                        .font(.custom(FontName.ALFA_Re, size: 25))
                        .foregroundColor(Color.white)
                        .frame(width: geo.size.width * 0.25)
                    
                    Text("Winner")
                        .font(.custom(FontName.MP_EB, size: 25))
                        .foregroundColor(Color.dtnkLightRed)
                        .lineLimit(1)
                        .minimumScaleFactor(0.3)
                        .frame(width: geo.size.width * 0.25)
                    
                    Text("Loser")
                        .font(.custom(FontName.ALFA_Re, size: 25))
                        .foregroundColor(Color.dtnkLightBlue)
                        .lineLimit(1)
                        .minimumScaleFactor(0.2)
                        .frame(width: geo.size.width * 0.25)
                    
                    Text("Score")
                        .font(.custom(FontName.ALFA_Re, size: 25))
                        .foregroundColor(Color.white)
                        .lineLimit(1)
                        .minimumScaleFactor(0.2)
                        .frame(width: geo.size.width * 0.25)
                }
                
                ScrollView(showsIndicators: true) {
                    ForEach(mainState.histories.indices.reversed(), id: \.self) { index in
                        HStack() {
                            Text("\(mainState.histories[index].gameNumber)")
                                .font(.custom(FontName.ALFA_Re, size: 20))
                                .foregroundColor(Color.white)
                                .frame(width: geo.size.width * 0.25)
                            
                            Text("\(mainState.histories[index].winnerName)")
                                .font(.custom(FontName.MP_EB, size: 20))
                                .foregroundColor(Color.white)
                                .lineLimit(1)
                                .minimumScaleFactor(0.3)
                                .frame(width: geo.size.width * 0.25)
                            
                            Text("\(mainState.histories[index].loserName)")
                                .font(.custom(FontName.ALFA_Re, size: 20))
                                .foregroundColor(Color.white)
                                .lineLimit(1)
                                .minimumScaleFactor(0.2)
                                .frame(width: geo.size.width * 0.25)
                            
                            Text("\(mainState.histories[index].score)")
                                .font(.custom(FontName.ALFA_Re, size: 20))
                                .foregroundColor(Color.white)
                                .lineLimit(1)
                                .minimumScaleFactor(0.2)
                                .frame(width: geo.size.width * 0.25)
                        }
                    }
                }
            }
            .frame(width: Constants.scrWidth * 0.80, height: Constants.scrHeight * 0.43)
            .position(x: geo.size.width * 0.5, y:  Constants.scrHeight * 0.30)
                                    
            HStack(spacing: 50) {
                Button(action: {
                    appState.main.mode = .base
                }) {
                    Btnwb(btnText: "Back", btnTextSize: 20, btnWidth: 150, btnHeight: 40, btnColor: Color.black.opacity(0.85))
                }
                .buttonStyle(PressBtn())
            }
            .position(x: geo.size.width / 2, y: geo.size.height * 0.85)
            
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
