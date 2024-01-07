


import SwiftUI

struct NaviWindow: View {
    @StateObject var state: NaviState
    
    var body: some View {
        return Group {
            if let latestPageId = state.stack.last {
                
                PageContent(id: latestPageId)
                
            } else {

            }
        }
    }
}
