import SwiftUI

struct ContentView: View {
    let columnLayout = Array(repeating: GridItem(), count: 3)

    @State private var selectedColor = Color.gray

    let allColors: [Color] = [
        .pink,
        .red,
        .orange,
        .yellow,
        .green,
        .mint,
        .teal,
        .cyan,
        .blue,
        .indigo,
        .purple,
        .brown,
        .gray
    ]

    var body: some View {
        VStack {
            Text("Selected Color")
                .font(.body)
                .fontWeight(.semibold)
                .foregroundStyle(selectedColor)
                .padding(10)

            ScrollView {
                LazyVGrid(columns: columnLayout) {
                    ForEach(allColors, id: \.description) { color in
                        Button {
                            selectedColor = color
                        } label: {
                            RoundedRectangle(cornerRadius: 4.0)
                                .aspectRatio(1, contentMode: .fit)
                                .foregroundStyle(color)
                        }
                        .buttonStyle(.plain)
                    }

                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
