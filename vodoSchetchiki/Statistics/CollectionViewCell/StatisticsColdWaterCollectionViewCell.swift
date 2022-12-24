//
//  StatisticsView.swift
//  vodoSchetchiki
//
//  Created by Mac on 16.11.2022.
//

import UIKit

class StatisticsColdWaterCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Privete properties
    private var coldDynamicConstraints = CGFloat()
    private var hotDynamicConstraints = CGFloat()
    
    private lazy var coldWaterLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.labelColdWater
        label.layer.cornerRadius = 6
        label.textAlignment = .center
        label.textColor = .white
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var hotWaterLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.labelHotWater
        label.layer.cornerRadius = 6
        label.textAlignment = .center
        label.textColor = .white
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Constraction
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Fatal error")
    }
    
    func configureCell(_ withModel: MetersModel) {
        coldWaterLabel.text = withModel.coldMeter
        hotWaterLabel.text = withModel.hotMeter
        
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.coldDynamicConstraints = Double(withModel.coldMeter).map { CGFloat($0) }!
            self.hotDynamicConstraints = Double(withModel.hotMeter).map { CGFloat($0) }!
            self.coldWaterLabel.heightAnchor.constraint(equalToConstant: ((self.coldDynamicConstraints * 10) + 80)).isActive = true
            self.hotWaterLabel.heightAnchor.constraint(equalToConstant: ((self.hotDynamicConstraints * 10) + 80)).isActive = true
            self.updateConstraintsIfNeeded()
        }
    }
    
    //MARK: - Private functions
    
    func setupView() {
        backgroundColor = .white
        addSubview(coldWaterLabel)
        addSubview(hotWaterLabel)
        
        coldWaterLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        coldWaterLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -5).isActive = true
        coldWaterLabel.bottomAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        hotWaterLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        hotWaterLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -5).isActive = true
        hotWaterLabel.topAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        
        
        
        
    }
}


