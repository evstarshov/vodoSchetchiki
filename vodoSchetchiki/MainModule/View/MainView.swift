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
    
    private var hotWaterTextField: UITextField = {
       let textField = UITextField()
        textField.font = UIFont.boldSystemFont(ofSize: 20)
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 5
        textField.placeholder = "Введите показания"
        return textField
    }()

    
    private func initialize() {
        self.addSubview(hotWaterTextField)
        
        hotWaterTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(200)
            make.left.equalToSuperview().inset(30)
            make.right.equalToSuperview().inset(30)
            make.height.greaterThanOrEqualTo(40)
        }
        
    }
    
}
