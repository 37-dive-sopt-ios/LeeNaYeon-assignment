//
//  MainView.swift
//  sopt-37th-assignment
//
//  Created by 이나연 on 11/5/25.
//

import UIKit

final class BaeminFeedView: BaseView {
    
    let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: CustomCompositionalLayout.createLayout()
    )
    
    override func setUI() {
        addSubviews(collectionView)
    }
    
    override func setStyle() {
        backgroundColor = .backgroundWhite
        collectionView.do {
            $0.backgroundColor = .baeminWhite
        }
    }
    
    override func setLayout() {
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
