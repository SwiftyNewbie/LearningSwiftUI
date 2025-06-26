import SwiftUI

struct AboutMeView: View {
    var body: some View {
        TabView {
            Tab {
                HomeView()
            } label: {
                Label("Home", systemImage: "person")
            }
            Tab {
                StoryView()
            } label: {
                Label("Story", systemImage: "book")
            }
            Tab {
                FavoritesView()
            } label: {
                Label("Favorites", systemImage: "star")
            }
            Tab {
                FunFactsView()
            } label: {
                Label("Fun Facts", systemImage: "hand.thumbsup")
            }
        }
    }
}

#Preview {
    AboutMeView()
}
