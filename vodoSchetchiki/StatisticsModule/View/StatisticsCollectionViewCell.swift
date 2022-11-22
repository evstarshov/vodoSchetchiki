//
//  StatisticsView.swift
//  vodoSchetchiki
//
//  Created by Mac on 16.11.2022.
//

import UIKit
import SnapKit

class StatisticsCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    //MARK: - элементы UI
    private lazy var coldWaterLabel: UILabel = {
       let label = UILabel()
        label.backgroundColor = .blue
        return label
    }()
    
    private lazy var hotWaterLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        return label
    }()
    
    //MARK: - Функция инициализации элементов View
    
    func initialize() {
        backgroundColor = .white
        self.addSubview(coldWaterLabel)
        self.addSubview(hotWaterLabel)
        
        coldWaterLabel.snp.makeConstraints { make in
            
            //TODO: - Нужно написать функцию, которая будет принимать в себя данные, отправленные пользователем, и конвертировать их в отступ make.top.equalToSuperview().inset(?) вот в этой переменной
            
            make.top.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(150)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        hotWaterLabel.snp.makeConstraints { make in
            make.top.equalTo(coldWaterLabel.snp.bottom).inset(0)
            make.leading.trailing.equalToSuperview()
            
            //TODO: - Нужно написать функцию, которая будет принимать в себя данные, отправленные пользователем, и конвертировать их в отступ make.bottom.equalToSuperview().inset(?) вот в этой переменной
            
            make.bottom.equalToSuperview().inset(30)
            
        }
    }
    
}


