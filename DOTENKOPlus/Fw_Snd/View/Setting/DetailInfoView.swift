


import SwiftUI

struct DetailInfoView: View {
    
    @StateObject var settingState: SettingState = appState.setting
    
    private var textProvider: DetailInfoMaster {
        DetailInfoMaster(settingState: settingState)
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
                    ForEach(settingState.msg, id: \.self) { message in
                        Text(message)
                            .font(.custom(FontName.MP_Bl, size: 15))
                            .foregroundColor(Color.red)
                    }
                }
                
                Button(action: {
                    settingState.mode = .base
                    settingState.msg = []
                }) {
                    Btnwb(btnText: "Back", btnTextSize: 20, btnWidth: 120, btnHeight: 30, btnColor: Color.black.opacity(0.85))
                }
                .buttonStyle(PressBtn())
                
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
