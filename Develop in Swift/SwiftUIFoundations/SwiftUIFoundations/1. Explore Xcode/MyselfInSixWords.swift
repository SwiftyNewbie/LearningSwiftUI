import SwiftUI

struct MyselfInSixWords: View {
    var body: some View {
        LazyVStack {
            HStack {
                Text("junior")
                    .padding(2)
                    .background(Color.gray)
                Text("superficial")
                    .padding(2)
                    .background(Color.green)
                Text("old")
                    .padding(2)
                    .background(Color.yellow)
            }
            HStack {
                Text("unclaimed")
                    .padding(2)
                    .background(Color.red)
                Text("outdated")
                    .padding(2)
                    .background(Color.teal)
                Text("not valuable")
                    .padding(2)
                    .background(Color.purple)
            }
        }
    }
}

#Preview {
    MyselfInSixWords()
}
