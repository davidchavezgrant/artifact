import SwiftUI

struct MessageBubble : View {
    let text: String
    
    var body: some View {
        HStack {
            Text(text)
                .padding()
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(20)
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}
