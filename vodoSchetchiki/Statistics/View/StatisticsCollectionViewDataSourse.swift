//
//  StatisticsCollectionViewDataSourse.swift
//  vodoSchetchiki
//
//  Created by Mac on 12.12.2022.
//

import UIKit

class StatisticsCollectionViewDataSourse: NSObject, UICollectionViewDataSource {
    
   private var reuseIndetifier: String
    
    init(reuseIndetifier: String) {
        self.reuseIndetifier = reuseIndetifier
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIndetifier, for: indexPath) as? ColdStatisticsCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Indentifier.indentifierColdStatisticCollectionView , for: indexPath) as! ColdStatisticsCollectionViewCell
//        cell.backgroundColor = .red
//        return cell
//    }
}


