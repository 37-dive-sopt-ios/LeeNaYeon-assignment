//
//  AdvertisementViewCell.swift
//  sopt-37th-assignment
//
//  Created by 이나연 on 11/14/25.
//

import UIKit

final class AdvertisementViewCell: UICollectionViewCell {
    private let image = UIImageView()
        
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
        contentView.addSubviews(image)
    }
    
    private func setStyle() {
        image.do {
            $0.contentMode = .scaleAspectFill
        }
    }
    
    private func setLayout() {
        image.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension AdvertisementViewCell {
    func bind(model: AdvertisementModel) {
        self.image.image = model.image
    }
}
