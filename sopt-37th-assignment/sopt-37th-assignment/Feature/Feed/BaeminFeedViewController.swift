//
//  MainViewController.swift
//  sopt-37th-assignment
//
//  Created by 이나연 on 11/5/25.
//

import UIKit

final class BaeminFeedViewController: BaseViewController {
    private let rootView = BaeminFeedView()
    
    override func loadView() {
        view = rootView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
    }
    override func setAddTarget() {
        //        rootView.segementView.segmentedControl.addTarget(self, action: #selector(segmentDidTap(_:)), for: .valueChanged)
    }
    
    override func setDelegate() {
        rootView.collectionView.delegate = self
        rootView.collectionView.dataSource = self
    }
    
    private func register() {
        rootView.collectionView.register(HeaderViewCell.self, forCellWithReuseIdentifier: HeaderViewCell.identifier)
        rootView.collectionView.register(SegmentViewCell.self, forCellWithReuseIdentifier: SegmentViewCell.identifier)
        rootView.collectionView.register(MarketViewCell.self, forCellWithReuseIdentifier: MarketViewCell.identifier)
        rootView.collectionView.register(AdvertisementViewCell.self, forCellWithReuseIdentifier: AdvertisementViewCell.identifier)

    }
}

extension BaeminFeedViewController: UICollectionViewDelegate {
    
}

extension BaeminFeedViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HeaderViewCell.identifier,
                for: indexPath
            ) as! HeaderViewCell
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: SegmentViewCell.identifier,
                        for: indexPath
            ) as! SegmentViewCell
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: MarketViewCell.identifier,
                        for: indexPath
            ) as! MarketViewCell
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AdvertisementViewCell.identifier,
                        for: indexPath
            ) as! AdvertisementViewCell
            return cell

        case 4:
            let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: SegmentViewCell.identifier,
                        for: indexPath
            ) as! SegmentViewCell
            return cell

        case 5:
            let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: SegmentViewCell.identifier,
                        for: indexPath
            ) as! SegmentViewCell
            return cell

        case 6:
            let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: SegmentViewCell.identifier,
                        for: indexPath
            ) as! SegmentViewCell
            return cell

        case 7:
            let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: SegmentViewCell.identifier,
                        for: indexPath
            ) as! SegmentViewCell
            return cell

        default:
            let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: SegmentViewCell.identifier,
                        for: indexPath
            ) as! SegmentViewCell
            return cell


        }
    }
    
    
}
