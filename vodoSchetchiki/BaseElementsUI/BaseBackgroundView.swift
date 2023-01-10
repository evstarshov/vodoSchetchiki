//
//  BaseBackgroundView.swift
//  vodoSchetchiki
//
//  Created by Mac on 10.01.2023.
//

import UIKit

class BaseBackgroundView: UIView {
    
    private let startColor: UIColor = .mainGradientStart
    private let endColor: UIColor = .mainGradientFinish
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension BaseBackgroundView {
    
    override func draw(_ rect: CGRect) {

        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        let colors = [startColor.cgColor, endColor.cgColor]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colorLocations: [CGFloat] = [0.0, 1.0]
        
        guard let gradient = CGGradient(
            colorsSpace: colorSpace,
            colors: colors as CFArray,
            locations: colorLocations
        ) else {
            return
        }
        
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x: 0, y: 500)
        context.drawLinearGradient(
            gradient,
            start: startPoint,
            end: endPoint,
            options: []
        )
    }
}

