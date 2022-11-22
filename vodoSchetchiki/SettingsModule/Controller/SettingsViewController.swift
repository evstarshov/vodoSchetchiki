//
//  SettingsViewController.swift
//  vodoSchetchiki
//
//  Created by Mac on 16.11.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private let settingView = SettingsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    override func loadView() {
        self.view = settingView
    }
    
}
