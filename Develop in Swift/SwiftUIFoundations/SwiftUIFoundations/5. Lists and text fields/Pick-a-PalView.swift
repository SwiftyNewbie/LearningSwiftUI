import SwiftUI
import SwiftData

struct PickAPalView: View {
    @Query private var pals: [Pal]
    @Environment(\.modelContext) private var context


    @State private var nameToAdd = ""
    @State private var pickedName = ""
    @State private var shouldRemovePickedName = false

    var body: some View {
        VStack {
            VStack(spacing: 8) {
                Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical)
                Text("Pick-a-Pal")
            }
            .font(.title)
            .bold()

            Text(pickedName.isEmpty ? " " : pickedName)
                .font(.title2)
                .bold()
                .foregroundStyle(.tint)

            List() {
                ForEach(pals) { pal in
                    Text(pal.name)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))

            TextField("Add a name...", text: $nameToAdd)
                .autocorrectionDisabled()
                .onSubmit {
                    if !nameToAdd.isEmpty {
                        context.insert(Pal(name: nameToAdd))
                        nameToAdd = ""
                    }
                }

            Divider()

            Toggle("Remove when picked", isOn: $shouldRemovePickedName)

            Button {
                if let randomPal = pals.randomElement() {
                    pickedName = randomPal.name

                    if shouldRemovePickedName {
                        context.delete(randomPal)
                        do {
                            try context.save()
                        } catch {
                            print("Error saving context: \(error)")
                        }
                    }
                } else {
                    pickedName = ""
                }
            } label: {
                Text("Pick Random Name")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    PickAPalView()
        .modelContainer(for: Pal.self, inMemory: true)
}

@Model class Pal {
    var name: String

    init(name: String) {
        self.name = name
    }
}
