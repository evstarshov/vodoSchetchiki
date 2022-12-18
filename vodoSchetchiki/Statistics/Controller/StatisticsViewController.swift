//
//  TestViewController.swift
//  vodoSchetchiki
//
//  Created by Mac on 06.12.2022.
//

import UIKit

class StatisticsViewController: UIViewController {
    
    //MARK: - Private properties
    
    let statisticView = StatisticsView()
    
    //MARK: - Constraction
    
    override func loadView() {
        view = statisticView
    }
    
    override func viewDidLoad() {

    }
    
    //MARK: - Private functions

    private func coldSetupCollectionView() {



    }
}

//MARK: - Extentions

extension StatisticsViewController: UICollectionViewDelegate {
    


}
