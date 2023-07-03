import SwiftUI

struct InputBar: View {
    @State private var isImagePickerDisplayed = false
    @Binding var artifacts: [Any]
    @Binding var messageText: String
    var sendMessage: () -> Void
    func addMedia() {
        self.isImagePickerDisplayed = true
    }
    
    var body: some View {
        HStack {
            AddButton(onClick: self.addMedia)
                .sheet(isPresented: $isImagePickerDisplayed) {
                    ImagePickerView { selectedImage in
                        if let selectedImage = selectedImage {
                            artifacts.append(selectedImage)
                        }
                        isImagePickerDisplayed = false
                    }
                }
            
            TextField("iMessage", text: $messageText)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(20)
                .padding(.horizontal)
            
            SendButton(onClick: sendMessage)
                .padding(.trailing)
        }
        .padding(.top)
        .background(Color(UIColor.systemGray6))
    }
}
