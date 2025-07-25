import SwiftUI

struct StoryPageView: View {
    var story: Story
    var pageIndex: Int

    var body: some View {
        VStack {
            ScrollView {
                Text(story[pageIndex].text)

                ForEach(story[pageIndex].choices, id: \.text) { choice in
                    NavigationLink(destination: StoryPageView(story: story, pageIndex: choice.destination)) {
                        Text(choice.text)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(.gray.opacity(0.25))
                            .clipShape(.capsule)
                    }
                }
            }
        }
        .padding()
        .navigationTitle("Page \(pageIndex + 1)")
        .navigationBarTitleDisplayMode(.inline)
    }
}
