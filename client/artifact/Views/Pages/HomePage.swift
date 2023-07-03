import SwiftUI

struct HomePage: View {
    @State private var artifacts: [Any] = ["Artifact 1",
                                           "Artifact 2",
                                           "Artifact 3",
                                           "Artifact 4",
                                           "Artifact 5",
                                           "Artifact 6",
                                           "Artifact 7",
                                           "Artifact 8",
                                           "Artifact 9",
                                           "Artifact 10"]
    
    @State private var selectedArtifact: Int? = nil
    @State var messageText: String
    
    func sendMessage() {
        if !messageText.isEmpty {
            artifacts.append(messageText)
            messageText = ""
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ArtifactList(artifacts:        self.$artifacts,
                             selectedArtifact: self.$selectedArtifact)
                
                InputBar(artifacts:   self.$artifacts,
                         messageText: self.$messageText,
                         sendMessage: self.sendMessage)
                
            }
            .navigationBarTitle("Artifacts")
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage(messageText: "")
    }
}
