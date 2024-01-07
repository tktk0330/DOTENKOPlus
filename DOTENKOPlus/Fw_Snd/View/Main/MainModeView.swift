


import SwiftUI

struct MainModeView: View {
    
    @StateObject var mainState: MainState = appState.main
    
    private var textProvider: MainDetailInfoMaster {
        MainDetailInfoMaster(mainState: mainState)
    }
    
    var body: some View {
        ZStack() {
            VStack(spacing: 20) {
                // title
                Text(textProvider.title)
                    .font(.custom(FontName.MP_Bl, size: 25))
                    .foregroundColor(Color.white)
                
                // detail
                Text(textProvider.detail)
                    .font(.custom(FontName.MP_Bl, size: 15))
                    .foregroundColor(Color.white)
                
                VStack {
                    ForEach(mainState.msg, id: \.self) { message in
                        Text(message)
                            .font(.custom(FontName.MP_Bl, size: 15))
                            .foregroundColor(Color.red)
                    }
                }
                
                HStack(spacing: 20) {
                    Button(action: {
                        mainState.mode = .base
                        mainState.msg = []
                    }) {
                        Btnwb(btnText: "Back", btnTextSize: 25, btnWidth: 150, btnHeight: 40, btnColor: Color.black.opacity(0.85))
                    }
                    .buttonStyle(PressBtn())
                    
                    if mainState.mode == .endConfirm {
                        Button(action: {
                            mainState.mode = .base
                            mainState.msg = []
                            MainController().tapEndButton()
                        }) {
                            Btnwb(btnText: "End", btnTextSize: 25, btnWidth: 150, btnHeight: 40, btnColor: Color.black.opacity(0.85))
                        }
                        .buttonStyle(PressBtn())
                    }
                }
            }
            .frame(width: 400, height: 280)
            .background(Color.black.opacity(0.85))
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 3)
            )
        }
    }
}
