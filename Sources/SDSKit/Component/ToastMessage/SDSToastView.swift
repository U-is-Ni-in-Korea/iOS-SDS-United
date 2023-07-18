
#if canImport(UIKit)
import UIKit
import SnapKit
#endif

public class SDSToastView: UIView {
    
    public var toastTitle: String
    
    public lazy var toastTitlelabel: UILabel = {
        let label = UILabel()
        label.text = toastTitle
        label.font = SDSFont.body2.font
        label.textColor = .gray000
        
        return label
    }()
    
    public init(toastTitle: String) {
        self.toastTitle = toastTitle
        super.init(frame: .zero)
        
        setStyle()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.layer.cornerRadius = 19
        self.backgroundColor = .gray450
    }
    
    func setStyle() {
        addSubview(toastTitlelabel)
        
        self.snp.makeConstraints {
            $0.height.equalTo(38)
        }
        
        toastTitlelabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(18)
        }
    }
}
