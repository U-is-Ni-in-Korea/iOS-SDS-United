#if canImport(UIKit)
import UIKit
import SnapKit
#endif

public extension UIView {
    func showAlert(size: CGSize,
                   title: String? = nil,
                   message: String,
                   cancelButtonMessage: String? = nil,
                   okButtonMessage: String,
                   type: SDSAlertType) -> AlertView {
        
        
        let alertView = AlertView(size: size,
                                  title: title,
                                  message: message,
                                  cancelButtonMessage: cancelButtonMessage,
                                  okButtonMessage: okButtonMessage,
                                  type: type)
        
        self.addSubview(alertView)
        alertView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(size.width)
            $0.height.equalTo(size.height)
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
