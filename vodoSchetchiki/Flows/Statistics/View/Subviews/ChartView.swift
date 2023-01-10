//
//  ChartView.swift
//  vodoSchetchiki
//
//  Created by Mac on 04.01.2023.
//

import UIKit

class ChartView: UIView {
    
    private var xAxisSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var yAxisSeparatop: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func config(with data: [MetersModel]) {
        layoutIfNeeded()
        drawDashLines(with: data)
        drawChartColdMeter(with: data)
        drawChartHotMeter(with: data)
    }
    
    private func setupView() {
        addSubview(xAxisSeparator)
        addSubview(yAxisSeparatop)
        
        NSLayoutConstraint.activate([
            yAxisSeparatop.leadingAnchor.constraint(equalTo: leadingAnchor),
            yAxisSeparatop.topAnchor.constraint(equalTo: topAnchor),
            yAxisSeparatop.bottomAnchor.constraint(equalTo: bottomAnchor),
            yAxisSeparatop.widthAnchor.constraint(equalToConstant: 1),
            
            
            xAxisSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            xAxisSeparator.heightAnchor.constraint(equalToConstant: 1),
            xAxisSeparator.trailingAnchor.constraint(equalTo: trailingAnchor),
            xAxisSeparator.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension ChartView {
    
    func drawDashLines(with data: [MetersModel]) {

        let maxHeight = data
            .max { first, second in first.coldMeter < second.coldMeter}

        (0..<(Int(maxHeight?.coldMeter ?? "0") ?? 0)).map { CGFloat($0) }.forEach {
            drawDashLine(at: bounds.height / CGFloat(Double(maxHeight?.coldMeter ?? "0") ?? 0) * $0)
        }
    }
    
    func drawDashLine(at yPosition: CGFloat) {

        let startPoint = CGPoint(x: 0, y: yPosition)
        let endPoint = CGPoint(x: bounds.width, y: yPosition)
        
        let dashPath = CGMutablePath()
        dashPath.addLines(between: [startPoint, endPoint])
        
        let dashLayer = CAShapeLayer()
        dashLayer.path = dashPath
        dashLayer.strokeColor = UIColor.separatop.cgColor
        dashLayer.lineWidth = 1
        dashLayer.lineDashPattern = [6, 3]
        
        layer.addSublayer(dashLayer)
    }
    
    
    func drawChartColdMeter(with data: [MetersModel]) {
        
        let maxColdMeter = data
            .filter({ Int($0.coldMeter) ?? 0 > 10})
            .max { first, second in first.coldMeter < second.coldMeter}
 
        let valuePoints = data.enumerated().map { CGPoint(x: CGFloat($0), y:  CGFloat(Double($1.coldMeter) ?? 0)) }
        let chartHeight = bounds.height / CGFloat(Int(maxColdMeter?.coldMeter ?? "0") ?? 0)
        
        let points = valuePoints.map {
            let x = (bounds.width - 15) / CGFloat(valuePoints.count - 1) * $0.x
            let y = (bounds.height - $0.y * chartHeight)
            return CGPoint(x: x, y: y)
        }
        
        let chartPath = UIBezierPath()
        chartPath.move(to: points[0])
        
        points.forEach {
            chartPath.addLine(to: $0)
            drowChartColdDot(at: $0)
        }
        
        let chartLayer = CAShapeLayer()
        chartLayer.path = chartPath.cgPath
        chartLayer.strokeColor = UIColor.labelColdWater.cgColor
        chartLayer.fillColor = UIColor.clear.cgColor
        chartLayer.lineWidth = 3
        chartLayer.strokeEnd = 1
        chartLayer.lineCap = .round
        chartLayer.lineJoin = .round
        
        layer.addSublayer(chartLayer)
    }
    
    func drowChartColdDot(at point: CGPoint) {
        let dotPath = UIBezierPath()
        dotPath.move(to: point)
        dotPath.addLine(to: point)
        
        let dotLayer = CAShapeLayer()
        dotLayer.path = dotPath.cgPath
        dotLayer.strokeColor = UIColor.labelColdWater.cgColor
        dotLayer.lineCap = .round
        dotLayer.lineWidth = 10
        
        layer.addSublayer(dotLayer)
        
    }
    
    func drawChartHotMeter(with data: [MetersModel]) {
        
         let hotMeter = data
            .filter({ Int($0.hotMeter) ?? 0 > 10})
            .max { first, second in first.hotMeter < second.hotMeter}
 
        let valuePoints = data.enumerated().map { CGPoint(x: CGFloat($0), y:  CGFloat(Double($1.hotMeter) ?? 0)) }
        let chartHeight = bounds.height / CGFloat(Int(hotMeter?.hotMeter ?? "0") ?? 0)

        let points = valuePoints.map {
            let x = (bounds.width - 15) / CGFloat(valuePoints.count - 1) * $0.x
            let y = bounds.height - $0.y * chartHeight
            return CGPoint(x: x, y: y)
        }
        
        let chartPath = UIBezierPath()
        chartPath.move(to: points[0])
        
        points.forEach {
            chartPath.addLine(to: $0)
            drowChartHotDot(at: $0)
        }
        
        let chartLayer = CAShapeLayer()
        chartLayer.path = chartPath.cgPath
        chartLayer.strokeColor = UIColor.labelHotWater.cgColor
        chartLayer.fillColor = UIColor.clear.cgColor
        chartLayer.lineWidth = 3
        chartLayer.strokeEnd = 1
        chartLayer.lineCap = .round
        chartLayer.lineJoin = .round
        
        layer.addSublayer(chartLayer)
    }
    
    func drowChartHotDot(at point: CGPoint) {
        let dotPath = UIBezierPath()
        dotPath.move(to: point)
        dotPath.addLine(to: point)
        
        let dotLayer = CAShapeLayer()
        dotLayer.path = dotPath.cgPath
        dotLayer.strokeColor = UIColor.labelHotWater.cgColor
        dotLayer.lineCap = .round
        dotLayer.lineWidth = 10
        
        layer.addSublayer(dotLayer)
        
    }
}

