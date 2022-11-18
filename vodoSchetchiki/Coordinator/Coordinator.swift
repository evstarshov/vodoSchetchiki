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
        setMainView()
    }
    
    private func setMainView() {
        let vc = MainViewController()
        let view = MainView()
        view.coordinator = self
        vc.mainView = view
        navigation.pushViewController(vc, animated: true)
    
    }
    
    
}
