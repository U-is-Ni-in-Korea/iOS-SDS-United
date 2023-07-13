
#if canImport(UIKit)
import UIKit
import SnapKit
#endif

extension UIView {
    public func applyBlurAndDepth2_2Shadow() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 1
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.layer.cornerRadius = 20
        blurEffectView.clipsToBounds = true
        addSubview(blurEffectView)
    }
    
    public func applyBlurAndDepth3_2Shadow() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 1
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.layer.cornerRadius = 20
        blurEffectView.clipsToBounds = true
        addSubview(blurEffectView)
    }
    public func applyNavigationBarShadow() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 1
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
    }
}

extension CALayer {
    public func applyDepth1Shadow() {
        masksToBounds = false
        shadowColor = UIColor(hex: 0x0F2726).cgColor
        shadowOpacity = 0.1
        shadowOffset = CGSize(width: -1, height: 1)
        shadowRadius = 6 / UIScreen.main.scale
        shadowPath = nil
    }
    
    public func applyDepth2_1Shadow() {
        masksToBounds = false
        shadowColor = UIColor(hex: 0xE9EFEF).cgColor
        shadowOpacity = 0.1
        shadowOffset = CGSize(width: -3, height: 3)
        shadowRadius = 6 / UIScreen.main.scale
        shadowPath = nil
    }
    public func applyDepth2_2Shadow() {
        masksToBounds = false
        shadowColor = UIColor(hex: 0xABBABA).cgColor
        shadowOpacity = 0.2
        shadowOffset = CGSize(width: 6, height: 7)
        shadowRadius = 6 / UIScreen.main.scale
        let rect = bounds.insetBy(dx: -11, dy: -11)
        shadowPath = UIBezierPath(rect: rect).cgPath
    }
    public func applyBlurAndDepth2_1Shadow() {
        masksToBounds = false
        shadowColor = UIColor(hex: 0x4E4E4E).cgColor
        shadowOpacity = 0.13
        shadowOffset = CGSize(width: 1, height: 4)
        shadowRadius = 25 / UIScreen.main.scale
        shadowPath = nil
    }
    
    public func applyBlurAndDepth3_1Shadow() {
        masksToBounds = false
        shadowColor = UIColor(hex: 0x000000).cgColor
        shadowOpacity = 0.25
        shadowOffset = CGSize(width: 0, height: 0)
        shadowRadius = 10 / UIScreen.main.scale
        shadowPath = nil
    }
    
    public func applyDepth4_1Shadow() {
        masksToBounds = false
        shadowColor = UIColor(hex: 0x262626).cgColor
        shadowOpacity = 0.10
        shadowOffset = CGSize(width: 2, height: 0)
        shadowRadius = 3 / UIScreen.main.scale
        shadowPath = nil
    }
    public func applyDepth4_2Shadow() {
        masksToBounds = false
        shadowColor = UIColor(hex: 0x262626).cgColor
        shadowOpacity = 0.15
        shadowOffset = CGSize(width: 0, height: 4)
        shadowRadius = 20 / UIScreen.main.scale
        shadowPath = nil
    }
}

extension CALayer {
    public func applySketchShadow(
        color: UIColor,
        alpha: Float,
        x: CGFloat,
        y: CGFloat,
        blur: CGFloat,
        spread: CGFloat
    ) {
        masksToBounds = false
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / UIScreen.main.scale
        if spread == 0 {
            shadowPath = nil
        } else {
            let rect = bounds.insetBy(dx: -spread, dy: -spread)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}

