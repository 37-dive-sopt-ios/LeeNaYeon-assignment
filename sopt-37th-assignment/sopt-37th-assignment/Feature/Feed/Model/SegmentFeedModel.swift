//
//  SegmentModel.swift
//  sopt-37th-assignment
//
//  Created by 이나연 on 11/13/25.
//

import Foundation
import UIKit

struct SegmentHeaderModel {
    let title: String
    
    static let mockData: [SegmentHeaderModel] = [
        SegmentHeaderModel(title: "음식배달"),
        SegmentHeaderModel(title: "픽업"),
        SegmentHeaderModel(title: "장보기·쇼핑"),
        SegmentHeaderModel(title: "선물하기"),
        SegmentHeaderModel(title: "혜택모아보기"),
        
    ]
}
struct SegmentFeedModel {
    let img: UIImage
    let menu: String
    
    static let mockData: [SegmentFeedModel] = [
        SegmentFeedModel(img: .ganadi1, menu: "한그릇"),
        SegmentFeedModel(img: .ganadi2, menu: "치킨"),
        SegmentFeedModel(img: .ganadi3, menu: "카페·디저트"),
        SegmentFeedModel(img: .ganadi4, menu: "피자"),
        SegmentFeedModel(img: .ganadi5, menu: "분식"),
        SegmentFeedModel(img: .ganadi1, menu: "고기"),
        SegmentFeedModel(img: .ganadi2, menu: "찜·탕"),
        SegmentFeedModel(img: .ganadi3, menu: "야식"),
        SegmentFeedModel(img: .ganadi4, menu: "패스트푸드"),
        SegmentFeedModel(img: .ganadi5, menu: "픽업"),
    ]
}
