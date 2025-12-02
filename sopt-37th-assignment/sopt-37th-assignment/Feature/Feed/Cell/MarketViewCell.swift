//
//  MarketCell.swift
//  sopt-37th-assignment
//
//  Created by 이나연 on 11/14/25.
//

import UIKit

final class MarketViewCell: UICollectionViewCell {
    private let image = UIImageView()
    private let title = UILabel()
        
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
        contentView.addSubviews(image, title)
    }
    
    private func setStyle() {
        image.do {
            $0.backgroundColor = .baeminGray200
            $0.layer.cornerRadius = 20
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFit
        }
        
        title.do {
            $0.textColor = .baeminBlack
            $0.font = FontManager.bodyR14.font
        }
    }
    
    private func setLayout() {
        image.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(54)
        }
        
        title.snp.makeConstraints {
            $0.top.equalTo(image.snp.bottom).offset(6)
            $0.centerX.equalToSuperview()
        }
    }
}
extension MarketViewCell {
    func bind(model: MarketModel) {
        self.image.image = model.image
        self.title.text = model.title
    }
}
