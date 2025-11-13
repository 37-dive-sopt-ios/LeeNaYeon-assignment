//
//  MarketCell.swift
//  sopt-37th-assignment
//
//  Created by 이나연 on 11/14/25.
//

import UIKit

final class MarketViewCell: UICollectionViewCell {
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: MarketCustomLayout.createLayout() )
    
    private var mock: [MarketModel] = []
        
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
        contentView.backgroundColor = .clear
        contentView.addSubview(collectionView)
    }
    
    private func setStyle() {
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(11)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func register() {
        collectionView.register(MarketCell.self, forCellWithReuseIdentifier: MarketCell.identifier)
    }
    private func loadMockData() {
        mock = MarketModel.mockData
        collectionView.reloadData()
    }
}

extension MarketViewCell: UICollectionViewDelegate {
    
}

extension MarketViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        mock.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MarketCell.identifier,
            for: indexPath
        ) as! MarketCell
        cell.bind(cell: mock[indexPath.row])
        return cell
    }
    
    
}
