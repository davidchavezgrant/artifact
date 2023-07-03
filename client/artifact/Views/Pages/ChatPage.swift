import SwiftUI

struct ChatPage: View {
    /// The message text input
    @State private var messageText = ""
    
    /// The collection of messages
    @State private var messages: [Message] = [
        Message(text: "Hello!", isAttachment: false),
        Message(text: "How are you?", isAttachment: false),
        Message(text: "I'm doing well, thanks!", isAttachment: false),
        Message(text: "Here's a picture of my cat:", isAttachment: false),
        Message(text: "", isAttachment: true),
        Message(text: "Isn't she cute?", isAttachment: false),
        Message(text: "Isn't she cute?", isAttachment: false),
        Message(text: "Isn't she cute?", isAttachment: false),
        Message(text: "Isn't she cute?", isAttachment: false),
        Message(text: "Isn't she cute?", isAttachment: false),
        Message(text: "Isn't she cute?", isAttachment: false),
        Message(text: "Isn't she cute?", isAttachment: false),
    ]
    
    /// Sends a message by appending the current input to the collection and clearing the input.
    func sendMessage() {
        if !messageText.isEmpty {
            messages.append(Message(text: messageText, isAttachment: false))
            messageText = ""
        }
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(messages) { message in
                        if message.isAttachment {
                            AttachmentBubble()
                        } else {
                            MessageBubble(text: message.text)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .padding(.top)
            .background(Color(UIColor.systemGray6))
            
            HStack {
                TextField("iMessage", text: $messageText)
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
                
                SendButton(onClick: sendMessage)
            }
            .background(Color(UIColor.systemGray6))
        }
        .navigationBarTitle("Messages")
    }
}
