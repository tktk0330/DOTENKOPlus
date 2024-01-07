


import SwiftUI

struct CommonFunction {
    
    func nextPage(page: PageId) {
        Router().pushBasePage(pageId: page)
    }
}
