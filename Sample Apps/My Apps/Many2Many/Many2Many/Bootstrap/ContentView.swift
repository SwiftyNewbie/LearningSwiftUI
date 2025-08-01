import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Movies", systemImage: "movieclapper") {
                MovieList()
            }
            Tab("Crew", systemImage: "person.3") {
                CrewMemberList()
            }
        }
    }
}

#Preview {
    ContentView()
}
