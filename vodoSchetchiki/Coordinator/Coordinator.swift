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
    
    public func goTabBar(fromVC: VerificationViewController) {
        let tb = MainTabBarController()
        navigation.pushViewController(tb, animated: true)
    }
    
    public func ifUserDidAuth(fromVC: AuthViewController) {
        let tb = MainTabBarController()
        navigation.pushViewController(tb, animated: true)
    }
    
    public func ifUserDeinit(from: SettingsViewController) {
        let vc = AuthViewController()
        let view = AuthView()
        vc.coordinatorDelegate = self
        vc.authView = view
        navigation.pushViewController(vc, animated: true)
    }
    
    //MARK: - Private functions
    
    private func goAuthController() {
        let vc = AuthViewController()
        let view = AuthView()
        vc.coordinatorDelegate = self
        vc.authView = view
        navigation.pushViewController(vc, animated: true)
    }
    
    private func goToVerification(fromVC: AuthViewController, verificationID: String) {
        let vc = VerificationViewController()
        let view = VerificationView()
        vc.verificationView = view
        vc.verificationView?.verificationID = verificationID
        vc.modalPresentationStyle = .currentContext
        vc.coordinatorDelegate = self
        navigation.pushViewController(vc, animated: true)
    }
}


extension Coordinator: VerificationViewDelegate {
    
    func goToMain(from: VerificationViewController) {
        goTabBar(fromVC: from)
    }
}


extension Coordinator: AuthViewControllerDelegate {
    func showTabBarView(from: AuthViewController) {
        ifUserDidAuth(fromVC: from)
    }
    
    func showVerificationView(from: AuthViewController, verificationID: String) {
        goToVerification(fromVC: from, verificationID: verificationID)
    }
}

extension Coordinator: SettingsViewControllerDelegate {
    func deinitUser(from: SettingsViewController) {
        ifUserDeinit(from: from)
    }
    
    
}

