import Foundation
#if canImport(UIKit)
import UIKit
import SnapKit
import Kingfisher
#endif

public class SDSButton: UIButton {
    private var sdsButtonType: SDSButtonType = .fill
    private var _buttonState: SDSButtonState = .disabled
    
    public var buttonState: SDSButtonState {
        get {
            return _buttonState
        }
        set (newState) {
            _buttonState = newState
            setButtonState(_buttonState)
        }
    }

    public func setButtonTitle(title: String) {
        var config = self.configuration
        
        switch self.buttonState {
        case .disabled:
            if sdsButtonType == .fill {
                config?.attributedTitle = title.setAttributeString(textColor: .gray000,
                                                                   font: SDSFont.btn1.font)
            } else {
                config?.attributedTitle = title.setAttributeString(textColor: .gray400,
                                                                   font: SDSFont.btn1.font)
            }
        case .enabled:
            if sdsButtonType == .fill {
                config?.attributedTitle = title.setAttributeString(textColor: .gray000,
                                                                   font: SDSFont.btn1.font)
            } else {
                config?.attributedTitle = title.setAttributeString(textColor: .lightBlue600,
                                                                   font: SDSFont.btn1.font)
            }
        }
        self.configuration = config
    }
    
    private func setButtonState(_ state: SDSButtonState) {
        var config = self.configuration
        switch state {
        case .enabled:
            if sdsButtonType == .fill {
                config?.background.backgroundColor = .lightBlue500
            } else {
                config?.background.backgroundColor = .clear
                config?.background.strokeColor = .lightBlue500
                config?.background.strokeWidth = 1
                titleLabel?.textColor = .lightBlue600
            }
            self.configuration = config
        case .disabled:
            if sdsButtonType == .fill {
                config?.background.backgroundColor = .gray300
            } else {
                config?.background.backgroundColor = .clear
                config?.background.strokeColor = .gray400
                config?.background.strokeWidth = 1
                titleLabel?.textColor = .gray400
            }
            self.configuration = config
        }
    }
    
    private func setButtonConfig() {
        var config = UIButton.Configuration.plain()
        config.background.cornerRadius = 10.adjusted
        config.imagePadding = 8
        config.imagePlacement = .leading
        config.titleAlignment = .center
        self.configuration = config
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public init(type: SDSButtonType,
                state: SDSButtonState) {
        super.init(frame: .zero)
        self.sdsButtonType = type
        self.setButtonConfig()
        self.buttonState = state
    }
    

}
