//
//  SettingsViewController.swift
//  vodoSchetchiki
//
//  Created by Mac on 16.11.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //MARK: - private properties
    
    private let settingView = SettingsView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = settingView
    }
    
}

