//
//  SettingsViewController.swift
//  vodoSchetchiki
//
//  Created by Mac on 16.11.2022.
//

import UIKit
import FirebaseAuth

protocol SettingsViewControllerDelegate: AnyObject {
    func deinitUser(from: SettingsViewController)
}

class SettingsViewController: UIViewController {
    
    //MARK: - private properties
    
    private let settingView = SettingsView()
    private weak var coordinator: SettingsViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(logOut), name: .notificationLogOut, object: nil)
    }
    
    override func loadView() {
        view = settingView
    }
    
    //MARK: - Private function
    
    @objc private func logOut(notification: Notification) {
        do {
            try Auth.auth().signOut()
            coordinator?.deinitUser(from: self)
        } catch {
            errorAlert(title: "Error", message: "")
        }
    }
}



