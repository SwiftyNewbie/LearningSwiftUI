import SwiftUI

struct ComradeDetail: View {
    @Bindable var comrade: Comrade

    var body: some View {
        Form {
            TextField("Name", text: $comrade.name)
                .autocorrectionDisabled()
        }
        .navigationTitle("Comrade")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ComradeDetail(comrade: SampleData.shared.comrade)
    }
}
