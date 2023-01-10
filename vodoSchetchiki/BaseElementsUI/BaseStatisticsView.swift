//
//  BaseView.swift
//  vodoSchetchiki
//
//  Created by Mac on 06.01.2023.
//

import UIKit

private enum Constants {
    static let cornerRadiusSize = CGSize(width: 10.0, height: 10.0)
    static let margin: CGFloat = 20.0
    static let topBorder: CGFloat = 60
    static let bottomBorder: CGFloat = 50
    static let colorAlpha: CGFloat = 0.3
    static let circleDiameter: CGFloat = 5.0
}

class BaseStatisticsView: UIView {
    
    private let startColor: UIColor = .maimViewGradientStartColor
    private let endColor: UIColor = .mainViewGradientEndColor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension BaseStatisticsView {
    
    override func draw(_ rect: CGRect) {
        
        let path = UIBezierPath(
          roundedRect: rect,
          byRoundingCorners: .allCorners,
          cornerRadii: Constants.cornerRadiusSize
        )
        path.addClip()
        
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
