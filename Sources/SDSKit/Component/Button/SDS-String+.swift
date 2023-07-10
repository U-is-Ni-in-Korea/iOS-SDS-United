import Foundation
#if canImport(UIKit)
import UIKit
#endif

public extension String {
    func setAttributeString(textColor: UIColor, font: UIFont) -> AttributedString {
        let attirbuteTitle = NSMutableAttributedString(string: self, attributes: [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: textColor
        ])
        return AttributedString(attirbuteTitle)
    }
}
