import SwiftUI

struct AttachmentBubble: View {
    var body: some View {
        HStack {
            Image(systemName: "paperclip")
                .padding()
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(20)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
