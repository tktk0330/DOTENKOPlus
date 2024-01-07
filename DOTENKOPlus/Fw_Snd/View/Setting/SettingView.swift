


import SwiftUI

struct SettingView: View {
    
    @State private var initialRate = ""
    @State private var playerName = ""
    @State private var players: [String] = []
    @State private var playerObjects: [Player] = []
    @StateObject var settingState: SettingState = appState.setting
    
    var body: some View {
        GeometryReader { geo in
                        
            if settingState.mode == .base {
                BackButtonView(backPage: .top, geo: geo)
                    .position(x: Constants.scrWidth * 0.05, y:  geo.size.height * 0.15)
            }

            HStack(spacing: 5) {
                Text("Setting")
                DetailInfoButton(action: {
                    settingState.mode = .title
                })
            }
            .font(.custom(FontName.ALFA_Re, size: Constants.scrHeight * 0.15))
            .foregroundColor(Color.white)
            .padding(5)
            .position(x: Constants.center, y:  geo.size.height * 0.15)
            
            HStack(spacing: 30) {
                VStack(alignment: .leading) {
                    HStack() {
                        HStack(spacing: 0) {
                            Text("Rate")
                                .font(.custom(FontName.ALFA_Re, size: 25))
                                .foregroundColor(Color.white)
                            
                            DetailInfoButton(action: {
                                settingState.mode = .rateInfo
                            })
                        }
                        .padding(5)
                        .frame(width: geo.size.width * 0.17, alignment: .leading)
                        
                        TextField("Enter", text: $initialRate)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 180)
                    }
                    
                    HStack() {
                        HStack(spacing: 0) {
                            Text("Player")
                                .font(.custom(FontName.ALFA_Re, size: 25))
                                .foregroundColor(Color.white)
                            
                            DetailInfoButton(action: {
                                settingState.mode = .playerInfo
                            })
                        }
                        .padding(5)
                        .frame(width: geo.size.width * 0.17, alignment: .leading)
                        
                        TextField("Enter", text: $playerName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 180)
                        
                        Button(action: {
                            if !SettingController().checkName(newName: playerName, playerName: players).0 {
                                settingState.mode = .error
                                settingState.msg = SettingController().checkName(newName: playerName, playerName: players).1
                            } else {
                                // add player
                                addPlayer()
                            }
                        }) {
                            Image(ImageName.Setting.plus.rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                        }
                        .buttonStyle(PressBtn())
                    }
                }
                
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(players.reversed(), id: \.self) { player in
                            SetPlayersUnitView(name: player) {
                                self.players = self.deletePlayer(players: self.players, deletePlayer: player)
                            }
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        }
                    }
                }
                .frame(width: 300, height: 150)
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white, lineWidth: 5)
                )
                
            }
            .position(x: Constants.scrWidth * 0.40, y:  geo.size.height * 0.50)
            
            Button(action: {
                SettingController().tapStartButton(rate: initialRate, playerName: players)
            }) {
                Btnwb(btnText: "Start", btnTextSize: 30, btnWidth: 200, btnHeight: 50)
            }
            .buttonStyle(PressBtn())
            .position(x: Constants.scrWidth * 0.20, y:  geo.size.height * 0.75)
            
            if settingState.mode != .base {
                DetailInfoView()
                    .position(x: Constants.center, y:  geo.size.height * 0.45)
            }
        }
    }
    
    func addPlayer() {
        if !playerName.isEmpty {
            players.append(playerName)
            playerName = "" // Reset the input field
        }
    }
    
    func deletePlayer(players: [String], deletePlayer: String) -> [String] {
        return players.filter { $0 != deletePlayer }
    }
}


// addPlayerUnit
struct SetPlayersUnitView: View {
    
    let name: String
    let deleteAction: () -> Void
    
    var body: some View {
        HStack() {
            Text(name)
                .font(.custom(FontName.ALFA_Re, size: 25))
                .foregroundColor(Color.white)
            
            Spacer()
            
            Button(action: {
                // delete player
                deleteAction()
            }) {
                Image(ImageName.Setting.delete.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
            }
            .buttonStyle(PressBtn())
        }
    }
}
