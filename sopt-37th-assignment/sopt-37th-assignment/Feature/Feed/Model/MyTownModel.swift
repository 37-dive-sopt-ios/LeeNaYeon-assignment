//
//  MyTownModel.swift
//  sopt-37th-assignment
//
//  Created by 이나연 on 11/14/25.
//

import Foundation
import UIKit

struct MyTownModel {
    let image: UIImage
    let store: String
    let menu: String
    let starCount: Float
    let review: Int
    let discount: Int
    let price: String
    let originalPrice: String
    
    static let mockData: [MyTownModel] = [
        MyTownModel(image: .ganadi1, store: "탕화쿵푸", menu: "마라탕", starCount: 5.0, review: 43, discount: 10, price: "7000원", originalPrice: "10,000원"),
        MyTownModel(image: .ganadi2, store: "홍곱창", menu: "데리야끼막창", starCount: 4.9, review: 25, discount: 20, price: "13,000원", originalPrice: "18,000원"),
        MyTownModel(image: .ganadi3, store: "어바웃샤브", menu: "샤브샤브 1인분", starCount: 4.5, review: 18, discount: 15, price: "7000원", originalPrice: "10,000원"),
        MyTownModel(image: .ganadi4, store: "스타벅스", menu: "토피넛라떼", starCount: 4.5, review: 65, discount: 5, price: "7000원", originalPrice: "10,000원")
    ]
}
