//
//  File.swift
//  
//
//  Created by 김사랑 on 2023/07/11.
//

import UIKit
import SnapKit

public class AlertView: UIView {
    // MARK: - Property
//    var message: String
    
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
    
    lazy var messagelabel: UILabel = {
        let label = UILabel()
//        label.text = message
        label.textColor = .gray400
        label.font = SDSFont.body2.font
        label.numberOfLines = 2
        label.setLineSpacing(lineHeightMultiple: 20/17)
        label.textAlignment = .center
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
        button.setTitle("Action", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.lightBlue600, for: .normal)
        button.titleLabel?.font = SDSFont.body1Regular.font
        button.layer.borderColor = UIColor.gray150.cgColor
        return button
    }()
    
    let okButton: UIButton = {
        let button = UIButton()
        button.setTitle("Action", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.lightBlue600, for: .normal)
        button.titleLabel?.font = SDSFont.btn1.font
        button.layer.borderColor = UIColor.gray150.cgColor
        button.isUserInteractionEnabled = true
        return button
    }()
    
    // MARK: - Life Cycle
    
    public init(size: CGSize,
                title: String? = nil,
                message: String,
                type: SDSAlertType) {

        super.init(frame: .init(origin: .zero,
                                size: size))
        setLayout(size: size)
        if title == nil {
            titleLabel.isHidden = true
        }
        else {
            titleLabel.text = title
        }
        if type == .noti {
            cancelButton.isHidden = true
        }
        messagelabel.text = message
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("SecondView Error!")
    }
    
    // MARK: - Setting
    
    private func setLayout(size: CGSize) {
        super.addSubview(alertView)
        [textStackView, buttonStackBackView].forEach {
            alertView.addSubview($0)
        }
        [titleLabel, messagelabel].forEach {
            textStackView.addArrangedSubview($0)
        }
        buttonStackBackView.addSubview(buttonStackView)
        [cancelButton, okButton].forEach {
            buttonStackView.addArrangedSubview($0)
        }
        
        alertView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(size.width.adjusted)
            $0.height.equalTo(size.height.adjusted)
        }
        
        textStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.centerX.equalToSuperview()
            
        }
        
//        titleLabel.snp.makeConstraints {
//            $0.height.equalTo(24)
//        }
        
//        messagelabel.snp.makeConstraints {
//            $0.height.equalTo(40)
//        }
        
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
    
    // MARK: - Custom Method
    
}

