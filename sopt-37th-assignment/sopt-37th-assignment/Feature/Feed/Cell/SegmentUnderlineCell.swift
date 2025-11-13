//
//  SegmentUnderlineCell.swift
//  sopt-37th-assignment
//
//  Created by 이나연 on 11/13/25.
//

import UIKit

final class SegmentUnderlineCell: UICollectionViewCell {
    private let underlineView = UIView()
    
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
        contentView.addSubviews(underlineView)
    }
    
    private func setLayout() {
        underlineView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setStyle() {
        underlineView.do {
            $0.backgroundColor = .baeminGray300
        }
    }
}
