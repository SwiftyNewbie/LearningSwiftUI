import SwiftUI

struct DetailView: View {
    let item: Item

    var body: some View {
        AsyncImage(url: item.url) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    if let url = Bundle.main.url(forResource: "mushy1", withExtension: "jpg") {
        DetailView(item: Item(url: url))
    }
}

