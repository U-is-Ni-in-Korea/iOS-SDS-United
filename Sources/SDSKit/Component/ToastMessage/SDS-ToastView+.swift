import Foundation
#if canImport(UIKit)
import UIKit
#endif

public extension UIView {

    func showToast(message: String, hasSafeArea: Bool) {
        let toastMessageView = SDSToastView(toastTitle: message)
        
        self.addSubview(toastMessageView)
        toastMessageView.translatesAutoresizingMaskIntoConstraints = false
        if hasSafeArea {
            NSLayoutConstraint.activate([
                toastMessageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                toastMessageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -47)
            ])
        }
        else {
            NSLayoutConstraint.activate([
                toastMessageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                toastMessageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -13)
            ])
        }

        UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseInOut, animations: {
            toastMessageView.alpha = 0.0
        }, completion: { _ in
            toastMessageView.removeFromSuperview()
        })
    }
}
