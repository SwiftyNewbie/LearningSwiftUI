import SwiftUI

struct ContentView: View {
    let keywords: [String] = ["chives", "fern-leaf lavender"]

    var body: some View {
        LazyVStack {
            ForEach(keywords, id: \.self) { keyword in
                KeywordBubbleDefaultPadding(keyword: keyword, symbol: "leaf")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
