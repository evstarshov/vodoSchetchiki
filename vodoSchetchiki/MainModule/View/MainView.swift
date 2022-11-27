//
//  MainView.swift
//  vodoSchetchiki
//
//  Created by Mac on 16.11.2022.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    //MARK: - initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    //MARK: - creating UI elements
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var hotWaterTextField: UITextField = {
        let textField = UITextField()
        textField.indent(size: 20)
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 5
        textField.placeholder = "Горячая вода"
        return textField
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите показания"
        label.font = UIFont.systemFont(ofSize: 30)
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        return label
    }()
    
    private lazy var coldWaterTextField: UITextField = {
        let textField = UITextField()
        textField.indent(size: 20)
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 5
        textField.placeholder = "Холодная вода"
        return textField
    }()
    
    private lazy var warningLabel: WarningLabel = {
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
    
    private lazy var sentIndicationsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.mainColor
        button.setTitle("Отправить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - private func initialize UI elements and setup layuot
    
    private func initialize() {
        self.addSubview(mainView)
        self.addSubview(hotWaterTextField)
        self.addSubview(titleLabel)
        self.addSubview(coldWaterTextField)
        self.addSubview(warningLabel)
        self.addSubview(sentIndicationsButton)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(350)
            make.leading.equalToSuperview().inset(30)
        }
        
        warningLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(200)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.greaterThanOrEqualTo(100)
        }
        
        hotWaterTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).inset(60)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.greaterThanOrEqualTo(40)
        }
        
        coldWaterTextField.snp.makeConstraints { make in
            make.top.equalTo(hotWaterTextField).inset(60)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.greaterThanOrEqualTo(40)
        }
        
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(0)
        }
        
        sentIndicationsButton.snp.makeConstraints { make in
            make.top.equalTo(coldWaterTextField.snp.bottom).inset(-40)
            make.leading.trailing.equalToSuperview().inset(60)
            make.height.greaterThanOrEqualTo(60)
        }
    }
}
