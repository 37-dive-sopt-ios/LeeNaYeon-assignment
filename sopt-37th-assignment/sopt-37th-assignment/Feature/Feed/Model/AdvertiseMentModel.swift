//
//  AdvertiseMentModel.swift
//  sopt-37th-assignment
//
//  Created by 이나연 on 11/14/25.
//

import Foundation
import UIKit

struct AdvertisementModel {
    let image: UIImage
    
    static let mockData: [AdvertisementModel] = [
        AdvertisementModel(image: .ad1),
        AdvertisementModel(image: .ad2),
        AdvertisementModel(image: .ad1),
        AdvertisementModel(image: .ad2)
    ]
}
