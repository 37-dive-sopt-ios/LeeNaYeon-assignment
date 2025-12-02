//
//  SegmentEmptyCell.swift
//  sopt-37th-assignment
//
//  Created by 이나연 on 11/14/25.
//

import UIKit

final class SegmentEmptyCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .baeminWhite
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
