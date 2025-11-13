//
//  MarketCustomLayout.swift
//  sopt-37th-assignment
//
//  Created by 이나연 on 11/14/25.
//

import UIKit

struct MarketCustomLayout {
    static func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (_, _) in
            return marketFeedSection
        }
    }
    
    static var marketFeedSection: NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .absolute(58),
                heightDimension: .absolute(74)
            )
        )
        
        item.contentInsets = .init(top: 0, leading: 11, bottom: 0, trailing: 11)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .estimated(1),
                heightDimension: .absolute(74)
            ),
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16
        )
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
}
