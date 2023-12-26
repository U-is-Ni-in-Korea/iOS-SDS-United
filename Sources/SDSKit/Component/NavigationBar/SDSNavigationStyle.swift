#if canImport(UIKit)
import UIKit
#endif

public enum SDSNavigationStyle {
    case leftTitleRightDismissButton(title: String, dismissImage: UIImage, action: () -> Void)
    case leftPopButtonMiddleTitle(title: String, action: () -> Void)
    case titleRightDismissButton(title: String, dismissImage: UIImage, action: () -> Void)
    case leftPopButtonMiddleTitleRightDismissButton(title: String, dismissImage: UIImage, popAction: () -> Void, dismissAction: () -> Void)
    case leftPopButtonMiddleTitleRightCustomButton(title: String, customButtonTitle: String, popAction: () -> Void, dismissAction: () -> Void)
}
