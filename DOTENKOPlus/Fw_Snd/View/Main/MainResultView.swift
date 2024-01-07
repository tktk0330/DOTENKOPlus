


import SwiftUI

struct MainResultView: View {
    
    @StateObject var mainState: MainState = appState.main
    let sortedPlayers = appState.main.players.sorted(by: { $0.rank < $1.rank })
    
    var body: some View {
        GeometryReader { geo in
            
            VStack(spacing: 5) {
                
                // TOTAL GAME
                Text("Total Game \(mainState.gameNum - 1)")
                    .font(.custom(FontName.ALFA_Re, size: 30))
                    .foregroundColor(Color.white)
                
                // rank
                ScrollView(showsIndicators: true) {
                    ForEach(sortedPlayers) { player in
                        HStack() {
                            Text("\(player.rank)")
                                .font(.custom(FontName.ALFA_Re, size: 25))
                                .foregroundColor(Color.white)
                                .frame(width: geo.size.width * 0.1, alignment: .trailing)
                            
                            Text("\(player.name)")
                                .font(.custom(FontName.MP_EB, size: 25))
                                .foregroundColor(Color.white)
                                .lineLimit(1)
                                .minimumScaleFactor(0.3)
                                .frame(width: geo.size.width * 0.4, alignment: .trailing)
                            
                            Text("\(player.score)")
                                .font(.custom(FontName.ALFA_Re, size: 25))
                                .foregroundColor(Color.white)
                                .lineLimit(1)
                                .minimumScaleFactor(0.2)
                                .frame(width: geo.size.width * 0.4, alignment: .trailing)
                        }
                    }
                }
                .frame(width: Constants.scrWidth * 0.80, height: Constants.scrHeight * 0.43)
                
                Button(action: {
                    appState.main.mode = .base
                }) {
                    Btnwb(btnText: "Back", btnTextSize: 20, btnWidth: 150, btnHeight: 40, btnColor: Color.black.opacity(0.85))
                }
                .buttonStyle(PressBtn())
                
            }
            .position(x: geo.size.width * 0.5, y:  geo.size.height * 0.5)
            
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
