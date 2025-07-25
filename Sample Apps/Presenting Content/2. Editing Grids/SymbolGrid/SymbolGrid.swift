import SwiftUI

struct SymbolGrid: View {
    @State private var isAddingSymbol = false
    @State private var isEditing = false

    private static let initialColumns = 3
    @State private var selectedSymbol: Symbol?
    @State private var numColumns = initialColumns
    @State private var gridColumnts = Array(repeating: GridItem(.flexible()), count: initialColumns)

    @State private var symbols = [
        Symbol(name: "tshirt"),
        Symbol(name: "eyes"),
        Symbol(name: "eyebrow"),
        Symbol(name: "nose"),
        Symbol(name: "mustache"),
        Symbol(name: "mouth"),
        Symbol(name: "eyeglasses"),
        Symbol(name: "facemask"),
        Symbol(name: "brain.head.profile"),
        Symbol(name: "brain"),
        Symbol(name: "icloud"),
        Symbol(name: "theatermasks.fill"),
    ]

    var columnsText: String {
        numColumns > 1 ? "\(numColumns) Columns" : "1 Column"
    }

    var body: some View {
        VStack {
            if isEditing {
                Stepper(value: $numColumns, in: 1...6, step: 1) { } onEditingChanged: { _ in
                    withAnimation {
                        gridColumnts = Array(repeating: GridItem(.flexible()), count: numColumns)
                    }
                }
                .padding()
            }

            ScrollView {
                LazyVGrid(columns: gridColumnts) {
                    ForEach(symbols) { symbol in
                        NavigationLink(destination: SymbolDetail(symbol: symbol)) {
                            ZStack(alignment: .topTrailing) {
                                Image(systemName: symbol.name)
                                    .resizable()
                                    .scaledToFit()
                                    .symbolRenderingMode(.hierarchical)
                                    .foregroundColor(.accentColor)
                                    .ignoresSafeArea(.container, edges: .bottom)

                                if isEditing {
                                    Button {
                                        guard let index = symbols.firstIndex(of: symbol) else { return }
                                        withAnimation {
                                            _ = symbols.remove(at: index)
                                        }
                                    } label: {
                                        Image(systemName: "xmark.square.fill")
                                                                                            .font(.title)
                                                                                            .symbolRenderingMode(.palette)
                                                                                            .foregroundStyle(.white, Color.red)
                                    }
                                    .offset(x: 7, y: -7)
                                }
                            }
                        }
                        .padding()
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .navigationTitle("My Symbols")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $isAddingSymbol, onDismiss: addSymbol) {
            SymbolPicker(symbol: $selectedSymbol)
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(isEditing ? "Done" : "Edit") {
                    withAnimation {
                        isEditing.toggle()
                    }
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    isAddingSymbol = true
                } label: {
                    Image(systemName: "plus")
                }
                .disabled(isEditing)
            }
        }
    }

    func addSymbol() {
        guard let name = selectedSymbol else { return }
        withAnimation {
            symbols.insert(name, at: 0)
        }
    }
}

#Preview {
    NavigationStack {
        SymbolGrid()
    }
}
