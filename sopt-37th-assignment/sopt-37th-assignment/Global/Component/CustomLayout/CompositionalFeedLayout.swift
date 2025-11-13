//
//  CompositionalFeedLayout.swift
//  sopt-37th-assignment
//
//  Created by 이나연 on 11/13/25.
//

import UIKit

struct CompositionalFeedLayout {
    static func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, _ environment) ->
            NSCollectionLayoutSection in
            switch sectionNumber {
            case 0: feedHeaderSection
            case 1: feedUnderLineSection
            case 2: feedContentSection
            default: feedContentSection
            }
        }
    }
    
    static var feedHeaderSection : NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .estimated(1),
                heightDimension: .absolute(51)
            )
        )
        
        item.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .estimated(1),
                heightDimension: .absolute(51)
            ),
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 3, trailing: 0
        )
        
        return section
    }
    
    static var feedUnderLineSection : NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(1)
            )
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(1)
            ),
            subitems: [item]
        )
        
        
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    static var feedContentSection : NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .absolute(62),
                heightDimension: .absolute(78)
            )
        )
        item.contentInsets = .init(top: 0, leading: 18, bottom: 0, trailing: 18)
        
        let horizontalGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(78)
            ),
            repeatingSubitem: item,
            count: 5
        )
        
        horizontalGroup.interItemSpacing = .fixed(8)
        
        let verticalGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .estimated(78 * 2)
            ),
            subitems: [horizontalGroup, horizontalGroup]
        )
        verticalGroup.interItemSpacing = .fixed(12)
        
        let section = NSCollectionLayoutSection(group: verticalGroup)
        section.contentInsets = .init(top: 12, leading: 18, bottom: 0, trailing: 18)
        
        return section
    }
}
