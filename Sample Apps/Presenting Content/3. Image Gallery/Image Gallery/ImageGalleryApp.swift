import SwiftUI

@main
struct ImageGalleryApp: App {
    @StateObject var dataModel = DataModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                GridView()
            }
            .environmentObject(dataModel)
        }
    }
}
