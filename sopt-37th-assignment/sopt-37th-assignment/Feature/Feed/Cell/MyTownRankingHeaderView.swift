//
//  MyTownRankingHeaderView.swift
//  sopt-37th-assignment
//
//  Created by 이나연 on 11/14/25.
//

import UIKit

final class MyTownRankingHeaderView: UICollectionReusableView {
    static let identifier = "MyTownRankingHeaderView"

    private let title = UILabel()
    private let infoButton = UIButton()
    private let allLabel = UILabel()
    private let moreButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubviews(title, infoButton, allLabel, moreButton)
    }
    
    private func setLayout() {
        title.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalToSuperview().inset(10)
        }
        
        infoButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(25)
            $0.leading.equalTo(title.snp.trailing).offset(3)
            $0.width.height.equalTo(16)
        }
        
        allLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.trailing.equalTo(moreButton.snp.leading).offset(-4)
            
        }
        
        moreButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(25)
            $0.trailing.equalToSuperview().inset(10)
            $0.width.height.equalTo(12)
        }
    }
    
    private func setStyle() {
        title.do {
            $0.text = "우리 동네 한그릇 인기 랭킹"
            $0.font = FontManager.titleSb18.font
            $0.textColor = .baeminWhite
        }
        
        infoButton.do {
            $0.setImage(.info.withRenderingMode(.alwaysTemplate), for: .normal)
            $0.tintColor = .baeminWhite
        }
        
        allLabel.do {
            $0.text = "전체 보기"
            $0.font = FontManager.bodyR14.font
            $0.textColor = .baeminWhite
        }
        
        moreButton.do {
            $0.setImage(.chevronRight.withRenderingMode(.alwaysTemplate), for: .normal)
            $0.tintColor = .baeminWhite
        }
    }
}
