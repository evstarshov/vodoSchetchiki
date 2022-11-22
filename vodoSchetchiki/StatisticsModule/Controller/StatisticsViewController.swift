//
//  StatisticsViewController.swift
//  vodoSchetchiki
//
//  Created by Mac on 16.11.2022.
//

import UIKit

class StatisticsViewController: UIViewController {
    
    private var statisticsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCollectionView()
    }

    private func createCollectionView() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 200, left: 30, bottom: 400, right: 150)
        layout.itemSize = CGSize(width: 50, height: 300)
        
        //TODO: - Нужно понять, как сделать скролл не слева на право, а наоборот
        
        layout.scrollDirection = .horizontal
        
        statisticsCollectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        statisticsCollectionView.dataSource = self
        statisticsCollectionView.delegate = self
        statisticsCollectionView.register(StatisticsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        statisticsCollectionView.showsHorizontalScrollIndicator = false
        statisticsCollectionView.backgroundColor = .white

        self.view.addSubview(statisticsCollectionView)
    }
}

extension StatisticsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = statisticsCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return cell
    }
}
