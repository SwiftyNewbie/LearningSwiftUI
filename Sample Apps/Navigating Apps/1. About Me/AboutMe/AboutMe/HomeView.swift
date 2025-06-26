import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("All About")
                .font(.largeTitle)
                .fontWeight(.black)
                .padding(12)
            Image(information.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(50)
                .padding(12)
            Text(information.name)
                .font(.title)
        }
    }
}

#Preview {
    HomeView()
}
