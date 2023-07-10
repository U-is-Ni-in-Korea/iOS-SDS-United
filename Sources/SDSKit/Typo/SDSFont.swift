import Foundation
#if canImport(UIKit)
import UIKit
#endif

public struct FontProperty {
    let font: UIFont.FontType
    let size: CGFloat
    let lineHeight: CGFloat?
}

public enum SDSFont {
    case headLine
    case title1
    case title2
    case subTitle
    
    case body1
    case body1Regular
    case body2
    case body2Long
    case caption
    
    case btn1
    case btn2
    
    
    public var fontProperty: FontProperty {
        switch self {
        case .headLine:
            return FontProperty(font: .pretendardBold, size: 28, lineHeight: 38)
        case .title1:
            return FontProperty(font: .pretendardBold, size: 20, lineHeight: 24)
        case .title2:
            return FontProperty(font: .pretendardBold, size: 18, lineHeight: 24)
        case .subTitle:
            return FontProperty(font: .pretendardBold, size: 16, lineHeight: 28)
        case .body1:
            return FontProperty(font: .pretendardMedium, size: 16, lineHeight: 24)
        case .body1Regular:
            return FontProperty(font: .pretendardRegular, size: 16, lineHeight: 28)
        case .body2:
            return FontProperty(font: .pretendardMedium, size: 14, lineHeight: 20)
        case .body2Long:
            return FontProperty(font: .pretendardMedium, size: 14, lineHeight: 24)
        case .caption:
            return FontProperty(font: .pretendardMedium, size: 12, lineHeight: 18)
        case .btn1:
            return FontProperty(font: .pretendardSemiBold, size: 16, lineHeight: 24)
        case .btn2:
            return FontProperty(font: .pretendardMedium, size: 14, lineHeight: 20)
        }
        
    }
}

public extension SDSFont {
    var font: UIFont {
        guard let font = UIFont(name: fontProperty.font.name, size: fontProperty.size) else {
            return UIFont()
        }
        return font
    }
}
