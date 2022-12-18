//
//  StatisticsView.swift
//  vodoSchetchiki
//
//  Created by Mac on 12.12.2022.
//

import UIKit

class StatisticsView: UIView {
    
    //MARK: - Private prorperties
    
    private let dataSourse = StatisticsCollectionViewDataSourse(reuseIndetifier: "Cold")
    
    private let coldStatisticCollectionView: StatisticsCollectionView = {
        let layout = StatisticFlowLayout()
        let view = StatisticsCollectionView(frame: .zero, collectionViewLayout: layout)
        return view
    }()
    
    //MARK: - Constraction

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        coldStatisticCollectionView.register(StatisticsColdWaterCollectionViewCell.self, forCellWithReuseIdentifier: "Cold")

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    //MARK: - Private functions
    
    private func setupView() {
        backgroundColor = .white
        addSubview(coldStatisticCollectionView)
                
        NSLayoutConstraint.activate([
            coldStatisticCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            coldStatisticCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            coldStatisticCollectionView.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -10),
            coldStatisticCollectionView.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -100),
        ])
        
        coldStatisticCollectionView.delegate = self
        coldStatisticCollectionView.dataSource = dataSourse
    }
}

//MARK: - Extention

extension StatisticsView: UICollectionViewDelegate {
    
}
