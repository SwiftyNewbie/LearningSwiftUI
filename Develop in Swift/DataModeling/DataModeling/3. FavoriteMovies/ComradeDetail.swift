import SwiftUI
import SwiftData

struct ComradeDetail: View {
    @Bindable var comrade: Comrade
    let isNew: Bool

    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context

    init(comrade: Comrade, isNew: Bool = false) {
        self.comrade = comrade
        self.isNew = isNew
    }

    var body: some View {
        Form {
            TextField("Name", text: $comrade.name)
                .autocorrectionDisabled()
        }
        .navigationTitle(isNew ? "New Comrade" : "Comrade")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if isNew {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        context.delete(comrade)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ComradeDetail(comrade: SampleData.shared.comrade)
    }
}

#Preview {
    NavigationStack {
        ComradeDetail(comrade: SampleData.shared.comrade, isNew: true)
    }
}
