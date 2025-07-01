import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HikeView(hike: ModelData().hikes[0])
                .padding()
            Spacer()
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
