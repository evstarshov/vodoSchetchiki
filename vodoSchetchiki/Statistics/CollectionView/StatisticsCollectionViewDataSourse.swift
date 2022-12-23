//
//  StatisticsCollectionViewDataSourse.swift
//  vodoSchetchiki
//
//  Created by Mac on 12.12.2022.
//

import UIKit

class StatisticsCollectionViewDataSourse: NSObject, UICollectionViewDataSource {
    
   private var reuseIndetifier: String
    private var meters: [MetersModel]
 
    init(reuseIndetifier: String, meters: [MetersModel]) {
        self.reuseIndetifier = reuseIndetifier
        self.meters = meters
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  meters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIndetifier, for: indexPath) as? StatisticsColdWaterCollectionViewCell else { return UICollectionViewCell() }
        let model = meters[indexPath.row]
        cell.configureCell(model)
        return cell
    }
}
