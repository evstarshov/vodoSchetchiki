//
//  ViewController.swift
//  vodoSchetchiki
//
//  Created by Евгений Старшов on 13.11.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let mainView = MainView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        self.view = mainView

    }


}

