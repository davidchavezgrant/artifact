import SwiftUI

struct SendButton: View {
    var onClick: () -> Void
    var body: some View {
        Button(action: onClick) {
            Text("Send")
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(Color.blue)
                .cornerRadius(20)
        }
        .padding(.top)
        .background(Color(UIColor.systemGray6))
    }
}
