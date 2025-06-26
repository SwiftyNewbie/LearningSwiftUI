import SwiftUI


struct FunFactsView: View {
    @State private var funFact = ""

    var body: some View {
        VStack {
            Text("Fun Facts")
                .font(.largeTitle)
                .fontWeight(.black)

            Text(funFact)
                .padding()
                .font(.title)
                .frame(minHeight: 400)

            Button("Show Random Fact") {
                funFact = information.funFacts.randomElement()!
            }
            .padding()
            .background(.cyan)
            .foregroundStyle(.background)
            .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    FunFactsView()
}
