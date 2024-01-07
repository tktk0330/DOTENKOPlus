


import SwiftUI

struct TopView: View {
    var body: some View {
        GeometryReader { geo in

            Text("DOTENKO Plus")
                .font(.custom(FontName.ALFA_Re, size: Constants.scrHeight * 0.15))
                .foregroundColor(Color.white)
                .fontWeight(.bold)
                .padding(5)
                .position(x: Constants.center, y:  geo.size.height * 0.20)

            HStack(spacing: 75) {
                Image(ImageName.Top.topIcon.rawValue)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                
                
                VStack(alignment: .trailing, spacing: 30) {
                    Button(action: {
                        // Home画面へ
                        CommonFunction().nextPage(page: .setting)
                    }) {
                        Btnwb(btnText: "Tap", btnTextSize: 30, btnWidth: 200, btnHeight: 50)
                    }
                    .buttonStyle(PressBtn())
                    
                    Button(action: {
                        // TODO: Hepl作成
                    }) {
                        Btnwb(btnText: "Help", btnTextSize: 20, btnWidth: 150, btnHeight: 30)
                    }
                    .buttonStyle(PressBtn())


                }
            }
            .position(x: Constants.center, y:  geo.size.height * 0.60)

        }
    }
}
