//
//  MainViewController.swift
//  sopt-37th-assignment
//
//  Created by 이나연 on 11/5/25.
//

import UIKit

final class BaeminFeedViewController: BaseViewController {
    private let rootView = BaeminFeedView()
    
    private var marketMock: [MarketModel] = []
    private var advertisementMock: [AdvertisementModel] = []
    private var townMock: [MyTownModel] = []
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMockData()
        register()
        rootView.collectionView.contentInsetAdjustmentBehavior = .never
        navigationController?.navigationBar.isHidden = true
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
        rootView.collectionView.register(MyTownViewCell.self, forCellWithReuseIdentifier: MyTownViewCell.identifier)
        
        rootView.collectionView.register(MyTownRankingHeaderView.self,
                                         forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                         withReuseIdentifier: MyTownRankingHeaderView.identifier
        )
    }
    
    private func loadMockData() {
        marketMock = MarketModel.mockData
        advertisementMock = AdvertisementModel.mockData
        townMock = MyTownModel.mockData
        rootView.collectionView.reloadData()
    }
}

extension BaeminFeedViewController: UICollectionViewDelegate {
    
}

extension BaeminFeedViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return 1
        case 2: return marketMock.count
        case 3: return advertisementMock.count
        case 4: return townMock.count
        default : return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView
    {
        switch indexPath.section {
        case 4:
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: MyTownRankingHeaderView.identifier,
                for: indexPath
            ) as! MyTownRankingHeaderView
            return header
            
        default:
            return UICollectionReusableView()
        }
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
            cell.bind(model: marketMock[indexPath.row])
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AdvertisementViewCell.identifier,
                for: indexPath
            ) as! AdvertisementViewCell
            cell.bind(model: advertisementMock[indexPath.row])
            return cell
        case 4:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MyTownViewCell.identifier,
                for: indexPath
            ) as! MyTownViewCell
            cell.bind(model: townMock[indexPath.row])
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
