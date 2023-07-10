#if canImport(UIKit)
import UIKit
#endif

public extension UIImage {
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: .module, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = name
        return image
    }
}
