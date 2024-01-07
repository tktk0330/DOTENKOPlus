


import Foundation

struct SettingController {
    
    func tapStartButton(rate: String, playerName: [String]) {
        
        if !checkInput(rate: rate, playerName: playerName).0 {
            appState.setting.mode = .error
            appState.setting.msg = checkInput(rate: rate, playerName: playerName).1
        } else {
            appState.setting.mode = .base
            appState.main.players = convertToPlayerObjects(players: playerName)
            appState.main.initialRate = Int(rate)!
            CommonFunction().nextPage(page: .main)
        }
    }
    
    func checkInput(rate: String, playerName: [String]) -> (Bool, [String]) {
        var result = true
        var message: [String] = []
        // rate: exist
        if (rate == "") {
            result = false
            message.append("Rateを入力してください")
        } else if Int(rate) == nil {
            result = false
            message.append("Rateは数字を入力してください")
        }
        // player: over 2 player
        if (playerName.count < 2) {
            result = false
            message.append("Playerは2人以上登録してくだい")
        }
        
        return (result, message)
    }
    
    func convertToPlayerObjects(players: [String]) -> [Player] {
        var playerObjects: [Player] = []
        
        playerObjects = players.enumerated().map { index, name in
            Player(side: index, name: name)
        }
        // 結果を確認するための出力
        for player in playerObjects {
            print("Player: \(player.name), Side: \(player.side)")
        }
        return playerObjects
    }
    
    func checkName(newName: String, playerName: [String]) -> (Bool, [String]) {
        var result = true
        var message: [String] = []

        if newName.count > 10 {
            result = false
            message.append("10文字以下で入力してください")
        } else if playerName.contains(newName) {
            result = false
            message.append("既に存在します")
        }
        if newName == "ALL" {
            result = false
            message.append("その名前は登録できません")
        }
        
        return (result, message)
    }
}
    
