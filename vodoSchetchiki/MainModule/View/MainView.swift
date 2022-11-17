//
//  MainView.swift
//  vodoSchetchiki
//
//  Created by Mac on 16.11.2022.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    weak var coordinator: Coordinator?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    
    
    private var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    

    
    private var hotWaterTextField: UITextField = {
        let textField = UITextField()
        textField.indent(size: 20)
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 5
        textField.placeholder = "Горячая вода"
        return textField
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите показания"
        label.font = UIFont.systemFont(ofSize: 30)
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        return label
    }()
    
    private var coldWaterTextField: UITextField = {
        let textField = UITextField()
        textField.indent(size: 20)
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 5
        textField.placeholder = "Холодная вода"
        return textField
    }()
    
    private var warningLabel: WarningLabel = {
        let label = WarningLabel()
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
    
    private var sentIndicationsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.mainColor
        button.setTitle("Отправить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private func initialize() {
        self.addSubview(mainView)
        self.addSubview(hotWaterTextField)
        self.addSubview(titleLabel)
        self.addSubview(coldWaterTextField)
        self.addSubview(warningLabel)
        self.addSubview(sentIndicationsButton)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(350)
            make.left.equalToSuperview().inset(30)
            
        }
        
        warningLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.greaterThanOrEqualTo(100)
        }
        
        hotWaterTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).inset(60)
            make.left.equalToSuperview().inset(30)
            make.right.equalToSuperview().inset(30)
            make.height.greaterThanOrEqualTo(40)
        }
        
        coldWaterTextField.snp.makeConstraints { make in
            make.top.equalTo(hotWaterTextField).inset(60)
            make.left.equalToSuperview().inset(30)
            make.right.equalToSuperview().inset(30)
            make.height.greaterThanOrEqualTo(40)
        }
        
        mainView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.bottom.equalToSuperview().offset(0)
        }
        
        sentIndicationsButton.snp.makeConstraints { make in
            make.top.equalTo(coldWaterTextField.snp.bottom).inset(-40)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().offset(-60)
            make.height.greaterThanOrEqualTo(60)
        }
        
    }
    
}
