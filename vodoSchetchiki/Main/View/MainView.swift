//
//  SecondMainView.swift
//  vodoSchetchiki
//
//  Created by Mac on 04.12.2022.
//

import UIKit

final class MainView: UIView {
    
    //MARK: - Private properties
    
    private var catImage: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "cat")
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
    
    private(set) var hotWaterTextField: UITextView = {
        let textField = UITextView()
        textField.translatesAutoresizingMaskIntoConstraints =  false
        textField.font = UIFont.systemFont(ofSize: 22)
        textField.text = "Горячая вода"
        textField.textColor = .white
        textField.backgroundColor = UIColor.textFieldColor
        textField.layer.cornerRadius = 5
        textField.keyboardType = .phonePad
        textField.isScrollEnabled = false
        return textField
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Сдайте показания до 20 числа текущего месяца"
        label.font = UIFont.systemFont(ofSize: 25)
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textColor = .white
        label.numberOfLines = 0
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
        textField.isScrollEnabled = false
        return textField
    }()
    
    private var warningLabel: BaseLabel = {
        let label = BaseLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        label.text = "Введите показания"
        label.font = UIFont.systemFont(ofSize: 25)
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.backgroundColor = UIColor.mainColor
        label.textColor = .white
        label.layer.cornerRadius = 14
        return label
    }()
    
    private(set) var sentMetersButton: BaseButton = {
        let button = BaseButton()
        button.setTitle("Отправить", for: .normal)
        button.startAnimatingPressActions()
        return button
    }()
    
    //MARK: - Constraction
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        sentMetersButton.addTarget(self, action: #selector(sendNotification), for: .touchUpInside)
        
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
        backgroundColor = UIColor.mainBacgroundColor
        
        addSubview(catImage)
        addSubview(secondView)
        addSubview(titleLabel)
        addSubview(hotWaterTextField)
        addSubview(coldWaterTextField)
        addSubview(warningLabel)
        addSubview(sentMetersButton)
        
        NSLayoutConstraint.activate([
            
            catImage.topAnchor.constraint(equalTo: topAnchor, constant: 130),
            catImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            catImage.heightAnchor.constraint(equalToConstant: 100),
            catImage.widthAnchor.constraint(equalToConstant: 100),

            secondView.topAnchor.constraint(equalTo: warningLabel.topAnchor, constant: -60),
            secondView.leadingAnchor.constraint(equalTo: leadingAnchor),
            secondView.trailingAnchor.constraint(equalTo: trailingAnchor),
            secondView.heightAnchor.constraint(equalToConstant: 750),
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 350),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            warningLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            warningLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            warningLabel.heightAnchor.constraint(equalToConstant: 60),
            
            hotWaterTextField.topAnchor.constraint(equalTo: warningLabel.bottomAnchor, constant: 30),
            hotWaterTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            hotWaterTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            hotWaterTextField.heightAnchor.constraint(equalToConstant: 40),
            
            coldWaterTextField.topAnchor.constraint(equalTo: hotWaterTextField.bottomAnchor, constant: 30),
            coldWaterTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            coldWaterTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            coldWaterTextField.heightAnchor.constraint(equalToConstant: 40),
            
            sentMetersButton.topAnchor.constraint(equalTo: coldWaterTextField.bottomAnchor, constant: 40),
            sentMetersButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            sentMetersButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            sentMetersButton.bottomAnchor.constraint(equalTo: keyboardLayoutGuide.topAnchor, constant: -20),
            sentMetersButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
