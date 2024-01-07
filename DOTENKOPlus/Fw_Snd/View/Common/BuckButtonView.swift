


import SwiftUI

struct BackButtonView: View {
    
    var backPage: PageId
    var geo: GeometryProxy
    var keyboardHeight: CGFloat = 0
    
    var body: some View {
        ZStack{
            // back
            Button(action: {
                Router().pushBasePage(pageId: backPage)
                
            }) {
                Image(ImageName.Common.back.rawValue)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40)
            }
            .frame(maxHeight: 40)
        }
    }
}
