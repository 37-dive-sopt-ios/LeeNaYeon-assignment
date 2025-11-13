//
//  AdvertisementViewCell.swift
//  sopt-37th-assignment
//
//  Created by 이나연 on 11/14/25.
//

import UIKit

final class AdvertisementViewCell: UICollectionViewCell {
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: AdvertisementCustomLayout.createLayout())
    
    private var mock: [AdvertisementModel] = []
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setStyle()
        setLayout()
        setDelegate()
        register()
        loadMockData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        contentView.addSubview(collectionView)
    }
    
    private func setStyle() {
        collectionView.do {
            $0.contentInsetAdjustmentBehavior = .never
            $0.isPagingEnabled = true
        }
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(10)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func register() {
        collectionView.register(AdvertisementEachCell.self, forCellWithReuseIdentifier: AdvertisementEachCell.identifier)
    }
    private func loadMockData() {
        mock = AdvertisementModel.mockData
        collectionView.reloadData()
    }
}

extension AdvertisementViewCell: UICollectionViewDelegate {
    
}

extension AdvertisementViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        mock.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AdvertisementEachCell.identifier,
            for: indexPath
        ) as! AdvertisementEachCell
        cell.bind(cell: mock[indexPath.row])
        return cell
    }
    
    
}
