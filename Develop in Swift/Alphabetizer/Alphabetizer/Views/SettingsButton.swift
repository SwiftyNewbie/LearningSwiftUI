import SwiftUI

struct SettingsButton: View {
    @Environment(Alphabetizer.self) private var alphabetizer
    @Binding var triggered: Bool

    var body: some View {
        Button {
            triggered.toggle()
        } label: {
            Image(systemName: "gear.circle")
                .font(.system(size: 50))
                .foregroundStyle(Color.white)
                .padding(.horizontal, 8)
                .padding(.vertical, 8)
                .background(RoundedRectangle(cornerRadius: 16)
                    .fill(Color.teal)
                    .opacity(isEnabled ? 1.0 : 0.5)
                )
        }
        .animation(.default, value: isEnabled)
        .disabled(!isEnabled)
    }

    var isEnabled: Bool {
        alphabetizer.message == .instructions
    }
}

#Preview {
    SettingsButton(triggered: .constant(true))
        .environment(Alphabetizer())
}
