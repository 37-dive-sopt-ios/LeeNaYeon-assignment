//
//  CustomCompositionalLayout.swift
//  sopt-37th-assignment
//
//  Created by 이나연 on 11/12/25.
//

import UIKit

struct CustomCompositionalLayout {
    static func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionNumber, _ environment) -> NSCollectionLayoutSection? in
            switch sectionNumber {
            case 0: return headerSection
            case 1: return segmentSection
            case 2: return marketSection
            case 3: return advertisementSection
            case 4: return myTownSection
            default: return segmentSection
            }
        }
        
        layout.register(
            MyTownGradientView.self,
            forDecorationViewOfKind: MyTownGradientView.identifier
        )
        return layout
    }

    static var headerSection: NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(163)
        ))
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(163)
            ),
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
    
    static var segmentSection: NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(300)),
            subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 0, bottom: 20, trailing: 0)
        return section
    }
    
    static var marketSection: NSCollectionLayoutSection {
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
                heightDimension: .absolute(116)
            ),
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 10, trailing: 16
        )
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    static var advertisementSection: NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(114)
            )
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(114)
            ),
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 40, leading: 0, bottom: 80, trailing: 0)
        return section
    }
    
    static var myTownSection: NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .absolute(145),
                heightDimension: .absolute(243)
            )
        )
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .estimated(1),
                heightDimension: .absolute(243)
            ),
            subitems: [item]
        )
        
        group.interItemSpacing = .fixed(10)
        
        let section = NSCollectionLayoutSection(group: group)
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(60)
            ),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        let background = NSCollectionLayoutDecorationItem.background(
            elementKind: MyTownGradientView.identifier
        )
        
        section.decorationItems = [background]
        section.boundarySupplementaryItems = [header]
        section.contentInsets = .zero
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets.bottom = 80
        return section
    }
}
