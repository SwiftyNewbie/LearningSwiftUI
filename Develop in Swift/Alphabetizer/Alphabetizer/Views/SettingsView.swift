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
