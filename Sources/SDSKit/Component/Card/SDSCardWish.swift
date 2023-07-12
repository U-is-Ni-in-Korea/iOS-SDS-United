//
//  File.swift
//
//
//  Created by 홍유정 on 2023/07/13.
//

import UIKit
import SnapKit

public class SDSCardWish: UIView {
    
    let wishBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray000
        view.layer.cornerRadius = 10
        return view
    }()
    
    let wishImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .gray100
        return image
    }()
    
    let wishTitleLabel: UILabel = {
        let label = UILabel()
        label.font = SDSFont.body2.font
        label.textColor = .gray600
        return label
    }()
    
    public init(title: String, type: SDSCardWishType) {
        super.init(frame: .zero)
        setLayout()
        setType(title: title, type: type)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        addSubview(wishBackgroundView)
        [wishImageView, wishTitleLabel] .forEach{wishBackgroundView.addSubview($0)}
                
        wishBackgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        wishImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
        }
        wishTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
        }
    }
    
    func setType(title: String, type: SDSCardWishType) {
        switch type{
        case .title:
            
            self.snp.makeConstraints {
                $0.width.equalTo(160)
                $0.height.equalTo(206)
            }
            
            wishImageView.snp.makeConstraints {
                $0.width.height.equalTo(80)
                $0.top.equalToSuperview().offset(28)
            }
            wishTitleLabel.text = title
            wishTitleLabel.isHidden = false
            wishTitleLabel.snp.makeConstraints {
                $0.top.equalTo(wishImageView.snp.bottom).offset(8)
                $0.height.equalTo(40)
            }
        case .noTitle:
            
            self.snp.makeConstraints {
                $0.width.equalTo(160)
                $0.height.equalTo(122)
            }

            wishImageView.snp.makeConstraints {
                $0.width.height.equalTo(40)
                $0.top.equalToSuperview().offset(24)
            }
            wishTitleLabel.isHidden = true
        }
    }
}
