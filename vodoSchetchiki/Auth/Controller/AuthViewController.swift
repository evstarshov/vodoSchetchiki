//
//  AuthViewController.swift
//  vodoSchetchiki
//
//  Created by Mac on 11.12.2022.
//

import UIKit
import FlagPhoneNumber
import FirebaseAuth

protocol AuthViewControllerDelegate: AnyObject {
    func showVerificationView(from: AuthViewController, verificationID: String)
    func showTabBarView(from: AuthViewController)
}

class AuthViewController: UIViewController {
    
    //MARK: -  Properties
    
    var authView: AuthView?
    var phoneNumber: String!
    
    weak var coordinatorDelegate: AuthViewControllerDelegate?
    
    //MARK: - Private properties
    
    private var listController: FPNCountryListViewController!
    
    //MARK: - LifeCycle
    
    override func loadView() {
        view = authView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        swipeDown()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(sendVerificationCode),
                                               name: .notificationVerification,
                                               object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        DispatchQueue.main.async {
            if Auth.auth().currentUser?.uid != nil {
                self.coordinatorDelegate?.showTabBarView(from: self)
            }
        }
    }
    
    //MARK: - Private functions
    
    private func swipeDown() {
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.hideKeyboardOnSwipeDown))
        swipeDown.delegate = self
        swipeDown.direction =  UISwipeGestureRecognizer.Direction.down
        self.authView?.addGestureRecognizer(swipeDown)
    }
    
    @objc private func hideKeyboardOnSwipeDown() {
        view.endEditing(true)
    }
    
    @objc private func sendVerificationCode(nitification: Notification) {
        
        guard let phoneNumber = phoneNumber else { return }
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
            if error != nil {
                print(error ?? "")
            } else {
                self.goToVerification(verificationID: verificationID ?? "")
            }
        }
    }
    
    private func goToVerification(verificationID: String) {
        coordinatorDelegate?.showVerificationView(from: self, verificationID: verificationID)
    }
    
    private func configure() {
        listController = FPNCountryListViewController(style: .grouped)
        listController?.setup(repository: (authView?.phoneNumberTextField.countryRepository)!)
        
        authView?.phoneNumberTextField.delegate = self
        listController.didSelect = { [weak self] country in
            guard let self else { return }
            self.authView?.phoneNumberTextField.setFlag(countryCode: country.code)
        }
    }
}

//MARK: - Extension

extension AuthViewController: FPNTextFieldDelegate {
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        //
    }
    
    func fpnDidValidatePhoneNumber(textField: FlagPhoneNumber.FPNTextField, isValid: Bool) {
        if isValid {
            authView?.phoneNumberButton.alpha = 1
            authView?.phoneNumberButton.isEnabled = true
            authView?.phoneNumberButton.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
            authView?.phoneNumberButton.layer.shadowRadius = 3
            authView?.phoneNumberButton.layer.shadowOpacity = 0.2
            authView?.phoneNumberButton.layer.shadowColor = UIColor.black.cgColor
            phoneNumber = textField.getFormattedPhoneNumber(format: .International)
        } else {
            authView?.phoneNumberButton.alpha = 0.5
            authView?.phoneNumberButton.isEnabled = false
        }
    }
    
    func fpnDisplayCountryList() {
        let navigation = UINavigationController(rootViewController: listController)
        listController.title = "Страны"
        authView?.phoneNumberTextField.text = ""
        present(navigation, animated: true)
    }
}

extension AuthViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return true
    }
}
