//
//  MyTownGradientView.swift
//  sopt-37th-assignment
//
//  Created by 이나연 on 11/14/25.
//

import UIKit

final class MyTownGradientView: UICollectionReusableView {
    static let identifier = "MyTownGradientView"
    
    private let gradientView = BaeminGradientView(
        startColor: .baeminGradientPurple,
        endColor: .white,
        isStartColorPrimary: true
    )

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(gradientView)
        gradientView.frame = bounds
//        gradientView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
