//
//  TestViewController.swift
//  vodoSchetchiki
//
//  Created by Mac on 06.12.2022.
//

import UIKit

class StatisticsViewController: UIViewController {
    
    //MARK: - Private properties
    
    private let dataSourse = StatisticsCollectionViewDataSourse(reuseIndetifier: "Cold")
    
    private let coldStatisticCollectionView: UICollectionView = {
        let layout = StatisticFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.register(ColdStatisticsCollectionViewCell.self, forCellWithReuseIdentifier: "Cold")
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    private let hotStatisticCollectionView: UICollectionView = {
        let layout = StatisticFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.register(HotWaterCollectionViewCell.self, forCellWithReuseIdentifier: Indentifier.indentifierHotStatisticCollectionView)
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    //MARK: - Constraction
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        coldSetupCollectionView()
        coldStatisticCollectionView.register(ColdStatisticsCollectionViewCell.self, forCellWithReuseIdentifier: "Cold")

    }
    
    //MARK: - Private functions

    private func coldSetupCollectionView() {
        view.addSubview(coldStatisticCollectionView)
//        view.addSubview(hotStatisticCollectionView)
        
        NSLayoutConstraint.activate([
            coldStatisticCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            coldStatisticCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            coldStatisticCollectionView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -10),
            coldStatisticCollectionView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            
//            hotStatisticCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
//            hotStatisticCollectionView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
//            hotStatisticCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
//            hotStatisticCollectionView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -100)
        ])
        
        coldStatisticCollectionView.delegate = self
        coldStatisticCollectionView.dataSource = dataSourse
//        hotStatisticCollectionView.delegate = self
//        hotStatisticCollectionView.dataSource = dataSourse
    }
}

//MARK: - Extentions

extension StatisticsViewController: UICollectionViewDelegate {
    


}
