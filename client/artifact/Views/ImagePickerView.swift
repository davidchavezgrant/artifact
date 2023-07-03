import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    var completionHandler: ((UIImage?) -> Void)? = nil
    
    func makeCoordinator() -> Handler {
        return Handler(handle: completionHandler)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .photoLibrary
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerView>) {}
    
    class Handler: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var handle: ((UIImage?) -> Void)? = nil
        
        init(handle: ((UIImage?) -> Void)? = nil) {
            self.handle = handle
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                handle?(image)
            } else {
                handle?(nil)
            }
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            handle?(nil)
        }
    }
}
