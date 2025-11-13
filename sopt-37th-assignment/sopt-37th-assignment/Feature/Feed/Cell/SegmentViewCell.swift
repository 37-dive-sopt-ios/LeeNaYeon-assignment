//
//  SegmentViewCell.swift
//  sopt-37th-assignment
//
//  Created by 이나연 on 11/13/25.
//

import UIKit

final class SegmentViewCell: UICollectionViewCell {
    private let segmentCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: SegmentFeedCustomLayout.createLayout()
    )
    
    private let divider = UIView()
    private let moreStackView = UIStackView()
    private let moreLabel = UILabel()
    private let moreButton = UIButton()
    
    private var selectedIndex = 0
    
    private var headerMock: [SegmentHeaderModel] = []
    private var feedMock: [SegmentFeedModel] = []
    
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
        contentView.addSubviews(segmentCollectionView, divider, moreStackView)
        moreStackView.addArrangedSubviews(moreLabel, moreButton)
    }
    
    private func setLayout() {
        segmentCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(238)
        }
        
        divider.snp.makeConstraints {
            $0.top.equalTo(segmentCollectionView.snp.bottom).offset(21)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        moreStackView.snp.makeConstraints {
            $0.top.equalTo(divider.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func setStyle() {
        self.do {
            $0.layer.cornerRadius = 20
            $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            $0.layer.masksToBounds = true
        }
        
        divider.do {
            $0.backgroundColor = .baeminGray200
        }
        
        moreStackView.do {
            $0.spacing = 4
        }
        
        moreLabel.do {
            $0.text = "음식배달에서 더보기"
            $0.font = FontManager.bodyR14.font
        }
        
        moreButton.do {
            $0.setImage(.chevronRight, for: .normal)
        }
    }
    
    private func register() {
        segmentCollectionView.register(SegmentTitleCell.self, forCellWithReuseIdentifier: SegmentTitleCell.identifier)
        segmentCollectionView.register(SegmentUnderlineCell.self, forCellWithReuseIdentifier: SegmentUnderlineCell.identifier)
        segmentCollectionView.register(SegmentFeedCell.self, forCellWithReuseIdentifier: SegmentFeedCell.identifier)
    }
    
    private func setDelegate() {
        segmentCollectionView.delegate = self
        segmentCollectionView.dataSource = self
    }
    
    private func loadMockData() {
        headerMock = SegmentHeaderModel.mockData
        feedMock = SegmentFeedModel.mockData
        segmentCollectionView.reloadData()
    }
}

extension SegmentViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        collectionView.reloadSections(IndexSet(integer: 0))
    }
}

extension SegmentViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return headerMock.count
        case 1: return 1
        case 2: return feedMock.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SegmentTitleCell.identifier,
                for: indexPath
            ) as! SegmentTitleCell
            cell.bind(cell: headerMock[indexPath.row], isSelected: indexPath.row == selectedIndex)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SegmentUnderlineCell.identifier,
                for: indexPath
            ) as! SegmentUnderlineCell
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SegmentFeedCell.identifier,
                for: indexPath
            ) as! SegmentFeedCell
            cell.bind(cell: feedMock[indexPath.row])
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SegmentFeedCell.identifier,
                for: indexPath
            ) as! SegmentFeedCell
            return cell
        }
    }
}
 
