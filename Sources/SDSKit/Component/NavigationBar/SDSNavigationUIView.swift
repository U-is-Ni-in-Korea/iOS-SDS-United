#if canImport(UIKit)
import UIKit
import SnapKit
#endif


public final class SDSNavigationUIView: UIView {
    let style: SDSNavigationStyle
    public init(style: SDSNavigationStyle) {
        self.style = style
        super.init(frame: .zero)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setup() {
        switch style {
        case .leftTitleRightDismissButton(let title, let dismissImage, _):
            let titleLabel: UILabel = {
                let label = UILabel()
                label.textColor = .gray600
                label.text = title
                label.font = SDSFont.title1.font
                return label
            }()
            let dismissButton: UIButton = {
                let button = UIButton()
                button.setImage(dismissImage, for: .normal)
                button.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
                return button
            }()
            [titleLabel, dismissButton].forEach { addSubview($0) }
            self.snp.makeConstraints {
                $0.height.equalTo(52)
            }
            titleLabel.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(20)
                $0.centerY.equalToSuperview()
            }
            dismissButton.snp.makeConstraints {
                $0.trailing.equalToSuperview().inset(10)
                $0.height.width.equalTo(36)
                $0.centerY.equalToSuperview()
            }
        case .leftPopButtonMiddleTitle(let title, _):
            let popButton: UIButton = {
                let button = UIButton()
                button.setImage(SDSIcon.icNavigationBarLeft, for: .normal)
                button.addTarget(self, action: #selector(popButtonTapped), for: .touchUpInside)
                return button
            }()
            let middleTitleLabel: UILabel = {
                let label = UILabel()
                label.text = title
                label.font = SDSFont.subTitle.font
                label.textColor = .gray600
                return label
            }()
            [popButton, middleTitleLabel].forEach { addSubview($0) }
            self.snp.makeConstraints {
                $0.height.equalTo(52)
            }
            popButton.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(10)
                $0.height.width.equalTo(24)
                $0.centerY.equalToSuperview()
            }
            middleTitleLabel.snp.makeConstraints {
                $0.centerX.centerY.equalToSuperview()
            }
        case .titleRightDismissButton(let title, let dismissImage, _):
            let middleTitleLabel: UILabel = {
                let label = UILabel()
                label.text = title
                label.font = SDSFont.subTitle.font
                label.textColor = .gray600
                return label
            }()
            let dismissButton: UIButton = {
                let button = UIButton()
                button.setImage(dismissImage, for: .normal)
                button.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
                return button
            }()
            [middleTitleLabel, dismissButton].forEach { addSubview($0) }
            self.snp.makeConstraints {
                $0.height.equalTo(52)
            }
            dismissButton.snp.makeConstraints {
                $0.trailing.equalToSuperview().inset(10)
                $0.height.width.equalTo(36)
                $0.centerY.equalToSuperview()
            }
            middleTitleLabel.snp.makeConstraints {
                $0.centerX.centerY.equalToSuperview()
            }
        case .leftPopButtonMiddleTitleRightDismissButton(let title, let dismissImage, _, _):
            let popButton: UIButton = {
                let button = UIButton()
                button.setImage(SDSIcon.icNavigationBarLeft, for: .normal)
                button.addTarget(self, action: #selector(popButtonTapped), for: .touchUpInside)
                return button
            }()
            let middleTitleLabel: UILabel = {
                let label = UILabel()
                label.text = title
                label.font = SDSFont.subTitle.font
                label.textColor = .gray600
                return label
            }()
            let dismissButton: UIButton = {
                let button = UIButton()
                button.setImage(dismissImage, for: .normal)
                button.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
                return button
            }()
            [popButton, middleTitleLabel, dismissButton].forEach { addSubview($0) }
            self.snp.makeConstraints {
                $0.height.equalTo(52)
            }
            popButton.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(10)
                $0.height.width.equalTo(24)
                $0.centerY.equalToSuperview()
            }
            middleTitleLabel.snp.makeConstraints {
                $0.centerX.centerY.equalToSuperview()
            }
            dismissButton.snp.makeConstraints {
                $0.trailing.equalToSuperview().inset(10)
                $0.height.width.equalTo(36)
                $0.centerY.equalToSuperview()
            }
        case .leftPopButtonMiddleTitleRightCustomButton(let title, let customButtonTitle, _, _):
            let popButton: UIButton = {
                let button = UIButton()
                button.setImage(SDSIcon.icNavigationBarLeft, for: .normal)
                button.addTarget(self, action: #selector(popButtonTapped), for: .touchUpInside)
                return button
            }()
            let middleTitleLabel: UILabel = {
                let label = UILabel()
                label.text = title
                label.font = SDSFont.subTitle.font
                label.textColor = .gray600
                return label
            }()
            let dismissButton: UIButton = {
                let button = UIButton()
                button.setTitle(customButtonTitle, for: .normal)
                button.setTitleColor(.lightBlue600, for: .normal)
                button.titleLabel?.font = SDSFont.subTitle.font
                button.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
                return button
            }()
            [popButton, middleTitleLabel, dismissButton].forEach { addSubview($0) }
            self.snp.makeConstraints {
                $0.height.equalTo(52)
            }
            popButton.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(10)
                $0.height.width.equalTo(24)
                $0.centerY.equalToSuperview()
            }
            middleTitleLabel.snp.makeConstraints {
                $0.centerX.centerY.equalToSuperview()
            }
            dismissButton.snp.makeConstraints {
                $0.trailing.equalToSuperview().inset(10)
                $0.height.width.equalTo(36)
                $0.centerY.equalToSuperview()
            }
        }
    }
    @objc private func dismissButtonTapped() {
        switch style {
        case .leftTitleRightDismissButton(_, _, let action):
            action()
        case .leftPopButtonMiddleTitle(_, _):
            return
        case .titleRightDismissButton(_, _, let action):
            action()
        case .leftPopButtonMiddleTitleRightDismissButton(_, _, _, let dismissAction):
            dismissAction()
        case .leftPopButtonMiddleTitleRightCustomButton(_, _, _, let dismissAction):
            dismissAction()
        }
    }
    @objc private func popButtonTapped() {
        switch style {
        case .leftTitleRightDismissButton(_, _, _):
            return
        case .leftPopButtonMiddleTitle(_, let action):
            action()
        case .titleRightDismissButton(_, _, _):
            return
        case .leftPopButtonMiddleTitleRightDismissButton(_, _, let popAction, _):
            popAction()
        case .leftPopButtonMiddleTitleRightCustomButton(_, _, let popAction, _):
            popAction()
        }
    }
}

