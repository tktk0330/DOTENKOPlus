/**
PageIDの画面
 
 */

import SwiftUI

struct PageContent: View {
    let id: PageId
    var body: some View {
        return Group {
            switch id {
            case .splash:
                SplashView()
            case .top:
                TopView()
            case .help:
                GameRuleView()
            case .setting:
                SettingView()
            case .main:
                MainView()
            case .finalresult:
                FinalResultView()
            }
        }
    }
}
