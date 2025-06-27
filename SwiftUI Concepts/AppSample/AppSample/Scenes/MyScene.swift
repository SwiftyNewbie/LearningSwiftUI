import SwiftUI

struct MyScene: Scene {
    var body: some Scene {
        WindowGroup { // WindowGroup scene contains the view hierarchy that TabView composes using other views
            TabView {
                Tab {
                    ContentView()
                } label: {
                    Label("Journal", systemImage: "book")
                }
                Tab {
                    SettingsView()
                } label: {
                    Label("Settings", systemImage: "gear")
                }
            }
        }
    }
}
