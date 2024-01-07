


import SwiftUI

let appState: AppState = AppState()

final class AppState {
    
    // ページ遷移
    var routing: RoutingState
    // ローディング
    var loading: LoadingState
    // スプラッシュ
    var splash: SplashState!
    // Setting
    var setting: SettingState
    // Main
    var main: MainState
    // Result
    var result: FinalResultState
    
    init(
        pageRoute: RoutingState,
        loading: LoadingState,
        splash: SplashState?,
        setting: SettingState,
        main: MainState,
        result: FinalResultState
    ) {
        self.routing = pageRoute
        self.loading = loading
        self.splash = splash
        self.setting = setting
        self.main = main
        self.result = result
    }
    init() {
        self.routing = RoutingState()
        self.loading = LoadingState()
        self.splash = SplashState()
        self.setting = SettingState()
        self.main = MainState()
        self.result = FinalResultState()
    }
}
