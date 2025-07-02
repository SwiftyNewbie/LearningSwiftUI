import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            Tab {
                CategoryHome()
            } label: {
                Label("Featured", systemImage: "star")
            }

            Tab {
                LandmarkList()
            } label: {
                Label("List", systemImage: "list.bullet")
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
