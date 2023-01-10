//
//  BaseButton.swift
//  vodoSchetchiki
//
//  Created by Mac on 17.12.2022.
//

import UIKit

class BaseButton: UIButton {
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.mainColor
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 16
        isEnabled = false
        alpha = 0.5
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
