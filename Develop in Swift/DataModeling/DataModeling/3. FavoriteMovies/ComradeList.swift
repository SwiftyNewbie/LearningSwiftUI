import SwiftUI
import SwiftData

struct ComradeList: View {
    @Query(sort: \Comrade.name) private var comrades: [Comrade]
    @Environment(\.modelContext) private var context

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(comrades) { comrade in
                    NavigationLink(comrade.name) {
                        Text("Details for \(comrade.name)")
                            .navigationTitle("Comrade")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }
            }
            .navigationTitle("Comrades")
        } detail: {
            Text("Select a comrade")
                .navigationTitle("Comrade")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
