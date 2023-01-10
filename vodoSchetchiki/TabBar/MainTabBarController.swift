//
//  MainTabBarController.swift
//  vodoSchetchiki
//
//  Created by Mac on 16.11.2022.
//

import UIKit

enum TabBarPage {
    case statistics
    case main
    case settings

    init?(index: Int) {
        switch index {
        case 0:
            self = .statistics
        case 1:
            self = .main
        case 2:
            self = .settings
        default:
            return nil
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .statistics:
            return "Статистика"
        case .main:
            return "Показания"
        case .settings:
            return "Настройки"
        }
    }

    func pageOrderNumber() -> Int {
        switch self {
        case .statistics:
            return 0
        case .main:
            return 1
        case .settings:
            return 2
        }
    }
    
    func pageTitleImage() -> UIImage {
        switch self {
        case .statistics:
            return UIImage(systemName: "person.fill") ?? UIImage()
        case .main:
            return UIImage(systemName: "house.fill") ?? UIImage()
        case .settings:
            return UIImage(systemName: "slider.horizontal.3") ?? UIImage()
            
        }
    }
}
