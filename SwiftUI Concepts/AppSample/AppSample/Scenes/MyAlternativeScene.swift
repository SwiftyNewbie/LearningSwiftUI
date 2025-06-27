import SwiftUI

struct MyAlternativeScene: Scene {
    var body: some Scene {
        WindowGroup {
            RecipeListView()
        }
        #if os(macOS)
        Settings {
            SettingsView()
        }
        #endif
    }
}
