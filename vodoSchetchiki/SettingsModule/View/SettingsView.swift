//
//  SettingsView.swift
//  vodoSchetchiki
//
//  Created by Mac on 16.11.2022.
//

import UIKit

class SettingsView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    private lazy var settingView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var settingImage: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.tintColor = UIColor.mainColor
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "gearshape.2.fill")
        return image
    }()
    
    private lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.indent(size: 20)
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 5
        textField.placeholder = "Ваше имя"
        return textField
    }()
    
    private lazy var usersLastNameTextField: UITextField = {
        let textField = UITextField()
        textField.indent(size: 20)
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 5
        textField.placeholder = "Ваша фамилия"
        return textField
    }()
    
    private lazy var apartmentAddressTextField: UITextField = {
        let textField = UITextField()
        textField.indent(size: 20)
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 5
        textField.placeholder = "Ваш адрес"
        return textField
    }()
    
    private lazy var apartmentNumberTextField: UITextField = {
        let textField = UITextField()
        textField.indent(size: 20)
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 5
        textField.placeholder = "Номер квартиры"
        return textField
    }()
    
    private lazy var saveSettingButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.mainColor
        button.setTitle("Сохранить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func initialize() {
        self.addSubview(settingView)
        self.addSubview(settingImage)
        self.addSubview(usernameTextField)
        self.addSubview(usersLastNameTextField)
        self.addSubview(apartmentNumberTextField)
        self.addSubview(apartmentAddressTextField)
        self.addSubview(saveSettingButton)
        
        settingImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.centerX.equalToSuperview()
            make.height.greaterThanOrEqualTo(130)
            make.width.greaterThanOrEqualTo(130)
        }
        
        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(settingImage.snp.bottom).offset(100)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.greaterThanOrEqualTo(40)
        }
        
        usersLastNameTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.greaterThanOrEqualTo(40)
        }
        
        apartmentAddressTextField.snp.makeConstraints { make in
            make.top.equalTo(usersLastNameTextField.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.greaterThanOrEqualTo(40)
        }
        
        apartmentNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(apartmentAddressTextField.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.greaterThanOrEqualTo(40)
        }
        
        saveSettingButton.snp.makeConstraints { make in
            make.top.equalTo(apartmentNumberTextField.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().offset(-60)
            make.height.greaterThanOrEqualTo(60)
        }
    }
}
