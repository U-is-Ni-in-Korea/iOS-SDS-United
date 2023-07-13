//
//  File.swift
//
//
//  Created by 홍유정 on 2023/07/13.
//

import UIKit
import SnapKit

public class SDSTextfield: UIView {
        
    lazy var sdsTextfield: UITextField = {
        let textfield = UITextField()
        textfield.layer.cornerRadius = 10
        textfield.font = SDSFont.body2.font
        textfield.backgroundColor = .gray000
        textfield.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 15.0, height: 0.0)) //왼쪽 여백 주기
        textfield.leftViewMode = .always
        textfield.addTarget(self, action: #selector(self.textfieldDidChange(_:)), for: .editingChanged)
        return textfield
    }()
    
    lazy var textfieldCountLabel: UILabel = {
        let label = UILabel()
        label.text = "0/10"
        label.textColor = .gray400
        label.font = SDSFont.caption.font
        return label
    }()
    
    lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.text = "Error message"
        label.font = SDSFont.caption.font
        label.textColor = .red500
        label.isHidden = true
        return label
    }()

    public init(placeholder: String) {
        super.init(frame: .zero)
        sdsTextfield.delegate = self
        sdsTextfield.placeholder = placeholder
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout() {
        [sdsTextfield, errorLabel, textfieldCountLabel].forEach{ addSubview($0)}

        self.snp.makeConstraints {
            $0.width.equalTo(328)
            $0.height.equalTo(48)
        }
        
        sdsTextfield.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        errorLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(sdsTextfield.snp.bottom).offset(4)
        }
        textfieldCountLabel.snp.makeConstraints {
            $0.top.equalTo(sdsTextfield.snp.bottom).offset(4)
            $0.trailing.equalTo(sdsTextfield.snp.trailing)
        }
    }
    
    func setTextfieldType() {
        
    }
}

extension SDSTextfield: UITextFieldDelegate {

    public func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.lightBlue500.cgColor
        textField.layer.borderWidth = 1
    }

    @objc public func textfieldDidChange(_ sender: Any) {
        if sdsTextfield.text!.count > 10 {
            sdsTextfield.deleteBackward()
            sdsTextfield.layer.borderColor = UIColor.red500.cgColor
            sdsTextfield.layer.borderWidth = 1
            errorLabel.isHidden = false
        } else {
            sdsTextfield.layer.borderColor = UIColor.lightBlue500.cgColor
            errorLabel.isHidden = true
        }
        textfieldCountLabel.text = "\(sdsTextfield.text!.count)/10"
    }

    public func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.gray200.cgColor
        textField.layer.borderWidth = 1
    }
}
