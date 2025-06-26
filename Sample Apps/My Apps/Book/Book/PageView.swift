import SwiftUI

struct PageView: View {
    let pageNumber: Int
    let totalPages: Int

    var body: some View {
        VStack {
            Text("Ch1. Where to start?")
                .font(.caption)
                .fontDesign(.monospaced)
                .padding(.bottom)

            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor quam id massa faucibus dignissim. Nullam eget metus id nisl malesuada condimentum. Nam viverra fringilla erat, ut fermentum nunc feugiat eu. Quisque viverra elit eget eros faucibus dignissim. Nam viverra fringilla erat, ut fermentum nunc feugiat eu. Quisque viverra elit eget eros faucibus dignissim. Nam viverra fringilla erat, ut fermentum nunc feugiat eu. Quisque viverra elit eget eros faucibus dignissim. Nam viverra fringilla erat, ut fermentum nunc feugiat eu. Quisque viverra elit eget eros faucibus dignissim. Nam viverra fringilla erat, ut fermentum nunc feugiat eu. Quisque viverra elit eget eros faucibus dignissim. Nam viverra fringilla erat, ut fermentum nunc feugiat eu. Quisque viverra elit eget eros faucibus dignissim. Nam viverra fringilla erat, ut fermentum nunc feugiat eu. Quisque viverra elit eget eros faucibus dignissim. Nam viverra fringilla erat, ut fermentum nunc feugiat eu. Quisque viverra elit eget eros faucibus dignissim.")
                .padding()

            Spacer()

            Text("\(pageNumber) / \(totalPages)")
                .font(.footnote)
                .padding(.top)
        }
        .padding()
    }
}

#Preview {
    PageView(pageNumber: 4, totalPages: 10)
}
