

import SwiftUI

struct DetailInfoButton: View {
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(ImageName.Setting.question.rawValue)
                .resizable()
                .scaledToFit()
                .frame(width: 15)
                .offset(x: 3, y: -5)
        }
    }
}
