import SwiftUI
import URLImage

struct ConversationsPage: View {
    let username: String
    let artifact: String
    @State var chats = ["Alice", "Bob", "Charlie", "David", "Eve", "Frank", "Grace", "Heidi", "Ivan", "Judy", "Mallory", "Oscar", "Peggy", "Rupert", "Sybil", "Trudy", "Victor", "Walter", "Wendy", "Zoe", "Zach", "Zelda", "Zed", "Zeb"]
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text(artifact)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                SearchBar(text: $searchText)
                    .padding(.horizontal)

                ConversationList(chats: $chats, searchText: $searchText)
                .listStyle(PlainListStyle())
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}
