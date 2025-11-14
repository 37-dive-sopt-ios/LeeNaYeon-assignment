//
//  HeaderViewCell.swift
//  sopt-37th-assignment
//
//  Created by 이나연 on 11/12/25.
//

import UIKit

final class HeaderViewCell: UICollectionViewCell {
    private let navigationBar = BaeminFeedNavigationBar()
    private let searchBar = BaeminSearchBar()
    
    private let saleView = UIView()
    private let baeminIcon = UIImageView()
    private let saleLabel = UILabel()
    private let moreButton = UIButton()
    private let gradationView = BaeminGradientView(startColor: .backgroundWhite, endColor: .gradientMint, isStartColorPrimary: false )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        contentView.backgroundColor = .backgroundWhite
        contentView.addSubviews(navigationBar, searchBar, gradationView, saleView)
        saleView.addSubviews(baeminIcon, saleLabel, moreButton)
    }
    
    private func setStyle() {
        contentView.backgroundColor = .backgroundWhite
        baeminIcon.do {
            $0.image = .bmart
            $0.contentMode = .scaleAspectFill
        }
        
        saleLabel.do {
            $0.text = "전상품 쿠폰팩 + 60%특가"
            $0.textColor = .baeminBlack
            $0.font = FontManager.headB16.font
        }
        
        moreButton.do {
            $0.setImage(.chevronRight, for: .normal)
        }
    }
    
    private func setLayout() {
        navigationBar.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        searchBar.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        saleView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(16)
        }
        
        baeminIcon.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(16)
        }
        
        saleLabel.snp.makeConstraints {
            $0.top.equalTo(baeminIcon.snp.bottom).offset(6)
            $0.leading.equalToSuperview()
        }
        
        moreButton.snp.makeConstraints {
            $0.top.equalTo(saleLabel.snp.top).inset(4)
            $0.leading.equalTo(saleLabel.snp.trailing).offset(2)
            $0.width.height.equalTo(12)
        }
        
        gradationView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(65)
        }
    }
}
