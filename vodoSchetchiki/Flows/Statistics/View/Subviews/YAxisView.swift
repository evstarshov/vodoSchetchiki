//
//  YAxisView.swift
//  vodoSchetchiki
//
//  Created by Mac on 02.01.2023.
//

import UIKit

class YAxisView: UIView {

    private var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(with data: [MetersModel]) {
        addSubview(stackView)
        
        let maxColdMeter = data
            .filter({ Int($0.coldMeter) ?? 0 > 10}) //Не нравится логика фильтрования, можно ли сделать красивее?
            .max { first, second in first.coldMeter < second.coldMeter}

        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        
        (0...(Int(maxColdMeter?.coldMeter ?? "0") ?? 10)).reversed().forEach {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 10)
            label.text = "\($0 )"
            label.textAlignment = .center
            label.textColor = UIColor.black
            stackView.addArrangedSubview(label)
        }
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

