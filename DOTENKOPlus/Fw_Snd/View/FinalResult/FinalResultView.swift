


import SwiftUI

struct FinalResultView: View {
    
    @StateObject var resultState: FinalResultState = appState.result
    let sortedPlayers = appState.result.players.sorted(by: { $0.rank < $1.rank })
    
    var body: some View {
        GeometryReader { geo in
            
            // TOTAL GAME
            Text("Total Game \(resultState.totalGame)")
                .font(.custom(FontName.ALFA_Re, size: Constants.scrHeight * 0.15))
                .foregroundColor(Color.white)
                .padding(5)
                .position(x: Constants.center, y:  geo.size.height * 0.15)
            
            // rank
            ScrollView(showsIndicators: true) {
                ForEach(sortedPlayers) { player in
                    HStack() {
                        Text("\(player.rank)")
                            .font(.custom(FontName.ALFA_Re, size: 30))
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .padding(5)
                            .frame(width: geo.size.width * 0.1)
                        
                        Text("\(player.name)")
                            .font(.custom(FontName.MP_EB, size: 30))
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .padding(5)
                            .lineLimit(1)
                            .minimumScaleFactor(0.3)
                            .frame(width: geo.size.width * 0.3)
                        
                        Text("\(player.score)")
                            .font(.custom(FontName.ALFA_Re, size: 30))
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .padding(5)
                            .lineLimit(1)
                            .minimumScaleFactor(0.2)
                            .frame(width: geo.size.width * 0.3)
                    }
                }
            }
            .frame(width: Constants.scrWidth * 0.80, height: Constants.scrHeight * 0.43)
            .position(x: Constants.center, y:  Constants.scrHeight * 0.43)
            
            Button(action: {
                CommonFunction().nextPage(page: .setting)
            }) {
                Btnwb(btnText: "Tap", btnTextSize: 20, btnWidth: 200, btnHeight: 40)
            }
            .buttonStyle(PressBtn())
            .position(x: Constants.center, y:  geo.size.height * 0.78)
        }
    }
}
