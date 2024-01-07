


import SwiftUI

class SettingState: ObservableObject {
    
    @Published var mode: SettingMode = .base
    @Published var msg: [String] = []
    
    init(mode: SettingMode = .base) {
        self.mode = mode
    }
}

enum SettingMode: Int {
    case base = 0
    case title = 1
    case rateInfo = 2
    case playerInfo = 3
    case error = 99
}
