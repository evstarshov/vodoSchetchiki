//
//  SecondMainView.swift
//  vodoSchetchiki
//
//  Created by Mac on 04.12.2022.
//

import UIKit

final class MainView: UIView {
    
    //MARK: - Private properties
    
    private(set) var hotWaterTextField: UITextView = {
        let textField = UITextView()
        textField.translatesAutoresizingMaskIntoConstraints =  false
        textField.font = UIFont.systemFont(ofSize: 22)
        textField.text = "Горячая вода"
        textField.textColor = .white
        textField.backgroundColor = UIColor.textFieldColor
        textField.layer.cornerRadius = 5
        textField.keyboardType = .phonePad
        return textField
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Введите показания"
        label.font = UIFont.systemFont(ofSize: 30)
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        return label
    }()
    
    private(set) var coldWaterTextField: UITextView = {
        let textField = UITextView()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 22)
        textField.text = "Холодная вода"
        textField.textColor = .white
        textField.backgroundColor = UIColor.textFieldColor
        textField.layer.cornerRadius = 5
        textField.keyboardType = .phonePad
        return textField
    }()
    
    private var warningLabel: BaseLabel = {
        let label = BaseLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = " Сдайте показания до 20 числа текущего месяца"
        label.font = UIFont.systemFont(ofSize: 25)
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.backgroundColor = UIColor.mainColor
        label.textColor = .white
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 8
        label.numberOfLines = 0
        return label
    }()
    
    private(set) var sentIndicationsButton: BaseButton = {
        let button = BaseButton()
        button.addTarget(self, action: #selector(sendNotification), for: .touchUpInside)
        button.setTitle("Отправить", for: .normal)
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
    
    @objc private func sendNotification() {
        NotificationCenter.default.post(name: .notificationFromTButton, object: nil)
    }
    
    private func setupView() {
        backgroundColor = .white
        
        addSubview(titleLabel)
        addSubview(hotWaterTextField)
        addSubview(coldWaterTextField)
        addSubview(warningLabel)
        addSubview(sentIndicationsButton)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 150),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            warningLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100),
            warningLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            warningLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            warningLabel.heightAnchor.constraint(equalToConstant: 100),
            
            hotWaterTextField.topAnchor.constraint(equalTo: warningLabel.bottomAnchor, constant: 30),
            hotWaterTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            hotWaterTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            hotWaterTextField.heightAnchor.constraint(equalToConstant: 40),
            
            coldWaterTextField.topAnchor.constraint(equalTo: hotWaterTextField.bottomAnchor, constant: 30),
            coldWaterTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            coldWaterTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            coldWaterTextField.heightAnchor.constraint(equalToConstant: 40),
            
            sentIndicationsButton.topAnchor.constraint(equalTo: coldWaterTextField.bottomAnchor, constant: 40),
            sentIndicationsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            sentIndicationsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            sentIndicationsButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
