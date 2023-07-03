import SwiftUI
import URLImage

struct ConversationList: View {
    @Binding var chats: [String]
    @Binding var searchText: String
    
    var body: some View {
        List(chats.filter({ searchText.isEmpty ? true : $0.localizedCaseInsensitiveContains(searchText) }), id: \.self) { chat in
            NavigationLink(destination: ChatPage()) {
                HStack {
                    URLImage( URL(string: "https://picsum.photos/50/50")!) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                    VStack(alignment: .leading) {
                        Text(chat)
                            .font(.headline)
                        Text("Message preview")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer().frame(maxWidth: .infinity)
                    ZStack {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 20, height: 20)
                        Text("2")
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                    .opacity(0.5)
                    .padding(.trailing, 10)
                    .hidden()
                }
            }
        }
        
    }
}
