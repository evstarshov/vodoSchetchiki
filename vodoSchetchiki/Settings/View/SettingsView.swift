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
    
    var coordinator: Coordinator?
    
    //MARK: - Privete properties
    
    private var settingImage: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.tintColor = UIColor.mainColor
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "gearshape.2.fill")
        return image
    }()
    
    private var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.indent(size: 20)
        textField.backgroundColor = UIColor.textFieldColor
        textField.layer.cornerRadius = 5
        textField.attributedPlaceholder = NSAttributedString(string: "Ваше имя",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return textField
    }()
    
    private var usersLastNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.indent(size: 20)
        textField.backgroundColor = UIColor.textFieldColor
        textField.layer.cornerRadius = 5
        textField.attributedPlaceholder = NSAttributedString(string: "Ваша фамилия",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return textField
    }()
    
    private var apartmentAddressTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.indent(size: 20)
        textField.backgroundColor = UIColor.textFieldColor
        textField.layer.cornerRadius = 5
        textField.attributedPlaceholder = NSAttributedString(string: "Ваш адрес",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return textField
    }()
    
    private var apartmentNumberTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.indent(size: 20)
        textField.backgroundColor = UIColor.textFieldColor
        textField.layer.cornerRadius = 5
        textField.attributedPlaceholder = NSAttributedString(string: "Номер квартиры",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return textField
    }()
    
    private var saveSettingButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.mainColor
        button.setTitle("Сохранить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var exitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "ExitImage"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(logOut), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
 
    //MARK: - Constraction

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    //MARK: - Private functions
    
    @objc private func logOut() {
        do {
            try Auth.auth().signOut()
            coordinator?.start()
        } catch {
            
        }
    }
    
    private func setupView() {
        addSubview(settingImage)
        addSubview(usernameTextField)
        addSubview(usersLastNameTextField)
        addSubview(apartmentNumberTextField)
        addSubview(apartmentAddressTextField)
        addSubview(saveSettingButton)
        addSubview(exitButton)
        
        backgroundColor = .white
        
        NSLayoutConstraint.activate([
            exitButton.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            exitButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            exitButton.heightAnchor.constraint(equalToConstant: 30),
            exitButton.widthAnchor.constraint(equalToConstant: 30),
            
            settingImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            settingImage.topAnchor.constraint(equalTo: topAnchor, constant: 150),
            settingImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            settingImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            settingImage.heightAnchor.constraint(equalToConstant: 120),
            
            usernameTextField.topAnchor.constraint(equalTo: settingImage.bottomAnchor, constant: 30),
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
            saveSettingButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            saveSettingButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            saveSettingButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
