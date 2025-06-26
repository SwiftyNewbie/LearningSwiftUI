import SwiftUI

struct ContentView: View {
    @State private var speed: Double = 5

    var body: some View {
        VStack {
            Text("Speedy")
                .font(.largeTitle
                    .lowercaseSmallCaps()
                    .monospaced()
                )

            VStack {
                SpeedView(value: $speed, units: "km/h", showButton: true, transform: { $0 })

                Image(systemName: "arrowshape.down.fill")
                    .resizable()
                    .frame(width: 64, height: 64)

                SpeedView(value: $speed, units: "min/km", showButton: false, transform: { 60 / $0 })
            }
            .frame(maxHeight: .infinity)
        }
        .padding()
    }
}

struct SpeedView: View {
    @Binding var value: Double
    let units: String
    let showButton: Bool
    let transform: (Double) -> Double

    var body: some View {
        VStack {
            HStack {
                if showButton {
                    Button("Slower", systemImage: "minus.circle.fill") {
                        withAnimation {
                            value -= 0.5
                        }
                    }
                    .font(.largeTitle)
                }

                Text(String(format: "%.1f", transform(value)))
                    .font(.system(size: 72))
                    .padding()
                    .background(Color.orange, in: RoundedRectangle(cornerRadius: 16))
                    .frame(width: 248)

                if showButton {
                    Button("Faster", systemImage: "plus.circle.fill") {
                        withAnimation {
                            value += 0.5
                        }
                    }
                    .font(.largeTitle)
                }
            }
            Text(units)
        }
        .padding()
        .symbolRenderingMode(.hierarchical)
        .labelStyle(.iconOnly)
    }
}

#Preview {
    ContentView()
}
