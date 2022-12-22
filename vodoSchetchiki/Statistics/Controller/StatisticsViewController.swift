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
    var viewModel = StatisticsViewModel()
    
    
    //MARK: - Constraction
    
    override func loadView() {
        view = statisticView
    }
    
    override func viewDidLoad() {
        viewModel.getData()
    }

}


