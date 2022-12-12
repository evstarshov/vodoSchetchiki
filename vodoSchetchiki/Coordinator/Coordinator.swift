//
//  Coordinator.swift
//  vodoSchetchiki
//
//  Created by Mac on 16.11.2022.
//

import Foundation
import UIKit
import FlagPhoneNumber

class Coordinator {
    
    // MARK: - Properies
    
    internal var parentController: AppCoordinator?
    internal var navigation: UINavigationController
    
    // MARK: - Init
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
}

// MARK: - Extention

extension Coordinator: AppCoordinator {
    
    //MARK: - Public functions
    
    public func start() {
        goAuthController()
    }
    
    public func goVerificationView() {
        let vc = VerificationViewController()
        let view = VerificationView()
        view.coordinator = self
        vc.verificationView = view
        navigation.pushViewController(vc, animated: true)
    }
    
    public func goTabBar() {
        let tb = MainViewController()
        navigation.pushViewController(tb, animated: true)
    }
    
    //MARK: - Private functions
    
    private func goAuthController() {
        let vc = AuthViewController()
        let view = AuthView()
        view.coordinator = self
        vc.authView = view
        navigation.pushViewController(vc, animated: true)
    }
}
