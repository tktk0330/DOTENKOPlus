


import SwiftUI

struct MainView: View {
    
    @StateObject var mainState: MainState = appState.main
    
    @State private var upRate = ""
    @State private var desicionNum = ""
    @State private var selectedWinnerPlayerName: String = appState.main.players.first!.name
    @State private var selectedLoserPlayerName: String = appState.main.players.first!.name
    let allPlayers = ["ALL"] +  appState.main.players.map { $0.name }
    
    var body: some View {
        GeometryReader { geo in
            
            HStack(spacing: 5) {
                Text("Game \(mainState.gameNum)")
                DetailInfoButton(action: {
                    mainState.mode = .title
                })
            }
            .font(.custom(FontName.ALFA_Re, size: Constants.scrHeight * 0.15))
            .foregroundColor(Color.white)
            .padding(5)
            .position(x: Constants.center, y:  geo.size.height * 0.15)
            
            VStack(alignment: .leading, spacing: 30) {
                HStack(spacing: 30) {
                    HStack() {
                        HStack(spacing: 0) {
                            Text("上昇Rate")
                                .font(.custom(FontName.MP_Bl, size: 25))
                                .foregroundColor(Color.white)
                            
                            DetailInfoButton(action: {
                                mainState.mode = .upRateInfo
                            })
                        }
                        .padding(5)
                        
                        TextField("Enter", text: $mainState.upRate)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 190)
                    }
                    
                    HStack() {
                        HStack(spacing: 0) {
                            Text("最終数字")
                                .font(.custom(FontName.MP_Bl, size: 25))
                                .foregroundColor(Color.white)
                            
                            DetailInfoButton(action: {
                                mainState.mode = .desicionNumInfo
                            })
                        }
                        .padding(5)
                        
                        TextField("Enter", text: $mainState.desicionNum)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 190)
                    }
                }
                
                HStack(spacing: 40) {
                    HStack() {
                        HStack(spacing: 0) {
                            Text("Winner")
                                .font(.custom(FontName.ALFA_Re, size: 25))
                                .foregroundColor(Color.dtnkLightRed)
                            
                            DetailInfoButton(action: {
                                mainState.mode = .winnerInfo
                            })
                        }
                        .padding(5)
                        
                        // Picker
                        Picker("Select Player", selection: $selectedWinnerPlayerName) {
                            ForEach(allPlayers, id: \.self) { playerName in
                                Text(playerName)
                                    .tag(playerName)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .frame(width: 200)
                        
                    }
                    
                    HStack(spacing: 30) {
                        HStack(spacing: 0) {
                            Text("Loser")
                                .font(.custom(FontName.ALFA_Re, size: 25))
                                .foregroundColor(Color.dtnkLightBlue)
                            
                            DetailInfoButton(action: {
                                mainState.mode = .loserInfo
                            })
                        }
                        .padding(5)
                        
                        // Picker
                        Picker("Select Player", selection: $selectedLoserPlayerName) {
                            ForEach(allPlayers, id: \.self) { playerName in
                                Text(playerName)
                                    .tag(playerName)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .frame(width: 200)
                        
                    }
                }
                
            }
            .position(x: Constants.center, y:  geo.size.height * 0.45)
            
            // Button
            HStack(spacing: 20) {
                Button(action: {
                    mainState.mode = .history
                }) {
                    Btnwb(btnText: "History", btnTextSize: 20, btnWidth: 150, btnHeight: 40)
                }
                .buttonStyle(PressBtn())
                
                Button(action: {
                    mainState.mode = .middleResult
                }) {
                    Btnwb(btnText: "Result", btnTextSize: 20, btnWidth: 150, btnHeight: 40)
                }
                .buttonStyle(PressBtn())
                
                Button(action: {
                    MainController().setGame(winnerName: selectedWinnerPlayerName,
                                             loserName: selectedLoserPlayerName,
                                             upRate: mainState.upRate,
                                             desicionNum: mainState.desicionNum)
                }) {
                    Btnwb(btnText: "Set", btnTextSize: 20, btnWidth: 150, btnHeight: 40)
                }
                .buttonStyle(PressBtn())
                
                Button(action: {
                    mainState.mode = .endConfirm
                }) {
                    Btnwb(btnText: "End", btnTextSize: 20, btnWidth: 150, btnHeight: 40)
                }
                .buttonStyle(PressBtn())
            }
            .position(x: Constants.center, y:  geo.size.height * 0.75)
            
            // Detail Info
            if mainState.mode == .set {
                MainConfirmView()
                    .position(x: Constants.center, y:  geo.size.height * 0.45)
            } else if mainState.mode == .history {
                MainHistoryView()
                    .position(x: Constants.center, y:  geo.size.height * 0.45)
            } else if mainState.mode == .middleResult {
                MainResultView()
                    .position(x: Constants.center, y:  geo.size.height * 0.45)
            } else if mainState.mode != .base {
                MainModeView()
                    .position(x: Constants.center, y:  geo.size.height * 0.45)
            }
            
        }
    }
}
