//
//  StatisticsView.swift
//  vodoSchetchiki
//
//  Created by Mac on 16.11.2022.
//

import UIKit

class ColdStatisticsCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Privete properties
    
    private lazy var coldWaterLabel: UILabel = {
       let label = UILabel()
        label.backgroundColor = UIColor.labelColdWater
        label.layer.cornerRadius = 5
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
        backgroundColor = .black
        addSubview(coldWaterLabel)
        
        coldWaterLabel.topAnchor.constraint(equalTo: topAnchor, constant: 110).isActive = true
        coldWaterLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        coldWaterLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -5).isActive = true
        coldWaterLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
}


