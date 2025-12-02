//
//  SegmentTitleCell.swift
//  sopt-37th-assignment
//
//  Created by 이나연 on 11/13/25.
//

import UIKit

final class SegmentTitleCell: UICollectionViewCell {
    private let titleLabel = UILabel()
    private let selectedUnderline = UIView()
    private var isSelectedSegment: Bool = false {
        didSet {
            updateCellStyle()
        }
    }
    
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
        contentView.addSubviews(titleLabel, selectedUnderline)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        
        selectedUnderline.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(13)
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalTo(titleLabel)
            $0.height.equalTo(3)
        }
    }
    
    private func setStyle() {
        titleLabel.do {
            $0.font = isSelectedSegment ? FontManager.headB18.font : FontManager.titleSb18.font
            $0.textColor = isSelectedSegment ? .baeminBlack : .baeminGray300
        }
        
        selectedUnderline.do {
            $0.backgroundColor = .baeminBlack
            $0.isHidden = true
        }
    }
    
    private func updateCellStyle() {
        titleLabel.textColor = isSelectedSegment ? .baeminBlack : .baeminGray300
        titleLabel.font = isSelectedSegment ? FontManager.headB18.font : FontManager.titleSb18.font
        selectedUnderline.isHidden = !isSelectedSegment
    }
}

extension SegmentTitleCell {
    func bind(cell: SegmentHeaderModel, isSelected: Bool) {
        self.titleLabel.text = cell.title
        self.isSelectedSegment = isSelected 
    }
}
