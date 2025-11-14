//
//  BaeminGradientView.swift
//  sopt-37th-assignment
//
//  Created by 이나연 on 11/5/25.
//

import UIKit

final class BaeminGradientView: UIView {
    private let startColor: UIColor
    private let endColor: UIColor
    private let gradient: CAGradientLayer = CAGradientLayer()
    private let isStartColorPrimary: Bool
    init(
        startColor: UIColor,
        endColor: UIColor,
        isStartColorPrimary: Bool
    ) {
        self.startColor = startColor
        self.endColor = endColor
        self.isStartColorPrimary = isStartColorPrimary
        super.init(frame: .zero)
        
        setGradient()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setGradient() {
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = isStartColorPrimary ? CGPoint(x: 0.5, y: 0.4) : CGPoint(x: 0.5, y: 1.0)
        gradient.frame = bounds
        layer.addSublayer(gradient)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = bounds
    }
}
