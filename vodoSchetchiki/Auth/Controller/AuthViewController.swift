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
}

class AuthViewController: UIViewController {
    
    //MARK: -  Properties
    
    var authView: AuthView?
    var coordinator: Coordinator?
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
        NotificationCenter.default.addObserver(self, selector: #selector(sendVerificationCode), name: .notificationVerification, object: nil)
    }
    
    //MARK: - Private functions
    
    @objc private func sendVerificationCode(nitification: Notification) {
        
        guard let phoneNumber = phoneNumber else { return }
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
            if error != nil {
                print(error ?? "Shit..")
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
