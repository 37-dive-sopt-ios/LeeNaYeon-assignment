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
    }
    
    override func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
