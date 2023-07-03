import SwiftUI

struct ArtifactList: View {
    @Binding var artifacts: [Any]
    @Binding var selectedArtifact: Int?
    var body: some View {
        ScrollView {
            Spacer()
            VStack(spacing: 10) {
                ForEach(artifacts.indices, id: \.self) { index in
                    if let artifactText = artifacts[index] as? String {
                        NavigationLink(destination: ConversationsPage(username: "TestUser", artifact: artifactText), tag: index, selection: $selectedArtifact) {
                            MessageBubble(text: artifactText)
                        }
                    } else if let artifactImage = artifacts[index] as? UIImage {
                        NavigationLink(destination: ConversationsPage(username: "TestUser", artifact: "Image \(index)"), tag: index, selection: $selectedArtifact) {
                            Image(uiImage: artifactImage)
                                .resizable()
                                .scaledToFit()
                        }
                    }
                }
            }
            .padding(.horizontal)
            Spacer()
        }
    }
}
