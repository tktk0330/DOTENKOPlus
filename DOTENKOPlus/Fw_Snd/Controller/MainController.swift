


import Foundation

struct MainController {
        
    
    func tapEndButton() {
        appState.result.totalGame = appState.main.gameNum
        appState.result.players = appState.main.players
        CommonFunction().nextPage(page: .finalresult)
        // リセット
        appState.main.resetState()
    }
    
    func updatePlayerScore(score: Int) {
        for winner in appState.main.winner {
            if let index = appState.main.players.firstIndex(of: winner) {
                appState.main.players[index].score += score * appState.main.loser.count
            }
        }
        for loser in appState.main.loser {
            if let index = appState.main.players.firstIndex(of: loser) {
                appState.main.players[index].score += -score * appState.main.winner.count
            }
        }
    }
    
    func updateRunk() {
        // スコアに基づいてプレイヤーを降順にソート
        let sortedPlayers = appState.main.players.sorted { $0.score > $1.score }

        var lastScore: Int?
        var currentRank = 0

        for player in sortedPlayers {
            // スコアが前のプレイヤーと異なる場合、ランクをインクリメント
            if lastScore != player.score {
                currentRank += 1
                lastScore = player.score
            }
            // 現在のランクをプレイヤーに割り当て
            player.rank = currentRank
        }
    }
    
    func updateHistory() {
        let gameNumber = Int(appState.main.gameNum)
        let winnerName = appState.main.winnerName
        let loserName = appState.main.loserName
        let score = appState.main.gameUnitScore
        let newHistory = History(gameNumber: gameNumber, winnerName: winnerName, loserName: loserName, score: score)
        appState.main.histories.append(newHistory)
    }

    func moveNextGame() {
        // caluculate
        updatePlayerScore(score: appState.main.gameUnitScore)
        // updaterunk
        updateRunk()
        // set history
        updateHistory()
        // game +1
        appState.main.gameNum += 1
        // move
        appState.main.mode = .base
        // reset
        appState.main.upRate = ""
        appState.main.desicionNum = ""
        appState.main.gameUnitScore = 0
        appState.main.winner.removeAll()
        appState.main.loser.removeAll()
    }
    
    // caluculate
    func setGame(winnerName: String, loserName: String, upRate: String, desicionNum: String) {
        
        if !checkInput(upRate: upRate, desicionNum: desicionNum, selectedWinnerPlayerName: winnerName, selectedLoserPlayerName: loserName).0 {
            appState.main.msg = checkInput(upRate: upRate, desicionNum: desicionNum, selectedWinnerPlayerName: winnerName, selectedLoserPlayerName: loserName).1
            appState.main.mode = .error

        } else {
            // caluculate
            let gameScore = appState.main.initialRate * Int(upRate)! * Int(desicionNum)!
            appState.main.gameUnitScore = gameScore
            appState.main.winnerName = winnerName
            appState.main.loserName = loserName

            if winnerName == "ALL" {
                // If the winner is "ALL", add all players except the loser to the winner array
                let loserIndex = findPlayerIndex(by: loserName)
                for (index, player) in appState.main.players.enumerated() {
                    if index != loserIndex {
                        appState.main.winner.append(player)
                    } else {
                        appState.main.loser.append(player)
                    }
                }
            } else if loserName == "ALL" {
                // If the loser is "ALL", add all players except the winner to the loser array
                let winnerIndex = findPlayerIndex(by: winnerName)
                for (index, player) in appState.main.players.enumerated() {
                    if index != winnerIndex {
                        appState.main.loser.append(player)
                    } else {
                        appState.main.winner.append(player)
                    }
                }
            } else {
                // Normal case, add the selected winner and loser
                let winnerIndex = findPlayerIndex(by: winnerName)
                let loserIndex = findPlayerIndex(by: loserName)
                appState.main.winner.append(appState.main.players[winnerIndex])
                appState.main.loser.append(appState.main.players[loserIndex])
            }
            // set
            appState.main.mode = .set
        }
    }
    
    // search index
    func findPlayerIndex(by name: String) -> Int {
        appState.main.players.firstIndex(where: { $0.name == name })!
    }
    
    func checkInput(upRate: String, desicionNum: String, selectedWinnerPlayerName: String, selectedLoserPlayerName: String) -> (Bool, [String]) {
        var result = true
        var message: [String] = []

        if (upRate == "") {
            result = false
            message.append("上昇Rateを入力してください")
        } else if Int(upRate) == nil {
            result = false
            message.append("上昇Rateは数字を入力してください")
        }
        
        if (desicionNum == "") {
            result = false
            message.append("最終数字を入力してください")
        } else if Int(desicionNum) == nil {
            result = false
            message.append("最終数字は数字を入力してください")
        }

        if selectedWinnerPlayerName == selectedLoserPlayerName {
            result = false
            message.append("WinnerとLoserが同一です")
        }
        
        return (result, message)
    }

    
}
