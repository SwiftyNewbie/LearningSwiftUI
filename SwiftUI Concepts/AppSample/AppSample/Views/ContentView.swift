import SwiftUI

struct ContentView: View {
    var body: some View {
        LazyHStack {
            Image(systemName: "globe")
                .imageScale(.small)
                .foregroundStyle(.teal)
            Text("Hello, your name!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
