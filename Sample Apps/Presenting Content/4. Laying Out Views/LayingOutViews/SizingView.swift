import SwiftUI

struct SizingView: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.darkBrown)
                    .frame(maxWidth: 200, maxHeight: 150)
                VStack {
                    Text("Roses are red,")
                    Image("Rose")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 50)
                        .foregroundStyle(.themeRed)
                    Text("violets are blue,")
                }
            }

            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.darkBrown)
                    .frame(maxWidth: 200, maxHeight: 150)
                VStack {
                    Text("I just wait")
                    Text("when darkness will come after you")

                }
            }
        }
        .font(.headline)
        .foregroundStyle(.paleOrange)
    }
}

#Preview {
    SizingView()
}
