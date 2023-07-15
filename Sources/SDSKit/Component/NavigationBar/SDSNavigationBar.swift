
#if canImport(UIKit)
import UIKit
import SnapKit
#endif

public class SDSNavigationBar: UIView {
    public var hasBack: Bool
    public var hasTitleItem: Bool
    public var rightBarLeftButtonItemCompletionHandler: (() -> Void)?
    public var rightBarRightButtonItemCompletionHandler: (() -> Void)?
    public var rightBarSingleButtonLabelCompletionHandler: (() -> Void)?
    public var backButtonCompletionHandler: (() -> Void)?

    public var singleButtonTitle: String = "" {
        didSet {
            rightBarSingleButtonLabel.text = singleButtonTitle
        }
    }
    public var rightBarButtonImages: [UIImage?]
    public var navigationTitle: String?
    
    
    public let backButton: UIButton = {
        let button = UIButton()
        button.setImage(SDSIcon.icNavigationBarLeft.resize(targetSize: CGSize(width: 24, height: 24)), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray600
        label.text = navigationTitle
        label.font = SDSFont.subTitle.font
        return label
    }()
    
    lazy var rightBarLeftButtonItem: UIButton = {
        let button = UIButton()
        if rightBarButtonImages.count == 2{
            button.setImage(rightBarButtonImages[1], for: .normal)
        }
        return button
    }()
    
    lazy var rightBarRightButtonItem: UIButton = {
        let button = UIButton()
        if rightBarButtonImages.count >= 1 {
            button.setImage(rightBarButtonImages[0], for: .normal)
        }
        return button
    }()
    
    let rightBarSingleButtonLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightBlue600
        label.font = SDSFont.body1.font
        return label
    }()
    
    let rightBarSingleButtonItem: UIButton = {
        let button = UIButton()
        return button
    }()

    public init(hasBack: Bool, hasTitleItem: Bool, navigationTitle: String? = nil, rightBarButtonImages: [UIImage?] = []) {
        self.hasBack = hasBack
        self.hasTitleItem = hasTitleItem
        self.navigationTitle = navigationTitle ?? ""
        self.rightBarButtonImages = rightBarButtonImages
        super.init(frame: .zero)
        
        setStyle()
        setUI()
        actions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        hasBackButton(hasBack: hasBack)
        hasTitleItem(hasTitle: hasTitleItem)
    }
    func setStyle() {
        [backButton, titleLabel, rightBarLeftButtonItem, rightBarRightButtonItem, rightBarSingleButtonItem].forEach {
            addSubview($0)
        }
        rightBarSingleButtonItem.addSubview(rightBarSingleButtonLabel)
        
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10)
            $0.width.height.equalTo(24)
            $0.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.height.equalTo(50)
        }
        rightBarRightButtonItem.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(13)
            $0.width.height.equalTo(36)
        }
        rightBarLeftButtonItem.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(rightBarRightButtonItem.snp.leading).offset(-8)
            $0.width.height.equalTo(36)
        }
        rightBarSingleButtonItem.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(2)
            $0.height.equalTo(36)
            $0.width.greaterThanOrEqualTo(36)
        }
        rightBarSingleButtonLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(14)
        }
    }
    
    func actions() {
        rightBarLeftButtonItem.addTarget(self, action: #selector(rightBarLeftButtonItemTapped), for: .touchUpInside)
        rightBarRightButtonItem.addTarget(self, action: #selector(rightBarRightButtonItemTapped), for: .touchUpInside)
        rightBarSingleButtonItem.addTarget(self, action: #selector(rightBarSingleButtonItemTapped), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    @objc func rightBarLeftButtonItemTapped() {
        rightBarLeftButtonItemCompletionHandler?()
    }
    @objc func rightBarRightButtonItemTapped() {
        rightBarRightButtonItemCompletionHandler?()
    }
    @objc func rightBarSingleButtonItemTapped() {
        rightBarSingleButtonLabelCompletionHandler?()
    }
    @objc func backButtonTapped() {
        backButtonCompletionHandler?()
    }

    func hasTitleItem(hasTitle: Bool) {
        if hasTitle {
            rightBarLeftButtonItem.isHidden = true
            rightBarRightButtonItem.isHidden = true
            rightBarSingleButtonItem.isHidden = false
            rightBarSingleButtonLabel.isHidden = false
        }
        else {
            rightBarLeftButtonItem.isHidden = false
            rightBarRightButtonItem.isHidden = false
            rightBarSingleButtonItem.isHidden = true
            rightBarSingleButtonLabel.isHidden = true
        }
    }
    func hasBackButton(hasBack: Bool) {
        if hasBack {
            backButton.isHidden = false
        }
        else {
            backButton.isHidden = true
        }
    }
}
