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
    
    //MARK: - Private properties
    
    private var catImage: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "welcomeCat")
        return image
    }()
    
    private var secondView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowRadius = 5
        view.layer.shadowOffset = CGSize(width: 1.3, height: 1.3)
        view.layer.shadowOpacity = 3
        view.layer.shadowColor = UIColor.black.cgColor
        return view
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Добро пожаловать!"
        label.font = UIFont.systemFont(ofSize: 30)
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private var warningLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Введите ваш номер"
        label.font = UIFont.systemFont(ofSize: 30)
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()

    
    private(set) var phoneNumberTextField: FPNTextField = {
        let textField = FPNTextField()
        textField.backgroundColor = UIColor.textFieldColor
        textField.displayMode = .list
        textField.layer.cornerRadius = 5
        textField.keyboardType = .phonePad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private(set) var phoneNumberButton: BaseButton = {
        let button = BaseButton()
        button.setTitle("Войти", for: .normal)
        button.startAnimatingPressActions()
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
        NotificationCenter.default.post(name: .notificationVerification, object: nil)
    }
    
    private func setupView() {
        backgroundColor = UIColor.mainBacgroundColor
        
        addSubview(catImage)
        addSubview(secondView)
        addSubview(warningLabel)
        addSubview(titleLabel)
        addSubview(phoneNumberTextField)
        addSubview(phoneNumberButton)
        
        NSLayoutConstraint.activate([
            
            catImage.topAnchor.constraint(equalTo: topAnchor, constant: 130),
            catImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            catImage.heightAnchor.constraint(equalToConstant: 100),
            catImage.widthAnchor.constraint(equalToConstant: 100),
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 250),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 95),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            
            warningLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            warningLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -350),
            warningLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            warningLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            secondView.topAnchor.constraint(equalTo: phoneNumberTextField.topAnchor, constant: -60),
            secondView.leadingAnchor.constraint(equalTo: leadingAnchor),
            secondView.trailingAnchor.constraint(equalTo: trailingAnchor),
            secondView.heightAnchor.constraint(equalToConstant: 750),
            
            phoneNumberTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            phoneNumberTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            phoneNumberTextField.heightAnchor.constraint(equalToConstant: 40),
            
            phoneNumberButton.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 40),
            phoneNumberButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            phoneNumberButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            phoneNumberButton.heightAnchor.constraint(equalToConstant: 60),
            phoneNumberButton.bottomAnchor.constraint(equalTo: keyboardLayoutGuide.topAnchor, constant: -100)
        
        ])
        
    }
}
