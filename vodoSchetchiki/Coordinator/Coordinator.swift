//
//  Coordinator.swift
//  vodoSchetchiki
//
//  Created by Mac on 16.11.2022.
//

import Foundation
import UIKit
import FlagPhoneNumber

/// Deprecated

//class AppCoordinator {
//    
//    // MARK: - Properies
//    
//    internal var parentController: AppCoordinator?
//    internal var navigation: UINavigationController
//    
//    // MARK: - Init
//    
//    init(navigation: UINavigationController) {
//        self.navigation = navigation
//    }
//}
//
//// MARK: - Extention
//
//extension AppCoordinator: Coo {
//    
//    //MARK: - Public functions
//    
//    public func start() {
//        goAuthController()
//    }
//    
//    public func goTabBar(fromVC: VerificationViewController) {
//        let tb = MainTabBarController()
//        navigation.pushViewController(tb, animated: true)
//    }
//    
//    public func ifUserDidAuth(fromVC: AuthViewController) {
//        let tb = MainTabBarController()
//        navigation.pushViewController(tb, animated: true)
//    }
//    
//    public func ifUserDeinit(from: SettingsViewController) {
//        let vc = AuthViewController()
//        let view = AuthView()
//        vc.coordinatorDelegate = self
//        vc.authView = view
//        navigation.pushViewController(vc, animated: true)
//    }
//    
//    //MARK: - Private functions
//    
//    private func goAuthController() {
//        let vc = AuthViewController()
//        let view = AuthView()
//        vc.coordinatorDelegate = self
//        vc.authView = view
//        navigation.pushViewController(vc, animated: true)
//    }
//    
//
//}

