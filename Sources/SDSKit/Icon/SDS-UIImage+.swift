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
    func resize(targetSize: CGSize) -> UIImage {
            return UIGraphicsImageRenderer(size:targetSize).image { _ in
                self.draw(in: CGRect(origin: .zero, size: targetSize))
            }
        }
}
