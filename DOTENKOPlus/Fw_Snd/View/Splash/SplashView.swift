/**
 SplashView
 */

import SwiftUI

struct SplashView: View {
    
    @StateObject var splash: SplashState = appState.splash
    
    init() {
        SplashController().initSplashState()
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {

                Text("DOTENKO")
                    .font(.custom(FontName.ALFA_Re, size: Constants.scrWidth * 0.15))
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .opacity(splash.alpha)
                    .position(x: Constants.center, y: geo.size.height * 0.50)
                
            }
            .onAppear {
                SplashController().onSplashAppear()
            }
        }
    }
}
