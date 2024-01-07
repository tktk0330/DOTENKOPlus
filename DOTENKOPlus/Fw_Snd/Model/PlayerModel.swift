


class Player: Identifiable, Hashable {
    
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    var side: Int
    var name: String
    var score = 0
    var rank = 0
    
    init(side: Int, name: String) {
        self.side = side
        self.name = name
    }
}

