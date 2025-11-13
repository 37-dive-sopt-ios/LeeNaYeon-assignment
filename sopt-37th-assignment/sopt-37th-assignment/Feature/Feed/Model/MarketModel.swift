//
//  MarketModel.swift
//  sopt-37th-assignment
//
//  Created by 이나연 on 11/14/25.
//

import Foundation
import UIKit

struct MarketModel {
    let image: UIImage
    let title: String
    
    static let mockData: [MarketModel] = [
        MarketModel(image: .ganadi1, title: "B마트"),
        MarketModel(image: .ganadi2, title: "CU"),
        MarketModel(image: .ganadi3, title: "이마트 슈퍼"),
        MarketModel(image: .ganadi4, title: "홈플러스"),
        MarketModel(image: .ganadi5, title: "GS25"),
        MarketModel(image: .ganadi1, title: "이마트")
    ]
}
