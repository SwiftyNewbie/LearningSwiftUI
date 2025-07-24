import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var items: [Item]
    @Environment(\.modelContext) private var context

    @State private var newItem: String = ""

    var body: some View {
        NavigationStack {
            List(items) { item in
                Text(item.name)
                    .foregroundStyle(item.checked ? Color.secondary : .primary)
                    .strikethrough(item.checked, color: .secondary)
                    .onTapGesture {
                        item.checked.toggle()
                        do {
                            try context.save()
                        } catch {
                            print("Error saving: \(error)")
                        }
                    }
            }
            .navigationTitle("Groceries")
            .safeAreaInset(edge: .bottom) {
                HStack {
                    TextField("Add item", text: $newItem)
                        .textFieldStyle(.roundedBorder)

                    Button("Add", systemImage: "plus.circle") {
                        context.insert(Item(name: newItem, checked: false))
                        do {
                            try context.save()
                        } catch {
                            print("Error saving: \(error)")
                        }
                        newItem = ""
                    }
                    .labelStyle(.iconOnly)
                }
                .padding()
            }
            .toolbar {
                Button("Reset", systemImage: "trash") {
                    do {
                        try context.delete(model: Item.self, where: #Predicate { _ in true })
                        try context.save()
                    } catch {
                        print("Error saving: \(error)")
                    }
                }
            }
        }
    }
}


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
