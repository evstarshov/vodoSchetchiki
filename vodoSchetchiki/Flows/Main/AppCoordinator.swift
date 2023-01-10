//
//  AppCoordinator.swift
//  vodoSchetchiki
//
//  Created by Евгений Старшов on 18.12.2022.
//

import Foundation
import UIKit


protocol AppCoordinatorProtocol: Coordinator {
    func showLoginFlow()
    func showMainFlow()
}


class AppCoordinator {

    var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var type: CoordinatorType {
        .app
    }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: true)
    }
    
    func start() {
        showLoginFlow()
    }
    
    
}

extension AppCoordinator: AppCoordinatorProtocol {

    func showLoginFlow() {
        let loginCoordinator = LoginCoordinator(navigationController)
        loginCoordinator.finishDelegate = self
        loginCoordinator.start()
        loginCoordinator.childCoordinators.append(loginCoordinator)
        
    }
    
    func showMainFlow() {
        let tabCoordinator = TabCoordinator.init(navigationController)
        tabCoordinator.finishDelegate = self
        tabCoordinator.start()
        childCoordinators.append(tabCoordinator)
    }
    
}

extension AppCoordinator: CoordinatorFinishDelegate {
    
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })
        switch childCoordinator.type {
        case .login:
            navigationController.viewControllers.removeAll()
            showMainFlow()
        case .tab:
            navigationController.viewControllers.removeAll()
            showLoginFlow()
        default:
            break
        }
    }
  
}
