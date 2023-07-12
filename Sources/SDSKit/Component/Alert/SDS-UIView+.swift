#if canImport(UIKit)
import UIKit
import SnapKit
#endif

public extension UIView {
    func showAlert(size: SDSAlertNumberOfLines,
                   cancelButtonMessage: String? = nil,
                   okButtonMessage: String,
                   title: String? = nil,
                   message: String,
                   type: SDSAlertType) -> AlertView {
        
        var viewSize = CGSize()
        
        switch size {
        case .singleLineTitled:
            viewSize = CGSize(width: 271, height: 148)
        case .singleLineUnTitled:
            viewSize = CGSize(width: 271, height: 120)
        case .multiLineTitled:
            viewSize = CGSize(width: 271, height: 168)
        case .multiLineUnTitled:
            viewSize = CGSize(width: 271, height: 140)
        }
        
        let alertView = AlertView(size: viewSize,
                                  cancelButtonMessage: cancelButtonMessage,
                                  okButtonMessage: okButtonMessage,
                                  title: title,
                                  message: message,
                                  type: type)
        
        self.addSubview( alertView)
        alertView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(viewSize.width)
            $0.height.equalTo(viewSize.height)
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
