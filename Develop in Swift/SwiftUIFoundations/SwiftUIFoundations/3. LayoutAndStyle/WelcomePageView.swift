import SwiftUI

struct WelcomePageView: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 32)
                    .frame(width: 150, height: 150)
                    .foregroundStyle(.tint)
                Image(systemName: "macpro.gen3")
                    .font(.system(size: 70))
                    .foregroundStyle(.white)
                
            }
            
            Text("Welcome to My App!")
                .font(.title)
                .fontWeight(.black)
                .fontDesign(.serif)
                .padding(.top)
            
            Text("This is my 2nd SwiftUI project")
                .font(.title3)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

#Preview {
    WelcomePageView()
}
