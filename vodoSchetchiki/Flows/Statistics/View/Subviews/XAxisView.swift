//
//  XAxisView.swift
//  vodoSchetchiki
//
//  Created by Mac on 02.01.2023.
//

import UIKit

class XAxisView: UIView {
    
    private let mounths = ["янв","фев","март","апр","май","июнь","июль","авг","сен","окт","ноя","дек"]
    
    private var stackView: UIStackView = {
       let view = UIStackView()
        view.distribution = .equalSpacing
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(stackView)
        
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        
        mounths.forEach {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 10)
            label.text = $0.uppercased()
            label.textColor = .black
            label.textAlignment = .center
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
