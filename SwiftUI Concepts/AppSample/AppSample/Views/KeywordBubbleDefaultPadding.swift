import SwiftUI

struct KeywordBubbleDefaultPadding: View {
    let keyword: String
    let symbol: String

    @ScaledMetric(relativeTo: .title) var paddingWidth: CGFloat = 14.5
    var body: some View {
        Label(keyword, systemImage: symbol)
            .font(.title)
            .foregroundStyle(.white)
            .border(.white)
            .padding(paddingWidth)
            .background(.purple.opacity(0.75), in: .capsule)
    }
}
