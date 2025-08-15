import SwiftUI

struct SettingsView: View {
    @Environment(Alphabetizer.self) private var alphabetizer
    @Environment(\.dismiss) private var dissmis

    var body: some View {
        @Bindable var alphabetizer = alphabetizer
        NavigationStack {
            Form {
                Toggle("HARD MODE", isOn: $alphabetizer.hardMode)
                Toggle("Hide words", isOn: $alphabetizer.hideWords)
                Group {
                    VStack(alignment: .leading, spacing: 0) {
                        Toggle("Mastery Mode", isOn: $alphabetizer.masteryMode)
                        Text("Three consecutive wins completes a vocabulary set")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dissmis()
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    SettingsView()
}
