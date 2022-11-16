//
//  ViewController.swift
//  vodoSchetchiki
//
//  Created by Евгений Старшов on 13.11.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var mainView: MainView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
    }
    
    override func loadView() {
        self.view = mainView
        
    }


}

