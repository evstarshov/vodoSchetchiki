//
//  StatisticsView.swift
//  vodoSchetchiki
//
//  Created by Mac on 12.12.2022.
//

import UIKit

class StatisticsView: UIView {
    
    //MARK: - Private prorperties
    
    var viewModel = StatisticsViewModel()
    
    private let coldStatisticCollectionView: StatisticsCollectionView = {
        let layout = StatisticFlowLayout()
        let view = StatisticsCollectionView(frame: .zero, collectionViewLayout: layout)
        return view
    }()
    
    //MARK: - Constraction
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        coldStatisticCollectionView.register(StatisticsColdWaterCollectionViewCell.self,
                                             forCellWithReuseIdentifier: "Cold")
        self.coldStatisticCollectionView.reloadData()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
        viewModel.getData { [weak self] model in
            guard let self else { return }
            let dataSource = StatisticsCollectionViewDataSourse(reuseIndetifier: "Cold", meters: model)
            self.coldStatisticCollectionView.delegate = self
            self.coldStatisticCollectionView.dataSource = dataSource
            self.coldStatisticCollectionView.reloadData()
        } failture: { error in
            print(error.description)
        }
        
        self.coldStatisticCollectionView.delegate = self
        self.coldStatisticCollectionView.dataSource = self
    }
}

//MARK: - Extention

extension StatisticsView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.meters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cold", for: indexPath) as? StatisticsColdWaterCollectionViewCell else { return UICollectionViewCell() }
        let model = viewModel.meters[indexPath.row]
        cell.configureCell(model)
        return cell
    }
    
    
}


