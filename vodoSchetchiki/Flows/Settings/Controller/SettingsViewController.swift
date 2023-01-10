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
    private var service = FirebaseService()

    override func viewDidLoad() {
        super.viewDidLoad()
        swipeDown()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(logOut),
                                               name: .notificationLogOut,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(saveUserData),
                                               name: .saveUserData,
                                               object: nil)
    }
    
    override func loadView() {
        view = settingView
    }
    
    //MARK: - Private function
    
    private func swipeDown() {
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.hideKeyboardOnSwipeDown))
        swipeDown.delegate = self
        swipeDown.direction =  UISwipeGestureRecognizer.Direction.down
        self.settingView.addGestureRecognizer(swipeDown)
    }
    
    @objc private func hideKeyboardOnSwipeDown() {
        view.endEditing(true)
    }
        
    @objc private func saveUserData(notification: Notification) {

        service.saveUserData(name: settingView.usernameTextField.text ?? "deaful",
                             secondName: settingView.usersLastNameTextField.text ?? "deaful",
                             flatNumber: settingView.apartmentNumberTextField.text ?? "deaful",
                             address: settingView.apartmentAddressTextField.text ?? "deaful")
    }
    
    @objc private func logOut(notification: Notification) {
        do {
            try Auth.auth().signOut()
            errorAlert(title: "Вы вышли из аккаунта", message: "")
        } catch {
            errorAlert(title: "Error", message: "Что то пошло не так")
        }
    }
}

//MARK: - Extension

extension SettingsViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return true
    }
}



