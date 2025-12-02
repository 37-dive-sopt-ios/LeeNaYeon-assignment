//
//  MyTownViewController.swift
//  sopt-37th-assignment
//
//  Created by 이나연 on 11/14/25.
//

import UIKit

final class MyTownViewCell: UICollectionViewCell {
    private let image = UIImageView()
    private let storeName = UILabel()
    private let menuNameLabel = UILabel()
    private let star = UIImageView()
    private let starCountLabel = UILabel()
    private let reviewCountLabel = UILabel()
    private let discountLabel = UILabel()
    private let priceLabel = UILabel()
    private let originalPriceLabel = UILabel()
    private let describeLabel = UILabel()
    
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
        contentView.backgroundColor = .clear
        contentView.addSubviews(
            image,
            storeName,
            menuNameLabel,
            star,
            starCountLabel,
            reviewCountLabel,
            discountLabel,
            priceLabel,
            originalPriceLabel,
            describeLabel
        )
    }
    
    private func setStyle() {
        image.do {
            $0.contentMode = .scaleAspectFit
            $0.backgroundColor = .baeminGray200
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 8
        }
        
        [storeName, starCountLabel, reviewCountLabel].forEach{
            $0.do {
                $0.textColor = .baeminGray600
                $0.font = FontManager.bodyR14.font
            }
        }
        
        star.do {
            $0.image = .star
        }
        
        menuNameLabel.do {
            $0.font = FontManager.bodyR14.font
            $0.textColor = .baeminBlack
        }
        
        discountLabel.do {
            $0.font = FontManager.headB14.font
            $0.textColor = .baeminRed
        }
        
        priceLabel.do {
            $0.font = FontManager.headB14.font
            $0.textColor = .baeminBlack
        }
        
        originalPriceLabel.do {
            $0.font = FontManager.bodyR12.font
            $0.textColor = .baeminGray600
        }
        
        describeLabel.do {
            $0.text = "최소주문금액 없음"
            $0.font = FontManager.headB13.font
            $0.textColor = .baeminPurple
        }
    }
    
    private func setLayout() {
        image.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.width.height.equalTo(145)
        }
        
        storeName.snp.makeConstraints {
            $0.top.equalTo(image.snp.bottom).offset(9)
            $0.leading.equalToSuperview()
            $0.width.equalTo(69)
        }
        
        star.snp.makeConstraints {
            $0.top.equalTo(storeName).inset(2)
            $0.trailing.equalTo(starCountLabel.snp.leading).offset(-5)
            $0.width.equalTo(11)
            $0.height.equalTo(10)
        }
        
        starCountLabel.snp.makeConstraints {
            $0.top.equalTo(storeName)
            $0.trailing.equalTo(reviewCountLabel.snp.leading).offset(-4)
        }
        
        reviewCountLabel.snp.makeConstraints {
            $0.top.equalTo(storeName)
            $0.trailing.equalToSuperview()
        }
        
        menuNameLabel.snp.makeConstraints {
            $0.top.equalTo(storeName.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview()
        }
        
        discountLabel.snp.makeConstraints {
            $0.top.equalTo(menuNameLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview()
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(menuNameLabel.snp.bottom).offset(6)
            $0.leading.equalTo(discountLabel.snp.trailing).offset(6)
        }
        
        originalPriceLabel.snp.makeConstraints {
            $0.top.equalTo(discountLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview()
        }
        
        describeLabel.snp.makeConstraints {
            $0.top.equalTo(originalPriceLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview()
        }
    }
}

extension MyTownViewCell {
    func bind(model: MyTownModel) {
        self.image.image = model.image
        self.storeName.text = model.store
        self.menuNameLabel.text = model.menu
        self.starCountLabel.text = "\(model.starCount)"
        self.reviewCountLabel.text = "(\(model.review))"
        self.discountLabel.text = "\(model.discount)%"
        self.priceLabel.text = "\(model.price)"
        self.originalPriceLabel.text = "\(model.originalPrice)"
    }
}
