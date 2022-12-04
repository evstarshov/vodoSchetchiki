//
//  SecondMainView.swift
//  vodoSchetchiki
//
//  Created by Mac on 04.12.2022.
//

import UIKit

final class MainView: UIView {
    
    //MARK: - Private properties
    
    private  var hotWaterTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints =  false
        textField.indent(size: 20)
        textField.backgroundColor = UIColor.textFieldColor
        textField.layer.cornerRadius = 5
        textField.attributedPlaceholder = NSAttributedString(string: "Горячая вода",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return textField
    }()
    
    private  var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Введите показания"
        label.font = UIFont.systemFont(ofSize: 30)
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        return label
    }()
    
    private  var coldWaterTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.indent(size: 20)
        textField.backgroundColor = UIColor.textFieldColor
        textField.layer.cornerRadius = 5
        textField.attributedPlaceholder = NSAttributedString(string: "Холодная вода",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return textField
    }()
    
    private  var warningLabel: WarningLabel = {
        let label = WarningLabel()
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
    
    private  var sentIndicationsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.mainColor
        button.addTarget(MainView.self, action: #selector(sendNotification), for: .touchUpInside)
        button.setTitle("Отправить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
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
    
    @objc private func sendNotification() {
        NotificationCenter.default.post(name: Notification.Name("Send"), object: nil)
    }
    
    private func setupView() {
        self.addSubview(titleLabel)
        self.addSubview(hotWaterTextField)
        self.addSubview(coldWaterTextField)
        self.addSubview(warningLabel)
        self.addSubview(sentIndicationsButton)
        self.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 150),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            
            warningLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100),
            warningLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            warningLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            warningLabel.heightAnchor.constraint(equalToConstant: 100),
            
            hotWaterTextField.topAnchor.constraint(equalTo: warningLabel.bottomAnchor, constant: 30),
            hotWaterTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            hotWaterTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            hotWaterTextField.heightAnchor.constraint(equalToConstant: 40),
            
            coldWaterTextField.topAnchor.constraint(equalTo: hotWaterTextField.bottomAnchor, constant: 30),
            coldWaterTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            coldWaterTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            coldWaterTextField.heightAnchor.constraint(equalToConstant: 40),
            
            sentIndicationsButton.topAnchor.constraint(equalTo: coldWaterTextField.bottomAnchor, constant: 40),
            sentIndicationsButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            sentIndicationsButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            sentIndicationsButton.heightAnchor.constraint(equalToConstant: 60)
            
        ])
    }
}
