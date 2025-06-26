import SwiftUI

@main
struct BookApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                CoverView()
                ForEach(1..<11) { pageNumber in
                    PageView(pageNumber: pageNumber, totalPages: 10)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .background(Color.bookPageBackground)
        }
    }
}
