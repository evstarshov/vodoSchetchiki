//
//  Coordinator.swift
//  vodoSchetchiki
//
//  Created by Mac on 16.11.2022.
//

import Foundation
import UIKit

class Coordinator: AppCoordinator {
    var parentController: AppCoordinator?
    
    var navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func start() {
//        setNavigationControllers()
    }
    
//    private func setMainView() {
//        let vc = MainViewController()
//        let view = MainView()
//        view.coordinator = self
//        vc.mainView = view
//        navigation.pushViewController(vc, animated: true)
//
//    }
//
//    private func setNavigationControllers() -> [UINavigationController] {
//        let mainVC = MainViewController()
//        let settingsVC = SettingsViewController()
//        let statisticsVC = StatisticsViewController()
//
//        let mainNC = UINavigationController(rootViewController: mainVC)
//        let settingsNC = UINavigationController(rootViewController: settingsVC)
//        let statisticsNC = UINavigationController(rootViewController: statisticsVC)
//
//        let setNC = [mainNC, settingsNC, statisticsNC]
//        return setNC
//
//    }
    
    
}
