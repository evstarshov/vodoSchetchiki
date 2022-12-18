//
//  HotWaterCollectionViewCell.swift
//  vodoSchetchiki
//
//  Created by Mac on 07.12.2022.
//

import UIKit

class StatisticsHotWaterCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Privete properties
    
    private lazy var hotWaterLabel: UILabel = {
       let label = UILabel()
        label.backgroundColor = UIColor.labelHotWater
        label.layer.cornerRadius = 15
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Constraction

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    //MARK: - Private functions

    func setupView() {
        backgroundColor = .white
        self.addSubview(hotWaterLabel)
        
        hotWaterLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        hotWaterLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        hotWaterLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        hotWaterLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}


