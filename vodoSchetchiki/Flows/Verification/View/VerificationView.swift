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
    
    private var titleLabel: BaseLabel = {
        let label = BaseLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Введите код из смс"
        label.font = UIFont.systemFont(ofSize: 30)
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        return label
    }()
    
    private(set) var verificationTextView: UITextView = {
        let text = UITextView()
        text.font = UIFont.systemFont(ofSize: 30)
        text.backgroundColor = UIColor.textFieldColor
        text.layer.cornerRadius = 5
        text.textColor = .darkGray
        text.keyboardType = .phonePad
        text.textAlignment = .center
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textContentType = .oneTimeCode
        text.isScrollEnabled = false
        return text
    }()
    
    private(set) var sentVerificationCodeButton: BaseButton = {
        let button = BaseButton()
        button.addTarget(self, action: #selector(goTabBar), for: .touchUpInside)
        button.setTitle("Проверить код", for: .normal)
        button.startAnimatingPressActions()
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
        Auth.auth().signIn(with: credentional) { _, error in
            if error != nil {
                print(error ?? "Error")
            } else {
                NotificationCenter.default.post(name: .notificationTabBar, object: nil)
            }
        }
    }
    
    private func setupView() {
        backgroundColor = UIColor.mainBacgroundColor
        addSubview(secondView)
        addSubview(titleLabel)
        addSubview(verificationTextView)
        addSubview(sentVerificationCodeButton)
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 200),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            titleLabel.heightAnchor.constraint(equalToConstant: 100),
            
            secondView.topAnchor.constraint(equalTo: verificationTextView.topAnchor, constant: -60),
            secondView.leadingAnchor.constraint(equalTo: leadingAnchor),
            secondView.trailingAnchor.constraint(equalTo: trailingAnchor),
            secondView.heightAnchor.constraint(equalToConstant: 300),
            
            verificationTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            verificationTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            verificationTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            verificationTextView.heightAnchor.constraint(equalToConstant: 60),
            
            sentVerificationCodeButton.topAnchor.constraint(equalTo: verificationTextView.bottomAnchor, constant: 30),
            sentVerificationCodeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            sentVerificationCodeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            sentVerificationCodeButton.heightAnchor.constraint(equalToConstant: 60)
            
            
        ])
    }
}
