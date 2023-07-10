import Foundation
#if canImport(UIKit)
import UIKit
#endif


public extension UIColor {
    // gray
    static let gray000 = UIColor(named: "Gray000", in: .module, compatibleWith: nil)!
    static let gray50 = UIColor(named: "Gray50", in: .module, compatibleWith: nil)!
    static let gray100 = UIColor(named: "Gray100", in: .module, compatibleWith: nil)!
    static let gray150 = UIColor(named: "Gray150", in: .module, compatibleWith: nil)!
    static let gray200 = UIColor(named: "Gray200", in: .module, compatibleWith: nil)!
    static let gray250 = UIColor(named: "Gray250", in: .module, compatibleWith: nil)!
    static let gray300 = UIColor(named: "Gray300", in: .module, compatibleWith: nil)!
    static let gray350 = UIColor(named: "Gray350", in: .module, compatibleWith: nil)!
    static let gray400 = UIColor(named: "Gray400", in: .module, compatibleWith: nil)!
    static let gray450 = UIColor(named: "Gray450", in: .module, compatibleWith: nil)!
    static let gray500 = UIColor(named: "Gray500", in: .module, compatibleWith: nil)!
    static let gray550 = UIColor(named: "Gray550", in: .module, compatibleWith: nil)!
    static let gray600 = UIColor(named: "Gray600", in: .module, compatibleWith: nil)!
    
    static let green50 = UIColor(named: "Green50", in: .module, compatibleWith: nil)!
    static let green100 = UIColor(named: "Green100", in: .module, compatibleWith: nil)!
    static let green150 = UIColor(named: "Green150", in: .module, compatibleWith: nil)!
    static let green200 = UIColor(named: "Green200", in: .module, compatibleWith: nil)!
    static let green300 = UIColor(named: "Green300", in: .module, compatibleWith: nil)!
    static let green400 = UIColor(named: "Green400", in: .module, compatibleWith: nil)!
    static let green500 = UIColor(named: "Green500", in: .module, compatibleWith: nil)!
    static let green600 = UIColor(named: "Green600", in: .module, compatibleWith: nil)!
    static let green700 = UIColor(named: "Green700", in: .module, compatibleWith: nil)!
    static let green800 = UIColor(named: "Green800", in: .module, compatibleWith: nil)!
    static let green850 = UIColor(named: "Green850", in: .module, compatibleWith: nil)!
    static let green900 = UIColor(named: "Green900", in: .module, compatibleWith: nil)!
    static let green950 = UIColor(named: "Green950", in: .module, compatibleWith: nil)!
    
    //lightBlue
    static let lightBlue50 = UIColor(named: "LightBlue50", in: .module, compatibleWith: nil)!
    static let lightBlue100 = UIColor(named: "LightBlue100", in: .module, compatibleWith: nil)!
    static let lightBlue150 = UIColor(named: "LightBlue150", in: .module, compatibleWith: nil)!
    static let lightBlue200 = UIColor(named: "LightBlue200", in: .module, compatibleWith: nil)!
    static let lightBlue300 = UIColor(named: "LightBlue300", in: .module, compatibleWith: nil)!
    static let lightBlue400 = UIColor(named: "LightBlue400", in: .module, compatibleWith: nil)!
    static let lightBlue500 = UIColor(named: "LightBlue500", in: .module, compatibleWith: nil)!
    static let lightBlue600 = UIColor(named: "LightBlue600", in: .module, compatibleWith: nil)!
    static let lightBlue700 = UIColor(named: "LightBlue700", in: .module, compatibleWith: nil)!
    static let lightBlue800 = UIColor(named: "LightBlue800", in: .module, compatibleWith: nil)!
    static let lightBlue850 = UIColor(named: "LightBlue850", in: .module, compatibleWith: nil)!
    static let lightBlue900 = UIColor(named: "LightBlue900", in: .module, compatibleWith: nil)!
    static let lightBlue950 = UIColor(named: "LightBlue950", in: .module, compatibleWith: nil)!
    
    //orange
    static let orange500 = UIColor(named: "Orange500", in: .module, compatibleWith: nil)!
    
    //pink
    static let pink50 = UIColor(named: "Pink50", in: .module, compatibleWith: nil)!
    static let pink100 = UIColor(named: "Pink100", in: .module, compatibleWith: nil)!
    static let pink150 = UIColor(named: "Pink150", in: .module, compatibleWith: nil)!
    static let pink200 = UIColor(named: "Pink200", in: .module, compatibleWith: nil)!
    static let pink300 = UIColor(named: "Pink300", in: .module, compatibleWith: nil)!
    static let pink400 = UIColor(named: "Pink400", in: .module, compatibleWith: nil)!
    static let pink500 = UIColor(named: "Pink500", in: .module, compatibleWith: nil)!
    static let pink600 = UIColor(named: "Pink600", in: .module, compatibleWith: nil)!
    static let pink700 = UIColor(named: "Pink700", in: .module, compatibleWith: nil)!
    static let pink800 = UIColor(named: "Pink800", in: .module, compatibleWith: nil)!
    static let pink850 = UIColor(named: "Pink850", in: .module, compatibleWith: nil)!
    static let pink900 = UIColor(named: "Pink900", in: .module, compatibleWith: nil)!
    static let pink950 = UIColor(named: "Pink950", in: .module, compatibleWith: nil)!
    
    //red
    static let red500 = UIColor(named: "Red500", in: .module, compatibleWith: nil)!
    
    //yellow
    static let yellow50 = UIColor(named: "Yellow50", in: .module, compatibleWith: nil)!
    static let yellow150 = UIColor(named: "Yellow150", in: .module, compatibleWith: nil)!
    static let yellow200 = UIColor(named: "Yellow200", in: .module, compatibleWith: nil)!
    static let yellow300 = UIColor(named: "Yellow300", in: .module, compatibleWith: nil)!
    static let yellow500 = UIColor(named: "Yellow500", in: .module, compatibleWith: nil)!
    static let yellow600 = UIColor(named: "Yellow600", in: .module, compatibleWith: nil)!
    
    /**hovering effect를 위함**/
    func blendColors(tintColor: UIColor) -> UIColor {
        let ratioClamped = max(0, min(1, 0.5))
        let inverseRatio = 1 - ratioClamped
        
        var red1: CGFloat = 0, green1: CGFloat = 0, blue1: CGFloat = 0, alpha1: CGFloat = 0
        self.getRed(&red1, green: &green1, blue: &blue1, alpha: &alpha1)
        
        var red2: CGFloat = 0, green2: CGFloat = 0, blue2: CGFloat = 0, alpha2: CGFloat = 0
        tintColor.getRed(&red2, green: &green2, blue: &blue2, alpha: &alpha2)
        
        let blendedRed = red1 * inverseRatio + red2 * ratioClamped
        let blendedGreen = green1 * inverseRatio + green2 * ratioClamped
        let blendedBlue = blue1 * inverseRatio + blue2 * ratioClamped
        let blendedAlpha = alpha1 * inverseRatio + alpha2 * ratioClamped
        
        return UIColor(red: blendedRed, green: blendedGreen, blue: blendedBlue, alpha: blendedAlpha)
    }
}
