//
//  SegmentFeedCell.swift
//  sopt-37th-assignment
//
//  Created by 이나연 on 11/13/25.
//

import UIKit

final class SegmentFeedCell: UICollectionViewCell {
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    
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
        contentView.addSubviews(imageView, titleLabel)
    }
    
    private func setLayout() {
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(58)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(6)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func setStyle() {        
        imageView.do {
            $0.backgroundColor = .baeminGray200
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 20
        }
        
        titleLabel.do {
            $0.textColor = .baeminBlack
            $0.font = FontManager.bodyR14.font
        }
    }
}

extension SegmentFeedCell {
    func bind(cell: SegmentFeedModel) {
        self.imageView.image = cell.img
        self.titleLabel.text = cell.menu
    }
}
