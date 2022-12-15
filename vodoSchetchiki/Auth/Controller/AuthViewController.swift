//
//  AuthViewController.swift
//  vodoSchetchiki
//
//  Created by Mac on 11.12.2022.
//

import UIKit
import FlagPhoneNumber

class AuthViewController: UIViewController {
    
    //MARK: -  Properties
    
    var authView: AuthView?
    var coordinator: Coordinator?
    var phoneNumber: String?
    
    //MARK: - Private properties
    
    private var listController: FPNCountryListViewController!
    
    //MARK: - LifeCycle
    
    override func loadView() {
        view = authView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //MARK: - Private functions
    
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
