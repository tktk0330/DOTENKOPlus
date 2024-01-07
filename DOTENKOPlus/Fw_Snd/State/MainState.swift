


import SwiftUI

class MainState: ObservableObject {
    
    @Published var mode: MainMode = .base
    @Published var initialRate:  Int = 0
    @Published var players: [Player] = []
    
    @Published var upRate:  String = ""
    @Published var desicionNum:  String = ""
    @Published var gameNum:  Int = 1
    
    @Published var winner:  [Player] = []
    @Published var loser:  [Player] = []
    @Published var winnerName:  String = ""
    @Published var loserName:  String = ""
    
    @Published var gameUnitScore:  Int = 0
    @Published var histories: [History] = []
    
    @Published var msg: [String] = []
    
    
    // リセットメソッドを追加
    func resetState() {
        mode = .base
        initialRate = 0
        players = []
        upRate = ""
        desicionNum = ""
        gameNum = 1
        winner = []
        loser = []
        gameUnitScore = 0
        histories = []
        msg = []
    }

}

enum MainMode: Int {
    case base = 0
    case title = 1
    case upRateInfo = 2
    case desicionNumInfo = 3
    case winnerInfo = 4
    case loserInfo = 5
    case history = 6
    case middleResult = 7
    case set = 8
    case endConfirm = 9
    case error = 99
}
