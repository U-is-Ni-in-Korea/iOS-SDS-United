import Foundation
#if canImport(UIKit)
import UIKit
#endif

public func registerFonts() {
    _ = UIFont.registerFont(bundle: .module, fontName: "Pretendard-Bold", fontExtension: "otf")
    _ = UIFont.registerFont(bundle: .module, fontName: "Pretendard-Medium", fontExtension: "otf")
    _ = UIFont.registerFont(bundle: .module, fontName: "Pretendard-Regular", fontExtension: "otf")
    _ = UIFont.registerFont(bundle: .module, fontName: "Pretendard-SemiBold", fontExtension: "otf")
}
