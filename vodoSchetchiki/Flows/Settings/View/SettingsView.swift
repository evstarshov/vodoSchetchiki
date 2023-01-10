//
//  SettingsView.swift
//  vodoSchetchiki
//
//  Created by Mac on 16.11.2022.
//

import UIKit
import FirebaseAuth

class SettingsView: UIView {
    
    //MARK: - Properties
    
    //MARK: - Privete properties
    
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
    
    private var catImage: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "cat2")
        return image
    }()
    
    private(set) var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.indent(size: 20)
        textField.backgroundColor = UIColor.textFieldColor
        textField.layer.cornerRadius = 5
        textField.attributedPlaceholder = NSAttributedString(string: "Ваше имя",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return textField
    }()
    
    private(set) var usersLastNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.indent(size: 20)
        textField.backgroundColor = UIColor.textFieldColor
        textField.layer.cornerRadius = 5
        textField.attributedPlaceholder = NSAttributedString(string: "Ваша фамилия",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return textField
    }()
    
    private(set) var apartmentAddressTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.indent(size: 20)
        textField.backgroundColor = UIColor.textFieldColor
        textField.layer.cornerRadius = 5
        textField.attributedPlaceholder = NSAttributedString(string: "Ваш адрес",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return textField
    }()
    
    private(set) var apartmentNumberTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.indent(size: 20)
        textField.backgroundColor = UIColor.textFieldColor
        textField.layer.cornerRadius = 5
        textField.attributedPlaceholder = NSAttributedString(string: "Номер квартиры",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return textField
    }()
    
    private var saveSettingButton: BaseButton = {
        let button = BaseButton()
        button.setTitle("Сохранить", for: .normal)
        button.startAnimatingPressActions()
        button.isEnabled = true
        return button
    }()
    
    private var exitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "ExitImage"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.point(inside: CGPoint(x: 100, y: 100), with: .none)
        return button
    }()
    
    //MARK: - Constraction
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        saveSettingButton.addTarget(self, action: #selector(saveUserData), for: .touchUpInside)
        exitButton.addTarget(self, action: #selector(logOut), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    //MARK: - Private functions
    
    @objc private func logOut() {
        NotificationCenter.default.post(name: .notificationLogOut, object: nil)
    }
    
    @objc private func saveUserData() {
        NotificationCenter.default.post(name: .saveUserData, object: nil)
    }
    
    private func setupView() {
        addSubview(secondView)
        addSubview(catImage)
        addSubview(exitButton)
        addSubview(usernameTextField)
        addSubview(usersLastNameTextField)
        addSubview(apartmentNumberTextField)
        addSubview(apartmentAddressTextField)
        addSubview(saveSettingButton)
        
        backgroundColor = UIColor.mainBacgroundColor
        
        NSLayoutConstraint.activate([
            
            catImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            catImage.heightAnchor.constraint(equalToConstant: 100),
            catImage.bottomAnchor.constraint(equalTo: secondView.topAnchor, constant: -20),
            catImage.widthAnchor.constraint(equalToConstant: 100),
            
            exitButton.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            exitButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            exitButton.heightAnchor.constraint(equalToConstant: 30),
            exitButton.widthAnchor.constraint(equalToConstant: 30),
            
            secondView.topAnchor.constraint(equalTo: usernameTextField.topAnchor, constant: -60),
            secondView.leadingAnchor.constraint(equalTo: leadingAnchor),
            secondView.trailingAnchor.constraint(equalTo: trailingAnchor),
            secondView.heightAnchor.constraint(equalToConstant: 750),
            
            usernameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            usernameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            usernameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            usersLastNameTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 30),
            usersLastNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            usersLastNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            usersLastNameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            apartmentNumberTextField.topAnchor.constraint(equalTo: usersLastNameTextField.bottomAnchor, constant: 30),
            apartmentNumberTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            apartmentNumberTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            apartmentNumberTextField.heightAnchor.constraint(equalToConstant: 40),
            
            apartmentAddressTextField.topAnchor.constraint(equalTo: apartmentNumberTextField.bottomAnchor, constant: 30),
            apartmentAddressTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            apartmentAddressTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            apartmentAddressTextField.heightAnchor.constraint(equalToConstant: 40),
            
            saveSettingButton.topAnchor.constraint(equalTo: apartmentAddressTextField.bottomAnchor, constant: 40),
            saveSettingButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            saveSettingButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            saveSettingButton.bottomAnchor.constraint(equalTo: keyboardLayoutGuide.topAnchor, constant: -20),
            saveSettingButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
