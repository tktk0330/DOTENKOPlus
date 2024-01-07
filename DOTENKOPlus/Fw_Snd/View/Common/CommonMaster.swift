

// Setting Master
struct DetailInfoMaster {
    var settingState: SettingState

    var title: String {
        switch settingState.mode {
        case .title:
            return "Setting"
        case .rateInfo:
            return "Rate"
        case .playerInfo:
            return "Player"
        default:
            return ""
        }
    }

    var detail: String {
        switch settingState.mode {
        case .title:
            return """
            ゲームの設定をします
            初期レートの入力をしてください
            Playerの名前を入力してください
            「＋」ボタンを押すと登録できます
            「ー」ボタンを押すと削除されます
            """
        case .rateInfo:
            return """
            初期レートの入力をしてください。
            （例：1, 5, 10, 100）
            ※ 大きすぎると表示できない場合があります
            """
        case .playerInfo:
            return """
            Playerの名前を入力してください
            ・　2人以上登録してください
            ・　同じ名前は設定できません
            ・　10文字以下で登録してください
            「＋」ボタンを押すと登録できます
            「ー」ボタンを押すと削除されます
            """
        default:
            return ""
        }
    }
}

// Main Master
struct MainDetailInfoMaster {
    var mainState: MainState

    var title: String {
        switch mainState.mode {
        case .title:
            return "Game"
        case .upRateInfo:
            return "上昇Rate"
        case .desicionNumInfo:
            return "最終数字"
        case .winnerInfo:
            return "Winner"
        case .loserInfo:
            return "Loser"
        case .endConfirm:
            return ""
        default:
            return ""
        }
    }

    var detail: String {
        switch mainState.mode {
        case .title:
            return """
            ゲーム情報を入力してください
            Historyでは戦歴を見れます
            Resultでは現在の順位を見れます
            Setでゲームの入力確認ができます
            Endでゲームを終了します
            """
        case .upRateInfo:
            return """
            ゲーム中に上がったレートを入力してください
            （例：2, 4, 8...）
            """
        case .desicionNumInfo:
            return """
            山札裏の数字を入力してください
            ・特殊カード（1, 2, jorker）は上昇レートとしてください
            ・♦️3は30として扱えます
            """
        case .winnerInfo:
            return """
            勝者を選択してください
            「ALL」を選択した場合、敗者以外の人が勝者となります
            （例：SHOTENKO/しょてんこ、バースト等の場合など）
            """
        case .loserInfo:
            return """
            敗者を選択してください
            「ALL」を選択した場合、勝者以外の人が敗者となります
            （例：SHOTENKO/しょてんこ、バースト等の場合など）
            """
        case .endConfirm:
            return """
            Gameを終了しますか？
            """
        default:
            return ""
        }
    }
}

