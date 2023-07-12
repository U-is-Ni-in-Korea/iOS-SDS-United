//
#if canImport(UIKit)
import UIKit
import SnapKit
#endif

public enum ColorTypes {
    case blue
    case green
    case pink
    case gray
}

public class SDSChips: UIView {

    public var title: String
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = SDSFont.caption.font
        label.text = title
        return label
    }()
    
    public init(type: ColorTypes, title: String) {
        self.title = title
        super.init(frame: .zero)
        
        setStyle()
        setUI()
        
        switch type {
        case .blue:
            self.backgroundColor = .lightBlue50
            titleLabel.textColor = .lightBlue600
        case .green:
            self.backgroundColor = .green50
            titleLabel.textColor = .green600
        case .pink:
            self.backgroundColor = .pink50
            titleLabel.textColor = .pink600
        case .gray:
            self.backgroundColor = .gray100
            titleLabel.textColor = .gray400
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.layer.cornerRadius = 13
    }
    func setStyle() {
        [titleLabel].forEach {
            addSubview($0)
        }
        
        self.snp.makeConstraints {
            $0.height.equalTo(26)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
