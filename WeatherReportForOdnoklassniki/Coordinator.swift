import UIKit

class Coordinator {
    static func openAnotherScreen(from: UIViewController, to: UIViewController, isModal: Bool = false) {
        if isModal {
            to.modalPresentationStyle = .fullScreen
            from.present(to, animated: true, completion: nil)
        } else {
            from.navigationController?.pushViewController(to, animated: true)
        }
    }
    
    static func closeAnotherScreen(from: UIViewController) {
        if let presentingVC = from.presentingViewController {
            presentingVC.dismiss(animated: true, completion: nil)
        } else {
            from.navigationController?.popViewController(animated: true)
        }
    }
}

