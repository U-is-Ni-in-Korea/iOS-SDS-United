import UIKit
import SnapKit

public class AlertView: UIView {
    // MARK: - UI Property
    
    let alertView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    let textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 4
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray600
        label.textAlignment = .center
        label.font = SDSFont.subTitle.font
        return label
    }()
    
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray400
        label.font = SDSFont.body2.font
        label.numberOfLines = 0
        return label
    }()
    
    let buttonStackBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray150
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.layer.masksToBounds = true
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 1
        stackView.isUserInteractionEnabled = true
        return stackView
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(.lightBlue600, for: .normal)
        button.titleLabel?.font = SDSFont.body1Regular.font
        button.layer.borderColor = UIColor.gray150.cgColor
        return button
    }()
    
    let okButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(.lightBlue600, for: .normal)
        button.titleLabel?.font = SDSFont.btn1.font
        button.layer.borderColor = UIColor.gray150.cgColor
        button.isUserInteractionEnabled = true
        return button
    }()
    
    // MARK: - Life Cycle
    
    public init(title: String? = nil,
                message: String? = nil,
                cancelButtonMessage: String? = nil,
                okButtonMessage: String,
                type: SDSAlertType) {
        
        super.init(frame: .init(origin: .zero,
                                size: .zero))
        setStyle()
        setLayout()
        if title == nil {
            titleLabel.isHidden = true
        }
        else {
            titleLabel.text = title
        }
        if message == nil {
            messageLabel.isHidden = true
        }
        else {
            messageLabel.text = message
        }
//        messageLabel.text = message
        if cancelButtonMessage == nil {
            cancelButton.isHidden = true
        }
        else {
            cancelButton.setTitle(cancelButtonMessage, for: .normal)
        }
        okButton.setTitle(okButtonMessage, for: .normal)
        if type == .noti {
            cancelButton.isHidden = true
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("SecondView Error!")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        messageLabel.setLineSpacing(lineHeightMultiple: 20/17)
        messageLabel.textAlignment = .center
    }
    
    
    // MARK: - Setting
    
    private func setStyle() {
        self.backgroundColor = .black.withAlphaComponent(0.4)
    }
    
    private func setLayout() {
        self.addSubview(alertView)
        [textStackView, buttonStackBackView].forEach {
            alertView.addSubview($0)
        }
        [titleLabel, messageLabel].forEach {
            textStackView.addArrangedSubview($0)
        }
        buttonStackBackView.addSubview(buttonStackView)
        [cancelButton, okButton].forEach {
            buttonStackView.addArrangedSubview($0)
        }
        
        alertView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(52)
        }
        
        textStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.centerX.equalToSuperview()
            
        }
        
        titleLabel.snp.makeConstraints {
            $0.height.equalTo(24)
        }
        
        buttonStackBackView.snp.makeConstraints {
            $0.top.equalTo(textStackView.snp.bottom).offset(24)
            $0.height.equalTo(52)
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(1)
            $0.bottom.leading.trailing.equalToSuperview()
        }
        
        cancelButton.addTarget(self,
                               action: #selector(cancelButtonTapped),
                               for: .touchUpInside)
        
        okButton.addTarget(self,
                           action: #selector(okButtonTapped),
                           for: .touchUpInside)
    }
    
    // MARK: - Action Helper
    
    public var okButtonTapCompletion: (() -> Void)?
    public var cancelButtonTapCompletion: (() -> Void)?
    
    @objc private func cancelButtonTapped() {
        guard let completion = cancelButtonTapCompletion else {return}
        completion()
    }
    
    @objc private func okButtonTapped() {
        guard let completion = okButtonTapCompletion else {return}
        completion()
    }
}
