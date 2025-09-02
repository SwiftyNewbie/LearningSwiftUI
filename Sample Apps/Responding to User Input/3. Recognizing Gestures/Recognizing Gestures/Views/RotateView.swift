import SwiftUI

struct RotateView: View {
    @State private var rotation = Angle.zero

    var body: some View {
        VStack {
            Text("Use two fingers to rotate the box")
            Spacer()
            Rectangle()
                .foregroundColor(.red)
                .frame(width: 225, height: 225)
                .rotationEffect(rotation)
                .gesture(rotate)
            Spacer()
        }
        .navigationTitle("Rotate")
        .padding()
        .toolbar {
            Button("Reset") {
                rotation = .zero
            }
        }
    }

    var rotate: some Gesture {
        RotateGesture()
            .onChanged { angle in
                rotation = angle.rotation
            }
            .onEnded { angle in
                rotation = angle.rotation
            }
    }
}

#Preview {
    RotateView()
}
