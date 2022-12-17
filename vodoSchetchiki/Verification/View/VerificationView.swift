//
//  VerificationView.swift
//  vodoSchetchiki
//
//  Created by Mac on 11.12.2022.
//

import UIKit
import FirebaseAuth

class VerificationView: UIView {
    
    //MARK: - Properties
    
    var coordinator: Coordinator?
    var verificationID: String?
    
    
    //MARK: - Private properties
    
    private var titleLabel: BaseLabel = {
        let label = BaseLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Введите код из смс"
        label.font = UIFont.systemFont(ofSize: 25)
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        label.backgroundColor = UIColor.mainColor
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        return label
    }()
    
    private(set) var verificationTextView: UITextView = {
        let text = UITextView()
        text.font = UIFont.systemFont(ofSize: 22)
        text.backgroundColor = UIColor.textFieldColor
        text.layer.cornerRadius = 5
        text.keyboardType = .phonePad
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private(set) var sentVerificationCodeButton: BaseButton = {
        let button = BaseButton()
        button.addTarget(self, action: #selector(goTabBar), for: .touchUpInside)
        button.setTitle("Проверить код", for: .normal)
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
    
    @objc private func goTabBar() {
        guard let code = verificationTextView.text else { return }
        let credentional = PhoneAuthProvider.provider().credential(withVerificationID: verificationID ?? "", verificationCode: code)
        Auth.auth().signIn(with: credentional) { [ weak self ] _, error in
            guard let self else { return }
            if error != nil {
                print(error ?? "Shit")
            } else {
                NotificationCenter.default.post(name: .notificationTabBar, object: nil)
            }
        }
    }
    
    private func setupView() {
        backgroundColor = .white
        
        addSubview(titleLabel)
        addSubview(verificationTextView)
        addSubview(sentVerificationCodeButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 200),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            titleLabel.heightAnchor.constraint(equalToConstant: 100),
            
            verificationTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            verificationTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            verificationTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            verificationTextView.heightAnchor.constraint(equalToConstant: 100),
            
            sentVerificationCodeButton.topAnchor.constraint(equalTo: verificationTextView.bottomAnchor, constant: 30),
            sentVerificationCodeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            sentVerificationCodeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            sentVerificationCodeButton.heightAnchor.constraint(equalToConstant: 60)
            
            
        ])
    }
}
