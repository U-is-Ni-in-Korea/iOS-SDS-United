#if canImport(UIKit)
import UIKit
import SnapKit
#endif

public extension UIView {
    func showAlert(title: String? = nil,
                   message: String? = nil,
                   cancelButtonMessage: String? = nil,
                   okButtonMessage: String,
                   type: SDSAlertType) -> AlertView {
        
        let alertView = AlertView(title: title,
                                  message: message,
                                  cancelButtonMessage: cancelButtonMessage,
                                  okButtonMessage: okButtonMessage,
                                  type: type)
        
        self.addSubview(alertView)
        alertView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        alertView.alpha = 0
        UIView.animate(withDuration: 0.3) {
            alertView.alpha = 1
        }
        return alertView
    }
    
    func hideAlert(view: AlertView) {
        UIView.animate(withDuration: 0.3) {
            view.alpha = 0
        } completion: { _ in
            view.removeFromSuperview()
        }
    }
}
