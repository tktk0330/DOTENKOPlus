//
//  DOTENKOPlusApp.swift
//  DOTENKOPlus
//
//  Created by Takuma Shinoda on 2023/12/10.
//

import SwiftUI

@main
struct DOTENKOPlusApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var networkMng = NetworkManager()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                NaviWindow(state: appState.routing.baseNaviState)
                    .environmentObject(networkMng)
                // admob
                BunnerView()
            }
            .background(Color.casinoGreen.ignoresSafeArea())
        }
    }
    
}
