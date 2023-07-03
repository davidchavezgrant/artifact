import SwiftUI

struct AddButton: View {
    var onClick: () -> Void
    
    var body: some View {
        Button(action: onClick) {
            Image(systemName: "plus.circle")
                .font(.system(size: 24))
                .padding(.leading)
        }
    }
}
