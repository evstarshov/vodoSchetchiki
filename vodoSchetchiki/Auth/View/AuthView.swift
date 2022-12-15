//
//  AuthView.swift
//  vodoSchetchiki
//
//  Created by Mac on 11.12.2022.
//

import UIKit
import FirebaseAuth
import FlagPhoneNumber

class AuthView: UIView {
    
    //MARK: - Properties
    
    weak var coordinator: Coordinator?
    
    //MARK: - Private properties
    
    private(set) var phoneNumberTextField: FPNTextField = {
        let textField = FPNTextField()
        textField.backgroundColor = UIColor.textFieldColor
        textField.displayMode = .list
        textField.layer.cornerRadius = 5
        textField.keyboardType = .phonePad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private(set) var phoneNumberButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.mainColor
        button.setTitle("Отправить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = false
        button.alpha = 0.5
        return button
    }()
    
    //MARK: - Constraction
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        phoneNumberButton.addTarget(self, action: #selector(goVerificationView), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    //MARK: - Private functions
    
    @objc private func goVerificationView() {
        coordinator?.goVerificationView()
    }
    
    private func setupView() {
        backgroundColor = .white
        
        addSubview(phoneNumberTextField)
        addSubview(phoneNumberButton)
        
        NSLayoutConstraint.activate([
            phoneNumberTextField.topAnchor.constraint(equalTo: topAnchor, constant: 400),
            phoneNumberTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            phoneNumberTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            phoneNumberTextField.heightAnchor.constraint(equalToConstant: 40),
            
            phoneNumberButton.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 40),
            phoneNumberButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            phoneNumberButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            phoneNumberButton.heightAnchor.constraint(equalToConstant: 60)
        
        ])
        
    }
}
