import Foundation
#if canImport(UIKit)
import UIKit
import SnapKit
import Kingfisher
#endif

public class SDSSmallButton: UIButton {
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
                                                                   font: SDSFont.btn2.font)
            } else {
                config?.attributedTitle = title.setAttributeString(textColor: .gray400,
                                                                   font: SDSFont.btn2.font)
            }
        case .enabled:
            if sdsButtonType == .fill {
                config?.attributedTitle = title.setAttributeString(textColor: .gray000,
                                                                   font: SDSFont.btn2.font)
            } else {
                config?.attributedTitle = title.setAttributeString(textColor: .lightBlue600,
                                                                   font: SDSFont.btn2.font)
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
                config?.background.backgroundColor = .gray000
                config?.background.strokeColor = .lightBlue500
                config?.background.strokeWidth = 1
                titleLabel?.textColor = .lightBlue600
            }
            self.configuration = config
        case .disabled:
            if sdsButtonType == .fill {
                config?.background.backgroundColor = .gray300
            } else {
                config?.background.backgroundColor = .gray000
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
        config.imagePadding = 4
        config.imagePlacement = .trailing
        config.titleAlignment = .center
        self.configuration = config
    }
    
    private func addGesture() {
        let gesture = UILongPressGestureRecognizer(target: self,
                                                   action: #selector(didButtonPress(_:)))
        gesture.minimumPressDuration = 0
        self.addGestureRecognizer(gesture)
    }
    
    var originColor: UIColor?
    @objc private func didButtonPress(_ sender: UILongPressGestureRecognizer) {
        var config = self.configuration
        if sender.state == .began {
            self.originColor = config?.background.backgroundColor
            
            if originColor == .gray000 {
                config?.background.backgroundColor = self.originColor?.blendColors(tintColor: .lightBlue50)
            }
            else if originColor == .gray300 {
                config?.background.backgroundColor = self.originColor?.blendColors(tintColor: .gray400)
            }
            else if originColor == .lightBlue500 {
                config?.background.backgroundColor = self.originColor?.blendColors(tintColor: .lightBlue600)
            }
        }
        if sender.state == .ended {
            config?.background.backgroundColor = originColor
        }
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
        self.addGesture()
    }

}
